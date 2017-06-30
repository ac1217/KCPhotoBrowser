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

@interface KCPhotoBrowser : UIViewController

- (instancetype)initWithPhotos:(NSArray <KCPhoto *>*)photos currentIndex:(NSInteger)idx sourceImageViewBlock:(UIImageView *(^)(NSInteger index))block;


- (UIImageView *)sourceImageView;
- (UIImageView *)displayImageView;



@property (nonatomic,assign) BOOL hidesIndicatorForSingle;

@property (nonatomic,assign) KCPhotoBrowserIndicatorPosition indicatorPosition;
@property (nonatomic,assign) KCPhotoBrowserIndicatorStyle indicatorStyle;

@property (nonatomic, assign, readonly) NSInteger currentIndex;

@property (nonatomic, strong) NSArray <UIAlertAction *>*actions;

@end
