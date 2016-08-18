//
//  KCPhoto.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCPhoto : NSObject

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *placeholderImage;

+ (instancetype)photoWithImage:(UIImage *)image;
+ (instancetype)photoWithURL:(NSURL *)url;

+ (NSArray *)photosWithImages:(NSArray *)imagesArray;
+ (NSArray *)photosWithURLs:(NSArray *)urlsArray;

- (instancetype)initWithImage:(UIImage *)image;
- (instancetype)initWithURL:(NSURL *)url;

@end
