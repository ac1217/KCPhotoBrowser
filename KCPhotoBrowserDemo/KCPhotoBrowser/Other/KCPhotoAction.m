//
//  KCPhotoBrowserAction.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/17.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoAction.h"

@interface KCPhotoAction ()

@property (nonatomic, copy) void(^Handle)(KCPhotoAction *action);


@end

@implementation KCPhotoAction


+ (instancetype)actionWithTitle:(NSString *)title image:(UIImage *)image handle:(void(^)(KCPhotoAction *action))handle
{
    KCPhotoAction *action = [KCPhotoAction new];
    
    action.title = title;
    action.image = image;
    action.Handle = handle;
    
    return action;
}

@end
