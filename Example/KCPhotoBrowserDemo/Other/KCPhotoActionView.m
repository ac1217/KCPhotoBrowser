//
//  KCPhotoBrowserActionView.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/17.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoActionView.h"

static CGFloat const KCPhotoActionViewActionHeight = 35;

@interface KCPhotoActionView (){
    NSMutableArray *_actions;
}

@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UITableView *actionView;

@end

@implementation KCPhotoActionView

- (void)addAction:(KCPhotoAction *)action
{
    [_actions addObject:action];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _actions = @[].mutableCopy;
        
        [self addSubview:self.bgView];
        [self addSubview:self.actionView];
        
        self.layer.anchorPoint = CGPointMake(0.5, 1);
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgView.frame = self.bounds;
    
    self.actionView.frame = CGRectMake(5, 5, self.bounds.size.width - 10, self.bounds.size.height - 15);
}

- (void)showForItem:(UIView *)item inView:(UIView *)view
{
    
    CGFloat w = 100;
    CGFloat h = 4 * KCPhotoActionViewActionHeight + 15;
    CGRect itemFrame = [item.superview convertRect:item.frame toView:view];
    
    CGFloat x = CGRectGetMidX(itemFrame) - w * 0.5;
    CGFloat y = itemFrame.origin.y - h;
    
    self.frame = CGRectMake(x, y, w, h);
    
    self.transform = CGAffineTransformMakeScale(1, 0);
    
    [view addSubview:self];
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}

- (void)dismiss
{
    
}

#pragma mark -Getter
- (UIImageView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"action_bg"]];
    }
    return _bgView;
}

- (UITableView *)actionView
{
    if (!_actionView) {
        _actionView = [[UITableView alloc] init];
        _actionView.rowHeight = KCPhotoActionViewActionHeight;
    }
    return _actionView;
}


@end
