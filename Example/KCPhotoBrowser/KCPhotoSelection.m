//
//  KCPhotoSelection.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoSelection.h"
#import "KCPhotoBrowser.h"
#import "KCPhotoSelectionCell.h"

@interface KCPhotoSelection ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *photos;
@end

@implementation KCPhotoSelection

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        _columns = 3;
        _margin = 5;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.collectionView];
    
    
}


#pragma mark -UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KCPhotoSelectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCPhotoSelectionCellReuseID forIndexPath:indexPath];
    
    cell.photo = self.photos[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     KCPhotoBrowser *browser =[[KCPhotoBrowser alloc] initWithPhotos:self.photos currentIndex:indexPath.item sourceImageViewBlock:^UIImageView *(NSInteger index) {
        
        return [[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]] valueForKey:@"imageView"];
    }];
    
    
    [self presentViewController:browser animated:YES completion:nil];
}

#pragma mark -KCPhotoBrowserDataSource
- (UIView *)sourceViewAtIndex:(NSInteger)index
{
    KCPhotoSelectionCell *cell = (KCPhotoSelectionCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    return [cell valueForKey:@"imageView"];
}


#pragma mark -Getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = [UIScreen mainScreen].bounds;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [_collectionView registerClass:[KCPhotoSelectionCell class] forCellWithReuseIdentifier:KCPhotoSelectionCellReuseID];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(self.margin, self.margin, self.margin, self.margin);
        
       _flowLayout.minimumLineSpacing = self.margin;
        _flowLayout.minimumInteritemSpacing = self.margin;
        
        CGFloat itemWH = (self.collectionView.frame.size.width - _flowLayout.sectionInset.left - _flowLayout.sectionInset.right - (self.columns - 1) * _flowLayout.minimumLineSpacing) / self.columns;
        
        
        _flowLayout.itemSize = CGSizeMake(itemWH, itemWH);

    }
    return _flowLayout;
}


- (NSArray *)photos
{
    if (!_photos) {
        
        NSMutableArray *tmp = @[].mutableCopy;
            
            KCPhoto *photo0 = [[KCPhoto alloc] initWithURL:@"http://img2.3lian.com/2014/f4/86/d/134.jpg"];
            
            KCPhoto *photo1 = [[KCPhoto alloc] initWithURL:@"http://ww2.sinaimg.cn/crop.0.0.980.300/b70b4830gw1ejuw3tbjtpj20r808c43f.jpg"];
            
            KCPhoto *photo2 = [[KCPhoto alloc] initWithURL:@"http://file.cbda.cn/uploadfile/2015/0330/20150330041852447.jpg"];
            
            KCPhoto *photo3 = [[KCPhoto alloc] initWithURL:@"http://s3.sinaimg.cn/orignal/4c2da0e108f5f97486912"];
            
            KCPhoto *photo4 = [[KCPhoto alloc] initWithURL:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1471577406&di=e6235621a7140b926a3b53e417223157&src=http://p2.qhimg.com/t011fc13354f12d1a46.jpg"];
            
//            
            photo0.placeholderImage = [UIImage imageNamed:@"photo1"];
            photo1.placeholderImage = [UIImage imageNamed:@"photo2"];
            photo2.placeholderImage = [UIImage imageNamed:@"photo3"];
            photo2.placeholderImage = [UIImage imageNamed:@"photo4"];
            photo2.placeholderImage = [UIImage imageNamed:@"photo5"];
            
            [tmp addObject:photo0];
            [tmp addObject:photo1];
            [tmp addObject:photo2];
            [tmp addObject:photo3];
            [tmp addObject:photo4];
        
        
        _photos = tmp;
        
    }
    return _photos;
}

@end
