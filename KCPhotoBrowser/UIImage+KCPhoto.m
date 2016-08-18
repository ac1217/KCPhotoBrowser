//
//  UIImage+KCPhoto.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/15.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "UIImage+KCPhoto.h"

@implementation UIImage (KCPhoto)


- (CGSize)kc_imageDisplaySize
{
    
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    if (width > screenW) {
        
        width = screenW;
        height = width * self.size.height / self.size.width;
        
    }
    
    return CGSizeMake(width, height);
}

- (CGRect)kc_imageDisplayFrame
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    CGSize imageSize = self.kc_imageDisplaySize;
    
    CGFloat x = (screenW - imageSize.width) * 0.5;
    CGFloat y = (screenH - imageSize.height) * 0.5;
    
    return CGRectMake(x, y, imageSize.width, imageSize.height);
}


+ (UIImage *)kc_imageWithNamed:(NSString *)named
{
    if ([UIScreen mainScreen].bounds.size.width == 414) {
        
        named = [named stringByAppendingString:@"@3x"];
    }else {
        
        named = [named stringByAppendingString:@"@2x"];
    }
    
    
    NSBundle *resourceBundle = [NSBundle bundleForClass:NSClassFromString(@"KCPhoto")];
    
    NSString *resourcePath = [resourceBundle pathForResource:@"KCPhotoBrowser" ofType:@"bundle"];
    
    if (resourcePath) {
        resourceBundle = [NSBundle bundleWithPath:resourcePath];
    }
    
    resourcePath = [resourceBundle pathForResource:named ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:resourcePath];
    
}

@end
