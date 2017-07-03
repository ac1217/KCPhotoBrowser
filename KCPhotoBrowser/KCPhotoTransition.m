//
//  KCPhotoTransition.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/15.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "KCPhotoTransition.h"
#import "KCPhotoBrowser.h"
#import "KCPhotoBrowserCell.h"
#import "UIImage+KCPhoto.h"

@interface KCPhotoTransition ()

@property (nonatomic, assign) NSInteger style;


@property (nonatomic,assign) NSTimeInterval animationDuration;

//@property (nonatomic, weak) UIViewController *presentingVC;
//@property (nonatomic, assign) BOOL shouldComplete;

@end

@implementation KCPhotoTransition


//+ (instancetype)dismissInteractiveTransitionWithPresentingVC:(UIViewController *)presentingVC
//{
//    KCPhotoTransition *t = [KCPhotoTransition new];
//    t.style = 2;
//    
//    t.presentingVC = presentingVC;
//    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:t action:@selector(pan:)];
//    [presentingVC.view addGestureRecognizer:pan];
//    
//    return t;
//}

- (instancetype)init
{
    if (self = [super init]) {
        self.animationDuration = 0.5;
    }
    return self;
}


+ (instancetype)presentTransition
{
    KCPhotoTransition *t = [KCPhotoTransition new];
    t.style = 0;
    
    return t;
}

+ (instancetype)dismissTransition
{
    KCPhotoTransition *t = [KCPhotoTransition new];
    t.style = 1;
    
    return t;
}

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.animationDuration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    
    switch (self.style) {
        case 0:{
            
            KCPhotoBrowser *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            
            [containerView addSubview:toVC.view];
            toVC.view.alpha = 0;
            
            UIImageView *sourceImageView = toVC.sourceImageView;
            if (sourceImageView) {
                
                UIImageView *imageView = [UIImageView new];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.clipsToBounds = true;
                imageView.image = sourceImageView.image;
                imageView.frame = [sourceImageView.superview convertRect:sourceImageView.frame toView:toVC.view];
                
                [toVC.view insertSubview:imageView atIndex:1];
                
//                toVC.view.insertSubview(imageView, at: 1)
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    toVC.view.alpha = 1;
                    imageView.frame = [sourceImageView.image kc_imageDisplayFrame];
                } completion:^(BOOL finished) {
                    [imageView removeFromSuperview];
                    [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                }];
                

                
            }else {
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    toVC.view.alpha = 1;
                } completion:^(BOOL finished) {
                    
                    
                    [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                }];
            }
        
        }
            
            break;
        case 1:{
            
            KCPhotoBrowser *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            
            UIImageView *sourceImageView = fromVC.sourceImageView;
            UIImageView *displayImageView = fromVC.displayImageView;
            
            if (sourceImageView && displayImageView) {
                
                displayImageView.frame = [displayImageView.superview convertRect:displayImageView.frame toView:containerView];
                [containerView addSubview:displayImageView];
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] * 0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    fromVC.view.alpha = 0;
                    displayImageView.frame = [sourceImageView.superview convertRect:sourceImageView.frame toView:containerView];
                } completion:^(BOOL finished) {
                    
                    [displayImageView removeFromSuperview];
                    [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                }];
                
            }else {
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    fromVC.view.alpha = 1;
                } completion:^(BOOL finished) {
                    
                    
                    [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                }];
            }
            
        }
            
            break;
            
        default:
            break;
    }
    
}

/*
#pragma mark -InteractiveTransition

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint translation = [pan translationInView:pan.view.superview];
    
//    if (translation.y < 0) return;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            CGFloat fraction = translation.y / [UIScreen mainScreen].bounds.size.height;
            //Limit it between 0 and 1
            
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            
            self.shouldComplete = (fraction > 0.1);
            
            [self updateInteractiveTransition:fraction];
            
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (!self.shouldComplete || pan.state == UIGestureRecognizerStateCancelled) {
                
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}
 */

@end
