//
//  KCPhoto.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhoto.h"

@implementation KCPhoto

+ (NSArray *)photosWithImages:(NSArray *)imagesArray {
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:imagesArray.count];
    
    for (UIImage *image in imagesArray) {
        if ([image isKindOfClass:[UIImage class]]) {
            KCPhoto *photo = [KCPhoto photoWithImage:image];
            [photos addObject:photo];
        }
    }
    
    return photos;
}

+ (NSArray *)photosWithURLs:(NSArray *)urlsArray
{
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:urlsArray.count];
    
    for (id url in urlsArray) {
        if ([url isKindOfClass:[NSURL class]]) {
            KCPhoto *photo = [KCPhoto photoWithURL:url];
            [photos addObject:photo];
        }
        else if ([url isKindOfClass:[NSString class]]) {
            KCPhoto *photo = [KCPhoto photoWithURL:[NSURL URLWithString:url]];
            [photos addObject:photo];
        }
    }
    
    return photos;

}

+ (instancetype)photoWithURL:(NSURL *)url
{
    return [[self alloc] initWithURL:url];
}

+ (instancetype)photoWithImage:(UIImage *)image
{
    
    return [[self alloc] initWithImage:image];
}

- (instancetype)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        
        self.url = url;
        
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        
        self.image = image;
        
    }
    return self;
}

@end
