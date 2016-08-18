//
//  KCPhotoActionController.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/17.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoActionController.h"

static CGFloat const AnimationDuration = 0.25;

@interface KCPhotoActionController ()
@property (nonatomic, weak) UIView *targetView;

@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UITableView *actionView;


@end

@implementation KCPhotoActionController

- (instancetype)initWithTargetView:(UIView *)targetView
{
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        self.targetView = targetView;
    }
    return self;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.actionView];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGRect targetFrame = [self.targetView.superview convertRect:self.targetView.frame toView:self.view];
    
    CGFloat margin = 7;
    CGFloat bgW = self.bgView.image.size.width;
    
    CGFloat actionW = bgW - 2 * margin;
    CGFloat actionH = self.actionView.rowHeight * 4;
    
    self.actionView.frame = CGRectMake(margin, margin, actionW, actionH);
    
    CGFloat bgH = actionH + 3 * margin;
    
    CGFloat bgX = CGRectGetMidX(targetFrame) - bgW * 0.5;
    CGFloat bgY = targetFrame.origin.y - bgH;
    
    self.bgView.frame = CGRectMake(bgX, bgY, bgW, bgH);
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self show];
}

- (void)show
{
    
    self.bgView.transform = CGAffineTransformMakeScale(1, 0);
    self.bgView.alpha = 1;
    
    [UIView animateWithDuration:AnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.bgView.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}

- (void)dismiss
{
    [UIView animateWithDuration:AnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.bgView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}


#pragma mark -Getter
- (UIImageView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"action_bg"]];
        _bgView.userInteractionEnabled = YES;
        _bgView.layer.anchorPoint = CGPointMake(0.5, 1);
    }
    return _bgView;
}

- (UITableView *)actionView
{
    if (!_actionView) {
        _actionView = [[UITableView alloc] init];
        _actionView.rowHeight = 35;
    }
    return _actionView;
}

@end
