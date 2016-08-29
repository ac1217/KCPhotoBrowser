//
//  KCPhotoBrowser.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "KCPhoto.h"

@interface KCPhotoBrowser : UIViewController

- (instancetype)initWithPhotos:(NSArray <KCPhoto *>*)photos currentIndex:(NSInteger)idx sourceViewBlock:(UIView *(^)(NSInteger index))sourceViewBlock;

@property (nonatomic, assign, readonly) NSInteger currentIndex;

- (void)addAction:(UIAlertAction *)action;

@property (nonatomic, strong, readonly) NSArray <UIAlertAction *>*actions;

@end
