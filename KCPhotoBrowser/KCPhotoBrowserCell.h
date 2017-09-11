//
//  KCPhotoBrowserCell.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCPhoto.h"
#import "KCPhotoProgressView.h"


extern NSString *const KCPhotoBrowserCellReuseID;

@interface KCPhotoBrowserCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) KCPhotoProgressView *progressView;

//@property (nonatomic, strong) KCPhoto *photo;


- (void)setImageResource:(id)imageResource placeholderImage:(UIImage *)placeholderImage;

- (void)zooming;

@end
