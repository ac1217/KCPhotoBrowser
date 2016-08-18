//
//  KCPhotoBrowser.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "KCPhoto.h"


@protocol KCPhotoBrowserDataSource <NSObject>

@required
- (UIView *)sourceViewAtIndex:(NSInteger)index;

@end

@interface KCPhotoBrowser : UIViewController

- (instancetype)initWithPhotos:(NSArray <KCPhoto *>*)photos currentIndex:(NSInteger)idx;

@property (nonatomic, weak) id<KCPhotoBrowserDataSource> dataSource;

@property (nonatomic, assign, readonly) NSInteger currentIndex;

- (void)addAction:(UIAlertAction *)action;

@property (nonatomic, strong, readonly) NSArray <UIAlertAction *>*actions;

@end
