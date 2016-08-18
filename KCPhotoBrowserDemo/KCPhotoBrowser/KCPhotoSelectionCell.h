//
//  KCPhotoSelectionCell.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCPhoto.h"

extern NSString *const KCPhotoSelectionCellReuseID;
@interface KCPhotoSelectionCell : UICollectionViewCell

@property (nonatomic, strong) KCPhoto *photo;
@end
