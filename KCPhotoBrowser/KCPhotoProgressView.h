//
//  KCPhotoProgressView.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/16.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCPhotoProgressView : UIView

@property (nonatomic, assign) double progress;

@property (nonatomic, assign, getter=isAutoHidden) BOOL autoHidden;

@end
