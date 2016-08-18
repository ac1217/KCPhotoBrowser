//
//  KCPhotoBrowser.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoBrowser.h"
#import "KCPhotoBrowserCell.h"
#import "KCPhotoTransition.h"

@interface KCPhotoBrowser ()<UIViewControllerTransitioningDelegate,UICollectionViewDataSource, UICollectionViewDelegate>{
    NSInteger _currentIndex;
}

@property (nonatomic, strong) UILabel *pageLabel;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIButton *actionBtn;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *photos;

@property (nonatomic, strong) KCPhotoTransition *dismissInteractiveTransition;

@property (nonatomic, strong) UIAlertController *sheet;

@end

@implementation KCPhotoBrowser

- (instancetype)initWithPhotos:(NSArray <KCPhoto *>*)photos currentIndex:(NSInteger)idx;
{
    if (self = [super init]) {
        
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        _photos = photos;
        _currentIndex = idx;
    }
    
    return self;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark -Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dismissInteractiveTransition];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.view addGestureRecognizer:longPress];
    
    _dismissInteractiveTransition = [KCPhotoTransition dismissInteractiveTransitionWithPresentingVC:self];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.pageLabel];
    [self.view addSubview:self.actionBtn];
    
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    
    self.pageLabel.hidden = self.photos.count <= 1;
    self.pageLabel.text = [NSString stringWithFormat:@"%zd of %zd", self.currentIndex + 1, self.photos.count];
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[self.dataSource sourceViewAtIndex:self.currentIndex] setHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    
    [[self.dataSource sourceViewAtIndex:self.currentIndex] setHidden:NO];
}

#pragma mark -Event
- (void)singleTap
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doubleTap
{
    
    KCPhotoBrowserCell *cell = (KCPhotoBrowserCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0]];
    
    [cell zooming];
    
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        [self actionBtnClick];
    }
    
}

- (void)actionBtnClick
{
    
    [self presentViewController:self.sheet animated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    UILabel *hud = [UILabel new];
    hud.layer.cornerRadius = 5;
    hud.textAlignment = NSTextAlignmentCenter;
    hud.textColor = [UIColor whiteColor];
    hud.font = [UIFont systemFontOfSize:14];
    hud.layer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75].CGColor;
    
    if (!error) {
      hud.text = @"已保存到相册";
    }else {
        hud.text = error.localizedFailureReason;
    }
    
    [hud sizeToFit];
    
    CGRect tmp = hud.frame;
    tmp.size.width += 30;
    tmp.size.height += 20;
    
    hud.frame = tmp;
    
    hud.center = self.view.center;
    hud.alpha = 0;
    [self.view addSubview:hud];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        hud.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.25 animations:^{
                
                hud.alpha = 0;
                
            } completion:^(BOOL finished) {
                [hud removeFromSuperview];
            }];
            
        });
        
        
    }];
    
}

#pragma mark -Public Method
- (void)addAction:(UIAlertAction *)action
{
    [self.sheet addAction:action];
}
- (NSArray<UIAlertAction *> *)actions
{
    return self.sheet.actions;
}

#pragma mark -UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KCPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCPhotoBrowserCellReuseID forIndexPath:indexPath];
    
    cell.photo = self.photos[indexPath.row];
    
    return cell;
}

#pragma mark -UICollectionViewDelegate

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if (self.photos.count <= 1) return;
    
    [[self.dataSource sourceViewAtIndex:self.currentIndex] setHidden:NO];
    
    _currentIndex = (NSInteger)(scrollView.contentOffset.x / (scrollView.frame.size.width) + 0.5);
    
    self.pageLabel.text = [NSString stringWithFormat:@"%zd of %zd", self.currentIndex + 1, self.photos.count];
    
    [[self.dataSource sourceViewAtIndex:self.currentIndex] setHidden:YES];
}


#pragma mark -UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [KCPhotoTransition presentTransition];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [KCPhotoTransition dismissTransition];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    
     return self.dismissInteractiveTransition.isInteracting ? self.dismissInteractiveTransition : nil;
}


#pragma mark -Getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width + self.flowLayout.minimumLineSpacing, [UIScreen mainScreen].bounds.size.height);
        
        [_collectionView registerClass:[KCPhotoBrowserCell class] forCellWithReuseIdentifier:KCPhotoBrowserCellReuseID];
        
        _collectionView.pagingEnabled = YES;

    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
        
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, _flowLayout.minimumLineSpacing);
    }
    return _flowLayout;
}

- (UILabel *)pageLabel
{
    if (!_pageLabel) {
        _pageLabel = [UILabel new];
        _pageLabel.font = [UIFont boldSystemFontOfSize:18];
        _pageLabel.textColor = [UIColor whiteColor];
        _pageLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        _pageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _pageLabel;
}

- (UIButton *)actionBtn
{
    if (!_actionBtn) {
        _actionBtn = [UIButton new];
        [_actionBtn setImage:[UIImage imageNamed:@"Resource.bundle/icon_action"] forState:UIControlStateNormal];
        [_actionBtn addTarget:self action:@selector(actionBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat wh = 64;
        CGFloat y = [UIScreen mainScreen].bounds.size.height - wh;
        CGFloat x = [UIScreen mainScreen].bounds.size.width - wh;
        
        _actionBtn.frame = CGRectMake(x, y, wh, wh);
    }
    
    return _actionBtn;
}

- (UIAlertController *)sheet
{
    if (!_sheet) {
        
        __weak typeof(self) weakSelf = self;
        _sheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [_sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        [_sheet addAction:[UIAlertAction actionWithTitle:@"保存图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            KCPhotoBrowserCell *cell = (KCPhotoBrowserCell *)[weakSelf.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:weakSelf.currentIndex inSection:0]];
            
            UIImageView *imageView = [cell valueForKey:@"imageView"];
            
            UIImageWriteToSavedPhotosAlbum(imageView.image, weakSelf, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            
        }]];

    }
    return _sheet;
}




@end
