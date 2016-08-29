//
//  KCPhotoTransition.h
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/15.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCPhotoTransition : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning>

+ (instancetype)presentTransition;
+ (instancetype)dismissTransition;


//+ (instancetype)dismissInteractiveTransitionWithPresentingVC:(UIViewController *)presentingVC;
//@property (nonatomic, assign, getter=isInteracting) BOOL interacting;

@end
