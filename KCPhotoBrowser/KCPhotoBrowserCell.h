//
//  KCPhotoBrowserCell.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCPhoto.h"


extern NSString *const KCPhotoBrowserCellReuseID;

@interface KCPhotoBrowserCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) KCPhoto *photo;

- (void)zooming;

@end
