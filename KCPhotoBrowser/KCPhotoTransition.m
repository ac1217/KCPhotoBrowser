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

static NSTimeInterval const TransitionAnimationDuration = 0.5;

@interface KCPhotoTransition ()

@property (nonatomic, assign) NSInteger style;

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
    return TransitionAnimationDuration;
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
            
            UIView *(^sourceViewBlock)(NSInteger index) = [toVC valueForKey:@"sourceViewBlock"];
            
            if (!sourceViewBlock) {
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    toVC.view.alpha = 1;
                } completion:^(BOOL finished) {
                    
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }];
                return;
            }
            
            NSInteger currentIndex = [[toVC valueForKey:@"currentIndex"] integerValue];
            
            UIImageView *sourceView = (UIImageView *)sourceViewBlock(currentIndex);
            
            UICollectionView *collectionView = [toVC valueForKey:@"collectionView"];
            collectionView.hidden = YES;
            
            UIImage *image = nil;
            if ([sourceView isKindOfClass:[UIImageView class]]) {
                image = sourceView.image;
            }
            
            UIImageView *imageView = [UIImageView new];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.image = image;
            imageView.frame = [sourceView.superview convertRect:sourceView.frame toView:containerView];
            
            [containerView addSubview:imageView];
            
            CGRect endFrame = image.kc_imageDisplayFrame;
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.55 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                imageView.frame = endFrame;
                toVC.view.alpha = 1;
                
            } completion:^(BOOL finished) {
                
                collectionView.hidden = NO;
                [imageView removeFromSuperview];
                
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
            
        }
            
            break;
        case 1:{
            
            KCPhotoBrowser *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            
            UIView *(^sourceViewBlock)(NSInteger index) = [fromVC valueForKey:@"sourceViewBlock"];
            if (!sourceViewBlock) {
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    fromVC.view.alpha = 0;
                } completion:^(BOOL finished) {
                    
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }];
                return;
            }
            
            NSInteger currentIndex = [[fromVC valueForKey:@"currentIndex"] integerValue];
            
            
            
            UIImageView *sourceView = (UIImageView *)sourceViewBlock(currentIndex);
            
            UIImage *image = nil;
            if ([sourceView isKindOfClass:[UIImageView class]]) {
                image = sourceView.image;
            }
            
            UIImageView *currentImageView = [[[fromVC valueForKey:@"collectionView"] cellForItemAtIndexPath:[NSIndexPath indexPathForItem:currentIndex inSection:0]] valueForKey:@"imageView"];
            
            UIImageView *imageView = [UIImageView new];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.image = image;
            imageView.frame = [currentImageView.superview convertRect:currentImageView.frame toView:containerView];
            [containerView addSubview:imageView];
            
            CGRect endFrame = [sourceView.superview convertRect:sourceView.frame toView:containerView];
            
            UICollectionView *collectionView = [fromVC valueForKey:@"collectionView"];
            collectionView.hidden = YES;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] * 0.5 animations:^{
                imageView.frame = endFrame;
                fromVC.view.alpha = 0;
            } completion:^(BOOL finished) {
                
                if ([transitionContext transitionWasCancelled]) {
                    collectionView.hidden = NO;
                }
                
                [imageView removeFromSuperview];
                
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

            
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
