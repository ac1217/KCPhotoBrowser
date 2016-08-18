//
//  KCPhotoProgressView.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/16.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoProgressView.h"

@interface KCPhotoProgressView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@property (nonatomic, strong) UILabel *progressLabel;

@end

@implementation KCPhotoProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.autoHidden = YES;
        
        [self addSubview:self.progressLabel];
        
        [self.layer addSublayer:self.circleLayer];
        
        self.progress = 1;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.circleLayer.frame = self.layer.bounds;
    self.progressLabel.frame = self.bounds;
    
    CGFloat radius = self.layer.bounds.size.width * 0.5;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layer.bounds.size.width * 0.5, self.layer.bounds.size.height * 0.5) radius:radius startAngle:-M_PI_2 endAngle:M_PI * 1.5 clockwise:1];
    _circleLayer.path = circlePath.CGPath;
    
}

- (void)setProgress:(double)progress
{
    _progress = progress;
    
    self.circleLayer.strokeEnd = progress;
    
    self.progressLabel.text = [NSString stringWithFormat:@"%.f%%", fabs(progress) * 100];
    
    if (self.isAutoHidden) {
        
        self.hidden = progress >= 1;
        
    }
}



#pragma mark -Getter
- (CAShapeLayer *)circleLayer
{
    if (!_circleLayer) {
        _circleLayer = [CAShapeLayer layer];
        
        _circleLayer.strokeColor = [UIColor whiteColor].CGColor;
        _circleLayer.fillColor = [UIColor clearColor].CGColor;
        _circleLayer.lineWidth = 5;
        _circleLayer.lineJoin = kCALineJoinRound;
        _circleLayer.lineCap = kCALineCapRound;
        _circleLayer.strokeStart = 0;
        
    }
    return _circleLayer;
}
- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [UILabel new];
        
        _progressLabel.textColor = [UIColor whiteColor];
        _progressLabel.font = [UIFont systemFontOfSize:14];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _progressLabel;
}

@end
