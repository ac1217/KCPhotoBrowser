//
//  UIImage+KCPhoto.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/15.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KCPhoto)

- (CGSize)kc_imageDisplaySize;
- (CGRect)kc_imageDisplayFrame;


+ (UIImage *)kc_imageWithNamed:(NSString *)named;

@end
