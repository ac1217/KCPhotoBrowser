//
//  KCPhotoSelectionCell.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoSelectionCell.h"



NSString *const KCPhotoSelectionCellReuseID = @"KCPhotoSelectionCell";

@interface KCPhotoSelectionCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation KCPhotoSelectionCell

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
    
    [self.contentView addSubview:self.imageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}

#pragma mark -Setter
- (void)setPhoto:(KCPhoto *)photo
{
    _photo = photo;
    if (photo.image) {
        
        self.imageView.image = photo.image;
        
    }else if (photo.url) {
        
//        [self.imageView sd_setImageWithURL:photo.url placeholderImage:photo.placeholderImage options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            
//        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            
//        }];
        
    }else {
        self.imageView.image = photo.placeholderImage;
    }

}


#pragma mark -Getter

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

@end
