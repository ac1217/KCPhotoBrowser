//
//  KCPhotoBrowserAction.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/17.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCPhotoAction : NSObject

+ (instancetype)actionWithTitle:(NSString *)title image:(UIImage *)image handle:(void(^)(KCPhotoAction *action))handle;

@property (nullable, nonatomic) NSString *title;
@property (nullable, nonatomic) UIImage *image;
@end
