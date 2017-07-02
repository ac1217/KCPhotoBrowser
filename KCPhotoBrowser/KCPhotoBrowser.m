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
#import "UIImage+KCPhoto.h"

@interface KCPhotoBrowser ()<UIViewControllerTransitioningDelegate,UICollectionViewDataSource, UICollectionViewDelegate>{
    NSInteger _currentIndex;
}

@property (nonatomic, strong) UILabel *pageLabel;


@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIButton *actionBtn;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *photos;

@property (nonatomic,strong) UIView *backgroundView;


@property (nonatomic, copy) UIImageView *(^sourceImageViewBlock)(NSInteger index);


@end

@implementation KCPhotoBrowser

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    
    self.pageLabel.text = [NSString stringWithFormat:@"%zd / %zd", currentIndex + 1, self.photos.count];
    
    self.pageControl.currentPage = currentIndex;
    
    
}

- (UIImageView *)displayImageView
{
    
    KCPhotoBrowserCell *cell = self.collectionView.visibleCells.lastObject;
    return cell.imageView;
}

- (UIImageView *)sourceImageView
{
    return !self.sourceImageViewBlock ? nil : self.sourceImageViewBlock(self.currentIndex);
}

- (UIModalPresentationStyle)modalPresentationStyle
{
    return UIModalPresentationCustom;
}

- (id<UIViewControllerTransitioningDelegate>)transitioningDelegate {
    return self;
}

- (void)dealloc
{
    self.sourceImageViewBlock = nil;
}

- (instancetype)initWithPhotos:(NSArray <KCPhoto *>*)photos currentIndex:(NSInteger)idx sourceImageViewBlock:(UIImageView *(^)(NSInteger))block
{
    if (self = [super init]) {
        
        _photos = photos;
        self.currentIndex = idx;
        self.sourceImageViewBlock = block;
    }
    
    return self;
}

#pragma mark -Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.view addGestureRecognizer:longPress];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    
//    self.navigationController.navigationBarHidden = YES;
//    self.collectionView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.pageLabel];
    [self.view addSubview:self.pageControl];
    [self.view addSubview:self.actionBtn];
    
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    
    self.pageControl.numberOfPages = self.photos.count;
    
    
    switch (self.indicatorStyle) {
        case KCPhotoBrowserIndicatorStyleLabel:
        {
            self.pageControl.hidden = YES;
            
            if (self.hidesIndicatorForSingle) {
                self.pageLabel.hidden = self.photos.count < 2;
            }else {
                self.pageLabel.hidden = NO;
            }
            
        }
            break;
            
        default:{
            
            self.pageLabel.hidden = YES;
            self.pageControl.hidesForSinglePage = self.hidesIndicatorForSingle;
        }
            break;
    }
    
    switch (self.indicatorPosition) {
        case KCPhotoBrowserIndicatorPositionBottom:
        {
            self.pageLabel.frame = CGRectMake(0, self.view.bounds.size.height - self.actionBtn.frame.size.height, self.view.frame.size.width, self.actionBtn.frame.size.height);
        }
            break;
            
        default:{
            
            self.pageLabel.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.actionBtn.frame.size.height);
        }
            break;
    }
    
    self.pageControl.frame = self.pageLabel.frame;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.collectionView.hidden = self.sourceImageView != nil;
    self.view.window.windowLevel = UIWindowLevelStatusBar + 1;
    //    self.collectionView.hidden = ([self sourceImageView] != nil);
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.view.window.windowLevel = UIWindowLevelNormal;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.collectionView.hidden = NO;
    [self.sourceImageView setHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.sourceImageView setHidden:NO];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark -Event

- (void)pan:(UIPanGestureRecognizer *)pan
{
    
    CGPoint transition = [pan translationInView:self.view];
//    CGPoint transition = pan.translation(in: view)
    
    UICollectionViewCell *cell = self.collectionView.visibleCells.lastObject;
//    let cell = collectionView.visibleCells.last
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStatePossible:{
            
            if (transition.y > 30) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }else {
                [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    self.backgroundView.alpha = 1;
                    cell.transform = CGAffineTransformIdentity;
                } completion:nil];
            }
            
            
        }
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat scale = MIN(1, MAX(0.3, 1 - transition.y / [UIScreen mainScreen].bounds.size.height));
            
            CGAffineTransform transform = CGAffineTransformMakeTranslation(transition.x / scale, transition.y / scale);
            
            
            if (transition.y > 0) {
                
               transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(scale, scale));
            }
            
            self.backgroundView.alpha = scale;
            
            cell.transform = transform;
        }
            break;
            
        default:
            break;
    }
    
}

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
    
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    for (UIAlertAction *action in self.actions) {
        [sheet addAction:action];
    }
    
    [sheet addAction:[UIAlertAction actionWithTitle:@"保存图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        KCPhotoBrowserCell *cell = (KCPhotoBrowserCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0]];
        
        UIImageView *imageView = cell.imageView;
        
        UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
    }]];
    
    [self presentViewController:sheet animated:YES completion:nil];
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
    
    [self.sourceImageView setHidden:NO];
    
    self.currentIndex = (NSInteger)(scrollView.contentOffset.x / (scrollView.frame.size.width) + 0.5);
    
//    self.pageLabel.text = [NSString stringWithFormat:@"%zd / %zd", self.currentIndex + 1, self.photos.count];
    
    [self.sourceImageView setHidden:YES];
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
        [_actionBtn setImage:[UIImage kc_imageWithNamed:@"icon_action"] forState:UIControlStateNormal];
        [_actionBtn addTarget:self action:@selector(actionBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat wh = 64;
        CGFloat y = [UIScreen mainScreen].bounds.size.height - wh;
        CGFloat x = [UIScreen mainScreen].bounds.size.width - wh;
        
        _actionBtn.frame = CGRectMake(x, y, wh, wh);
    }
    
    return _actionBtn;
}

- (UIView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.frame = [UIScreen mainScreen].bounds;
    }
    return _backgroundView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        
        _pageControl.enabled = NO;
    }
    
    return _pageControl;
}



@end
