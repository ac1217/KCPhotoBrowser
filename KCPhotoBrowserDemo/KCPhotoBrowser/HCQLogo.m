//
//  HCQLogo.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/18.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "HCQLogo.h"

@implementation HCQLogo


- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.916 green: 0.088 blue: 0.121 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.886 green: 0.049 blue: 0.049 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.887 green: 0.14 blue: 0.14 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0.947 green: 0.094 blue: 0.094 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.761 green: 0.376 blue: 0.376 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 0.961 green: 0.079 blue: 0.079 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 0.819 green: 0.07 blue: 0.07 alpha: 1];
    UIColor* color9 = [UIColor colorWithRed: 0.792 green: 0.078 blue: 0.078 alpha: 1];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(59.85, 0.65)];
    [bezierPath addCurveToPoint: CGPointMake(-0.3, 60.32) controlPoint1: CGPointMake(26.69, 0.65) controlPoint2: CGPointMake(-0.3, 27.42)];
    [bezierPath addCurveToPoint: CGPointMake(59.85, 120) controlPoint1: CGPointMake(-0.3, 93.22) controlPoint2: CGPointMake(26.69, 120)];
    [bezierPath addCurveToPoint: CGPointMake(120, 60.32) controlPoint1: CGPointMake(93.01, 120) controlPoint2: CGPointMake(120, 93.22)];
    [bezierPath addCurveToPoint: CGPointMake(59.85, 0.65) controlPoint1: CGPointMake(120, 27.42) controlPoint2: CGPointMake(93.01, 0.65)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(59.75, 115.26)];
    [bezierPath addCurveToPoint: CGPointMake(19.92, 87.89) controlPoint1: CGPointMake(37.75, 115.26) controlPoint2: CGPointMake(19.92, 103.01)];
    [bezierPath addCurveToPoint: CGPointMake(33.76, 67.14) controlPoint1: CGPointMake(19.92, 79.59) controlPoint2: CGPointMake(25.3, 72.18)];
    [bezierPath addCurveToPoint: CGPointMake(34.86, 64.27) controlPoint1: CGPointMake(34.76, 66.55) controlPoint2: CGPointMake(35.16, 65.36)];
    [bezierPath addCurveToPoint: CGPointMake(33.66, 56.57) controlPoint1: CGPointMake(34.06, 61.8) controlPoint2: CGPointMake(33.66, 59.24)];
    [bezierPath addCurveToPoint: CGPointMake(59.65, 30.98) controlPoint1: CGPointMake(33.76, 42.34) controlPoint2: CGPointMake(45.31, 30.98)];
    [bezierPath addCurveToPoint: CGPointMake(85.54, 57.75) controlPoint1: CGPointMake(74.09, 30.88) controlPoint2: CGPointMake(86.14, 43.03)];
    [bezierPath addCurveToPoint: CGPointMake(84.45, 64.18) controlPoint1: CGPointMake(85.44, 59.93) controlPoint2: CGPointMake(85.05, 62.1)];
    [bezierPath addCurveToPoint: CGPointMake(85.54, 67.04) controlPoint1: CGPointMake(84.15, 65.26) controlPoint2: CGPointMake(84.55, 66.45)];
    [bezierPath addCurveToPoint: CGPointMake(99.59, 87.89) controlPoint1: CGPointMake(94.11, 72.08) controlPoint2: CGPointMake(99.59, 79.59)];
    [bezierPath addCurveToPoint: CGPointMake(59.75, 115.26) controlPoint1: CGPointMake(99.59, 103.01) controlPoint2: CGPointMake(81.76, 115.26)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(89.03, 39.28)];
    [bezierPath addCurveToPoint: CGPointMake(78.67, 29.79) controlPoint1: CGPointMake(83.85, 39.08) controlPoint2: CGPointMake(79.37, 35.03)];
    [bezierPath addCurveToPoint: CGPointMake(78.08, 29.3) controlPoint1: CGPointMake(78.67, 29.5) controlPoint2: CGPointMake(78.37, 29.3)];
    [bezierPath addLineToPoint: CGPointMake(72, 29.3)];
    [bezierPath addCurveToPoint: CGPointMake(72.1, 30.68) controlPoint1: CGPointMake(72.1, 29.79) controlPoint2: CGPointMake(72.1, 30.19)];
    [bezierPath addCurveToPoint: CGPointMake(72.1, 30.98) controlPoint1: CGPointMake(72.1, 30.78) controlPoint2: CGPointMake(72.1, 30.88)];
    [bezierPath addCurveToPoint: CGPointMake(71.6, 31.97) controlPoint1: CGPointMake(72, 31.37) controlPoint2: CGPointMake(71.8, 31.77)];
    [bezierPath addCurveToPoint: CGPointMake(70.41, 32.06) controlPoint1: CGPointMake(71.2, 32.16) controlPoint2: CGPointMake(70.81, 32.26)];
    [bezierPath addCurveToPoint: CGPointMake(60.05, 29.89) controlPoint1: CGPointMake(67.22, 30.58) controlPoint2: CGPointMake(63.74, 29.89)];
    [bezierPath addCurveToPoint: CGPointMake(49.5, 32.06) controlPoint1: CGPointMake(56.27, 29.89) controlPoint2: CGPointMake(52.68, 30.68)];
    [bezierPath addCurveToPoint: CGPointMake(48.3, 31.97) controlPoint1: CGPointMake(49.1, 32.26) controlPoint2: CGPointMake(48.7, 32.16)];
    [bezierPath addCurveToPoint: CGPointMake(47.7, 30.98) controlPoint1: CGPointMake(47.9, 31.77) controlPoint2: CGPointMake(47.7, 31.37)];
    [bezierPath addCurveToPoint: CGPointMake(47.7, 30.68) controlPoint1: CGPointMake(47.7, 30.88) controlPoint2: CGPointMake(47.7, 30.78)];
    [bezierPath addCurveToPoint: CGPointMake(47.8, 29.3) controlPoint1: CGPointMake(47.7, 30.19) controlPoint2: CGPointMake(47.8, 29.79)];
    [bezierPath addLineToPoint: CGPointMake(41.63, 29.3)];
    [bezierPath addCurveToPoint: CGPointMake(41.03, 29.79) controlPoint1: CGPointMake(41.33, 29.3) controlPoint2: CGPointMake(41.03, 29.5)];
    [bezierPath addCurveToPoint: CGPointMake(29.58, 39.28) controlPoint1: CGPointMake(40.33, 35.13) controlPoint2: CGPointMake(35.55, 39.48)];
    [bezierPath addCurveToPoint: CGPointMake(19.12, 28.31) controlPoint1: CGPointMake(23.9, 39.08) controlPoint2: CGPointMake(19.02, 34.14)];
    [bezierPath addCurveToPoint: CGPointMake(30.18, 17.44) controlPoint1: CGPointMake(19.12, 22.28) controlPoint2: CGPointMake(24, 17.44)];
    [bezierPath addCurveToPoint: CGPointMake(41.03, 27.03) controlPoint1: CGPointMake(35.65, 17.44) controlPoint2: CGPointMake(40.43, 21.59)];
    [bezierPath addCurveToPoint: CGPointMake(41.63, 27.52) controlPoint1: CGPointMake(41.03, 27.32) controlPoint2: CGPointMake(41.33, 27.52)];
    [bezierPath addLineToPoint: CGPointMake(48.3, 27.52)];
    [bezierPath addCurveToPoint: CGPointMake(59.95, 20.5) controlPoint1: CGPointMake(49.89, 23.47) controlPoint2: CGPointMake(54.57, 20.5)];
    [bezierPath addCurveToPoint: CGPointMake(71.5, 27.52) controlPoint1: CGPointMake(65.33, 20.5) controlPoint2: CGPointMake(69.91, 23.47)];
    [bezierPath addLineToPoint: CGPointMake(77.98, 27.52)];
    [bezierPath addCurveToPoint: CGPointMake(78.57, 27.03) controlPoint1: CGPointMake(78.28, 27.52) controlPoint2: CGPointMake(78.57, 27.32)];
    [bezierPath addCurveToPoint: CGPointMake(89.63, 17.44) controlPoint1: CGPointMake(79.27, 21.49) controlPoint2: CGPointMake(83.95, 17.34)];
    [bezierPath addCurveToPoint: CGPointMake(100.58, 28.8) controlPoint1: CGPointMake(95.7, 17.34) controlPoint2: CGPointMake(100.88, 22.58)];
    [bezierPath addCurveToPoint: CGPointMake(89.03, 39.28) controlPoint1: CGPointMake(100.38, 34.53) controlPoint2: CGPointMake(95.4, 39.48)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    [color3 setFill];
    [bezierPath fill];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(60, 85.05)];
    [bezier2Path addCurveToPoint: CGPointMake(74.3, 79.75) controlPoint1: CGPointMake(67.9, 85.05) controlPoint2: CGPointMake(74.3, 82.65)];
    [bezier2Path addCurveToPoint: CGPointMake(60, 74.45) controlPoint1: CGPointMake(74.3, 76.85) controlPoint2: CGPointMake(67.9, 74.45)];
    [bezier2Path addCurveToPoint: CGPointMake(45.7, 79.75) controlPoint1: CGPointMake(52.1, 74.45) controlPoint2: CGPointMake(45.7, 76.85)];
    [bezier2Path addCurveToPoint: CGPointMake(60, 85.05) controlPoint1: CGPointMake(45.7, 82.65) controlPoint2: CGPointMake(52.1, 85.05)];
    [bezier2Path closePath];
    bezier2Path.miterLimit = 4;
    
    [color6 setFill];
    [bezier2Path fill];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(81.3, 80.45)];
    [bezier3Path addCurveToPoint: CGPointMake(77.7, 81.65) controlPoint1: CGPointMake(79.9, 80.45) controlPoint2: CGPointMake(78.7, 80.95)];
    [bezier3Path addCurveToPoint: CGPointMake(60, 87.65) controlPoint1: CGPointMake(72.9, 85.35) controlPoint2: CGPointMake(66.7, 87.65)];
    [bezier3Path addCurveToPoint: CGPointMake(42.4, 81.75) controlPoint1: CGPointMake(53.3, 87.65) controlPoint2: CGPointMake(47.2, 85.45)];
    [bezier3Path addCurveToPoint: CGPointMake(38.6, 80.45) controlPoint1: CGPointMake(41.4, 80.95) controlPoint2: CGPointMake(40, 80.45)];
    [bezier3Path addCurveToPoint: CGPointMake(32.5, 86.55) controlPoint1: CGPointMake(35.3, 80.45) controlPoint2: CGPointMake(32.5, 83.15)];
    [bezier3Path addCurveToPoint: CGPointMake(60, 110.85) controlPoint1: CGPointMake(32.5, 100.65) controlPoint2: CGPointMake(46.7, 110.85)];
    [bezier3Path addCurveToPoint: CGPointMake(87.4, 86.55) controlPoint1: CGPointMake(73.3, 110.85) controlPoint2: CGPointMake(87.4, 100.65)];
    [bezier3Path addCurveToPoint: CGPointMake(81.3, 80.45) controlPoint1: CGPointMake(87.4, 83.25) controlPoint2: CGPointMake(84.7, 80.45)];
    [bezier3Path closePath];
    bezier3Path.miterLimit = 4;
    
    [color5 setFill];
    [bezier3Path fill];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
    [bezier4Path moveToPoint: CGPointMake(96.5, 28.45)];
    [bezier4Path addCurveToPoint: CGPointMake(93.1, 26.05) controlPoint1: CGPointMake(95.3, 27.85) controlPoint2: CGPointMake(94.1, 27.05)];
    [bezier4Path addCurveToPoint: CGPointMake(90.7, 22.65) controlPoint1: CGPointMake(92, 25.05) controlPoint2: CGPointMake(91.3, 23.85)];
    [bezier4Path addCurveToPoint: CGPointMake(90.4, 22.45) controlPoint1: CGPointMake(90.7, 22.55) controlPoint2: CGPointMake(90.6, 22.45)];
    [bezier4Path addCurveToPoint: CGPointMake(90.1, 22.65) controlPoint1: CGPointMake(90.2, 22.45) controlPoint2: CGPointMake(90.1, 22.55)];
    [bezier4Path addCurveToPoint: CGPointMake(87.7, 26.05) controlPoint1: CGPointMake(89.5, 23.85) controlPoint2: CGPointMake(88.7, 25.05)];
    [bezier4Path addCurveToPoint: CGPointMake(84.3, 28.45) controlPoint1: CGPointMake(86.7, 27.15) controlPoint2: CGPointMake(85.5, 27.85)];
    [bezier4Path addCurveToPoint: CGPointMake(84.1, 28.75) controlPoint1: CGPointMake(84.2, 28.55) controlPoint2: CGPointMake(84.1, 28.65)];
    [bezier4Path addCurveToPoint: CGPointMake(84.3, 29.05) controlPoint1: CGPointMake(84.1, 28.95) controlPoint2: CGPointMake(84.2, 29.05)];
    [bezier4Path addCurveToPoint: CGPointMake(87.7, 31.45) controlPoint1: CGPointMake(85.5, 29.65) controlPoint2: CGPointMake(86.7, 30.45)];
    [bezier4Path addCurveToPoint: CGPointMake(90.1, 34.85) controlPoint1: CGPointMake(88.8, 32.45) controlPoint2: CGPointMake(89.5, 33.65)];
    [bezier4Path addCurveToPoint: CGPointMake(90.4, 35.05) controlPoint1: CGPointMake(90.2, 34.95) controlPoint2: CGPointMake(90.3, 35.05)];
    [bezier4Path addCurveToPoint: CGPointMake(90.7, 34.85) controlPoint1: CGPointMake(90.6, 35.05) controlPoint2: CGPointMake(90.7, 34.95)];
    [bezier4Path addCurveToPoint: CGPointMake(93.1, 31.45) controlPoint1: CGPointMake(91.3, 33.65) controlPoint2: CGPointMake(92.1, 32.45)];
    [bezier4Path addCurveToPoint: CGPointMake(96.5, 29.05) controlPoint1: CGPointMake(94.1, 30.35) controlPoint2: CGPointMake(95.3, 29.65)];
    [bezier4Path addCurveToPoint: CGPointMake(96.7, 28.75) controlPoint1: CGPointMake(96.6, 28.95) controlPoint2: CGPointMake(96.7, 28.95)];
    [bezier4Path addCurveToPoint: CGPointMake(96.5, 28.45) controlPoint1: CGPointMake(96.7, 28.55) controlPoint2: CGPointMake(96.6, 28.45)];
    [bezier4Path closePath];
    bezier4Path.miterLimit = 4;
    
    [color2 setFill];
    [bezier4Path fill];
    
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
    [bezier5Path moveToPoint: CGPointMake(36.1, 28.45)];
    [bezier5Path addCurveToPoint: CGPointMake(32.7, 26.05) controlPoint1: CGPointMake(34.9, 27.85) controlPoint2: CGPointMake(33.7, 27.05)];
    [bezier5Path addCurveToPoint: CGPointMake(30.3, 22.65) controlPoint1: CGPointMake(31.6, 25.05) controlPoint2: CGPointMake(30.9, 23.85)];
    [bezier5Path addCurveToPoint: CGPointMake(30, 22.45) controlPoint1: CGPointMake(30.2, 22.55) controlPoint2: CGPointMake(30.1, 22.45)];
    [bezier5Path addCurveToPoint: CGPointMake(29.7, 22.65) controlPoint1: CGPointMake(29.8, 22.45) controlPoint2: CGPointMake(29.7, 22.55)];
    [bezier5Path addCurveToPoint: CGPointMake(27.3, 26.05) controlPoint1: CGPointMake(29.1, 23.85) controlPoint2: CGPointMake(28.3, 25.05)];
    [bezier5Path addCurveToPoint: CGPointMake(23.9, 28.45) controlPoint1: CGPointMake(26.3, 27.15) controlPoint2: CGPointMake(25.1, 27.85)];
    [bezier5Path addCurveToPoint: CGPointMake(23.7, 28.75) controlPoint1: CGPointMake(23.8, 28.55) controlPoint2: CGPointMake(23.7, 28.55)];
    [bezier5Path addCurveToPoint: CGPointMake(23.9, 29.05) controlPoint1: CGPointMake(23.7, 28.95) controlPoint2: CGPointMake(23.8, 29.05)];
    [bezier5Path addCurveToPoint: CGPointMake(27.3, 31.45) controlPoint1: CGPointMake(25.1, 29.65) controlPoint2: CGPointMake(26.3, 30.45)];
    [bezier5Path addCurveToPoint: CGPointMake(29.7, 34.85) controlPoint1: CGPointMake(28.4, 32.45) controlPoint2: CGPointMake(29.1, 33.65)];
    [bezier5Path addCurveToPoint: CGPointMake(30, 35.05) controlPoint1: CGPointMake(29.8, 34.95) controlPoint2: CGPointMake(29.9, 35.05)];
    [bezier5Path addCurveToPoint: CGPointMake(30.3, 34.85) controlPoint1: CGPointMake(30.2, 35.05) controlPoint2: CGPointMake(30.3, 34.95)];
    [bezier5Path addCurveToPoint: CGPointMake(32.7, 31.45) controlPoint1: CGPointMake(30.9, 33.65) controlPoint2: CGPointMake(31.7, 32.45)];
    [bezier5Path addCurveToPoint: CGPointMake(36.1, 29.05) controlPoint1: CGPointMake(33.7, 30.35) controlPoint2: CGPointMake(34.9, 29.65)];
    [bezier5Path addCurveToPoint: CGPointMake(36.3, 28.75) controlPoint1: CGPointMake(36.2, 28.95) controlPoint2: CGPointMake(36.3, 28.95)];
    [bezier5Path addCurveToPoint: CGPointMake(36.1, 28.45) controlPoint1: CGPointMake(36.3, 28.55) controlPoint2: CGPointMake(36.2, 28.45)];
    [bezier5Path closePath];
    bezier5Path.miterLimit = 4;
    
    [color4 setFill];
    [bezier5Path fill];
    
    
    //// Bezier 6 Drawing
    UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
    [bezier6Path moveToPoint: CGPointMake(60.2, 62.15)];
    [bezier6Path addCurveToPoint: CGPointMake(72.6, 56.15) controlPoint1: CGPointMake(66.2, 62.15) controlPoint2: CGPointMake(71.2, 59.65)];
    [bezier6Path addCurveToPoint: CGPointMake(72.7, 55.75) controlPoint1: CGPointMake(72.6, 56.05) controlPoint2: CGPointMake(72.7, 55.95)];
    [bezier6Path addCurveToPoint: CGPointMake(71.7, 54.75) controlPoint1: CGPointMake(72.7, 55.25) controlPoint2: CGPointMake(72.3, 54.75)];
    [bezier6Path addCurveToPoint: CGPointMake(70.8, 55.55) controlPoint1: CGPointMake(71.2, 54.75) controlPoint2: CGPointMake(70.9, 55.05)];
    [bezier6Path addCurveToPoint: CGPointMake(60.2, 60.55) controlPoint1: CGPointMake(69.8, 58.35) controlPoint2: CGPointMake(65.4, 60.55)];
    [bezier6Path addCurveToPoint: CGPointMake(49.7, 55.65) controlPoint1: CGPointMake(55.1, 60.55) controlPoint2: CGPointMake(50.8, 58.45)];
    [bezier6Path addCurveToPoint: CGPointMake(48.7, 54.75) controlPoint1: CGPointMake(49.6, 55.15) controlPoint2: CGPointMake(49.2, 54.75)];
    [bezier6Path addCurveToPoint: CGPointMake(47.7, 55.75) controlPoint1: CGPointMake(48.2, 54.75) controlPoint2: CGPointMake(47.7, 55.15)];
    [bezier6Path addCurveToPoint: CGPointMake(47.8, 56.15) controlPoint1: CGPointMake(47.7, 55.85) controlPoint2: CGPointMake(47.7, 56.05)];
    [bezier6Path addCurveToPoint: CGPointMake(60.2, 62.15) controlPoint1: CGPointMake(49.2, 59.65) controlPoint2: CGPointMake(54.2, 62.15)];
    [bezier6Path closePath];
    bezier6Path.miterLimit = 4;
    
    [color9 setFill];
    [bezier6Path fill];
    
    
    //// Bezier 7 Drawing
    UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
    [bezier7Path moveToPoint: CGPointMake(49.8, 48.35)];
    [bezier7Path addCurveToPoint: CGPointMake(51.5, 44.75) controlPoint1: CGPointMake(50.7, 48.35) controlPoint2: CGPointMake(51.5, 46.75)];
    [bezier7Path addCurveToPoint: CGPointMake(49.8, 41.15) controlPoint1: CGPointMake(51.5, 42.75) controlPoint2: CGPointMake(50.7, 41.15)];
    [bezier7Path addCurveToPoint: CGPointMake(48.1, 44.75) controlPoint1: CGPointMake(48.9, 41.15) controlPoint2: CGPointMake(48.1, 42.75)];
    [bezier7Path addCurveToPoint: CGPointMake(49.8, 48.35) controlPoint1: CGPointMake(48.1, 46.65) controlPoint2: CGPointMake(48.9, 48.35)];
    [bezier7Path closePath];
    bezier7Path.miterLimit = 4;
    
    [color7 setFill];
    [bezier7Path fill];
    
    
    //// Bezier 8 Drawing
    UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
    [bezier8Path moveToPoint: CGPointMake(64.4, 47.75)];
    [bezier8Path addCurveToPoint: CGPointMake(64.8, 47.75) controlPoint1: CGPointMake(64.5, 47.85) controlPoint2: CGPointMake(64.7, 47.75)];
    [bezier8Path addLineToPoint: CGPointMake(64.9, 47.75)];
    [bezier8Path addCurveToPoint: CGPointMake(65.3, 47.35) controlPoint1: CGPointMake(65.1, 47.65) controlPoint2: CGPointMake(65.2, 47.55)];
    [bezier8Path addCurveToPoint: CGPointMake(67.1, 45.45) controlPoint1: CGPointMake(65.7, 46.55) controlPoint2: CGPointMake(66.3, 45.85)];
    [bezier8Path addCurveToPoint: CGPointMake(69.7, 45.15) controlPoint1: CGPointMake(67.9, 45.05) controlPoint2: CGPointMake(68.8, 44.95)];
    [bezier8Path addCurveToPoint: CGPointMake(71.3, 46.05) controlPoint1: CGPointMake(70.3, 45.35) controlPoint2: CGPointMake(70.9, 45.65)];
    [bezier8Path addCurveToPoint: CGPointMake(72.3, 47.55) controlPoint1: CGPointMake(71.7, 46.45) controlPoint2: CGPointMake(72.1, 46.95)];
    [bezier8Path addCurveToPoint: CGPointMake(72.6, 48.05) controlPoint1: CGPointMake(72.4, 47.75) controlPoint2: CGPointMake(72.5, 47.95)];
    [bezier8Path addCurveToPoint: CGPointMake(73.1, 48.35) controlPoint1: CGPointMake(72.7, 48.15) controlPoint2: CGPointMake(72.9, 48.25)];
    [bezier8Path addCurveToPoint: CGPointMake(73.7, 48.05) controlPoint1: CGPointMake(73.4, 48.45) controlPoint2: CGPointMake(73.7, 48.35)];
    [bezier8Path addCurveToPoint: CGPointMake(74.2, 47.35) controlPoint1: CGPointMake(73.9, 47.85) controlPoint2: CGPointMake(74.1, 47.65)];
    [bezier8Path addCurveToPoint: CGPointMake(74.2, 47.05) controlPoint1: CGPointMake(74.2, 47.25) controlPoint2: CGPointMake(74.2, 47.15)];
    [bezier8Path addCurveToPoint: CGPointMake(74.2, 46.85) controlPoint1: CGPointMake(74.2, 46.95) controlPoint2: CGPointMake(74.2, 46.95)];
    [bezier8Path addLineToPoint: CGPointMake(74.2, 46.75)];
    [bezier8Path addCurveToPoint: CGPointMake(72.7, 44.55) controlPoint1: CGPointMake(73.9, 45.95) controlPoint2: CGPointMake(73.4, 45.15)];
    [bezier8Path addCurveToPoint: CGPointMake(70.3, 43.35) controlPoint1: CGPointMake(72, 44.05) controlPoint2: CGPointMake(71.2, 43.55)];
    [bezier8Path addCurveToPoint: CGPointMake(66.4, 43.85) controlPoint1: CGPointMake(68.9, 43.05) controlPoint2: CGPointMake(67.6, 43.25)];
    [bezier8Path addCurveToPoint: CGPointMake(63.8, 46.75) controlPoint1: CGPointMake(65.3, 44.45) controlPoint2: CGPointMake(64.3, 45.45)];
    [bezier8Path addLineToPoint: CGPointMake(63.8, 46.85)];
    [bezier8Path addLineToPoint: CGPointMake(63.8, 46.95)];
    [bezier8Path addCurveToPoint: CGPointMake(63.9, 47.45) controlPoint1: CGPointMake(63.8, 47.15) controlPoint2: CGPointMake(63.8, 47.25)];
    [bezier8Path addCurveToPoint: CGPointMake(64.4, 47.75) controlPoint1: CGPointMake(64, 47.55) controlPoint2: CGPointMake(64.2, 47.75)];
    [bezier8Path closePath];
    bezier8Path.miterLimit = 4;
    
    [color8 setFill];
    [bezier8Path fill];
}

@end
