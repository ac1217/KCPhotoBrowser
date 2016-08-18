//
//  KCPhotoBrowserActionView.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/17.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KCPhotoAction.h"

@interface KCPhotoActionView : UIView

- (void)addAction:(KCPhotoAction *)action;

@property (nonatomic, strong, readonly) NSArray *actions;

- (void)showForItem:(UIView *)item inView:(UIView *)view;

@end
