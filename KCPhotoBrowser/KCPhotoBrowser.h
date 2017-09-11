//
//  KCPhotoBrowser.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "KCPhoto.h"

typedef enum : NSUInteger {
    KCPhotoBrowserIndicatorStylePageControl,
    KCPhotoBrowserIndicatorStyleLabel
} KCPhotoBrowserIndicatorStyle;

typedef enum : NSUInteger {
    KCPhotoBrowserIndicatorPositionBottom,
    KCPhotoBrowserIndicatorPositionTop
} KCPhotoBrowserIndicatorPosition;

@class KCPhotoBrowser;
@protocol KCPhotoBrowserDataSource <NSObject>

- (NSInteger)numberOfImagesInPhotoBrowser:(KCPhotoBrowser *)photoBrowser;

// 可以返回UIImage,NSString,NSURL,NSData类型
- (id)photoBrowser:(KCPhotoBrowser *)photoBrowser imageResourceAtIndex:(NSInteger)index;

@optional

- (UIImage *)photoBrowser:(KCPhotoBrowser *)photoBrowser placeholderImageAtIndex:(NSInteger)index;

- (UIImageView *)photoBrowser:(KCPhotoBrowser *)photoBrowser sourceImageViewAtIndex:(NSInteger)index;

@end

@protocol KCPhotoBrowserDelegate <NSObject>

@optional

@end

@interface KCPhotoBrowser : UIViewController

- (instancetype)initWithCurrentIndex:(NSInteger)currentIndex;

@property (nonatomic,assign, readonly) NSInteger numberOfImages;

@property (nonatomic,weak) id<KCPhotoBrowserDataSource> dataSource;
@property (nonatomic,weak) id<KCPhotoBrowserDelegate> delegate;

@property (nonatomic,strong, readonly) UIImageView *currentSourceImageView;
@property (nonatomic,strong, readonly) UIImageView *currentDisplayImageView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,assign) BOOL hidesIndicatorForSingle;

@property (nonatomic,assign) KCPhotoBrowserIndicatorPosition indicatorPosition;
@property (nonatomic,assign) KCPhotoBrowserIndicatorStyle indicatorStyle;

@property (nonatomic, assign, readonly) NSInteger currentIndex;

@property (nonatomic, strong) NSArray <UIAlertAction *>*actions;

- (instancetype)initWithPhotos:(NSArray <KCPhoto *>*)photos currentIndex:(NSInteger)idx sourceImageViewBlock:(UIImageView *(^)(NSInteger index))block;

@end
