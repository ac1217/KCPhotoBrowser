//
//  KCPhotoBrowserCell.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoBrowserCell.h"
#import "UIImage+KCPhoto.h"
#import "UIImageView+WebCache.h"
//#import "YYWebImage.h"

NSString *const KCPhotoBrowserCellReuseID = @"KCPhotoBrowserCell";

@interface KCPhotoBrowserCell ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation KCPhotoBrowserCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setup];
}

#pragma mark -Private Method
- (void)setup
{
    [self.contentView addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.imageView];
    
    [self.contentView addSubview:self.progressView];
}

- (void)layoutImageView
{
    self.scrollView.zoomScale = 1;
    self.scrollView.minimumZoomScale = 1;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.contentSize = CGSizeZero;
    
    CGSize displayImgSize = self.imageView.image.kc_imageDisplaySize;
    
    CGFloat width = displayImgSize.width;
    CGFloat height = displayImgSize.height;
    
    if (width > self.imageView.image.size.width) {
        
        self.scrollView.maximumZoomScale = width / self.imageView.image.size.width;
    }
    
    CGFloat insetH = (self.contentView.frame.size.width - width) * 0.5;
    CGFloat insetV = (self.contentView.frame.size.height - height) * 0.5;
    
    if (insetH < 0) {
        insetH = 0;
    }
    
    if (insetV < 0) {
        insetV = 0;
    }
    
    self.scrollView.contentInset = UIEdgeInsetsMake(insetV, insetH, insetV, insetH);
    
    self.scrollView.contentSize = CGSizeMake(width, height);
    
//    [UIView animateWithDuration:0.25
//                     animations:^{
     
                         self.imageView.frame =  CGRectMake(0, 0, width, height);
//                     }];
    
   
}

#pragma mark -UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    CGSize imgSize = self.imageView.frame.size;
    
    CGFloat width = imgSize.width;
    CGFloat height = imgSize.height;
    
    CGFloat insetH = (self.contentView.frame.size.width - width) * 0.5;
    CGFloat insetV = (self.contentView.frame.size.height - height) * 0.5;
    
    
    if (insetH < 0) {
        insetH = 0;
    }
    
    if (insetV < 0) {
        insetV = 0;
    }
    
    self.scrollView.contentInset = UIEdgeInsetsMake(insetV, insetH, insetV, insetH);
    
    
}

#pragma mark -Event
- (void)zooming
{
    if (self.scrollView.zoomScale == self.scrollView.maximumZoomScale) {
        
        [self.scrollView setZoomScale:1 animated:YES];
    }else {
        
        [self.scrollView setZoomScale:self.scrollView.maximumZoomScale animated:YES];
    }
    
}

#pragma mark -Setter

- (void)setImageResource:(id)imageResource placeholderImage:(UIImage *)placeholderImage
{
    
    self.progressView.progress = 0;
    if ([imageResource isKindOfClass:[UIImage class]]) {
        
        self.imageView.image = imageResource;
        [self layoutImageView];
        self.progressView.progress = 1;
        
    }else if ([imageResource isKindOfClass:[NSURL class]]) {
        
        [self.imageView sd_setImageWithPreviousCachedImageWithURL:imageResource placeholderImage:placeholderImage options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
            self.progressView.progress = (double)receivedSize / expectedSize;
            
        } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            self.progressView.progress = 1;
            [self layoutImageView];
        }];
        
    }else if ([imageResource isKindOfClass:[NSString class]]) {
        
        
        [self.imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:imageResource] placeholderImage:placeholderImage options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
            self.progressView.progress = (double)receivedSize / expectedSize;
            
        } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            self.progressView.progress = 1;
            [self layoutImageView];
        }];
    }else if ([imageResource isKindOfClass:[NSData class]]) {
        
        self.imageView.image = [UIImage imageWithData:imageResource];
        [self layoutImageView];
        self.progressView.progress = 1;
        
        
    }
    
}

/*
- (void)setPhoto:(KCPhoto *)photo
{
    _photo = photo;
    
    self.progressView.progress = 0;
    if (photo.image) {
        
        self.imageView.image = photo.image;
        [self layoutImageView];
        self.progressView.progress = 1;
        
    }else if (photo.url) {
        
        [self.imageView sd_setImageWithPreviousCachedImageWithURL:photo.url placeholderImage:photo.placeholderImage options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
            self.progressView.progress = (double)receivedSize / expectedSize;
            
        } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            self.progressView.progress = 1;
            [self layoutImageView];
        }];
        
    }else {
        self.imageView.image = photo.placeholderImage;
        self.progressView.progress = 1;
    }
    
    
}*/

#pragma mark -Getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.frame = self.contentView.bounds;
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
    }
    return _scrollView;
}

- (KCPhotoProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [KCPhotoProgressView new];
        _progressView.frame = CGRectMake(0, 0, 50, 50);
        _progressView.center = self.contentView.center;
    }
    return _progressView;
}

@end
