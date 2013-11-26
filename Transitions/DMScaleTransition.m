//
//  DMScaleTransition.m
//  DMCustomTransition
//
//  Created by Thomas Ricouard on 26/11/13.
//  Copyright (c) 2013 Thomas Ricouard. All rights reserved.
//

#import "DMScaleTransition.h"

@implementation DMScaleTransition


#pragma mark - UIViewControllerAnimatedTransitioning


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.30f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    if (self.isPresenting) {
        
        [containerView addSubview:toVC.view];
        [toVC.view setAlpha:0];
        CGAffineTransform xForm = toVC.view.transform;
        toVC.view.transform = CGAffineTransformScale(xForm, 2.0f, 2.0f);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             [toVC.view setAlpha:1];
                             toVC.view.transform =
                             CGAffineTransformScale(xForm, 1.0f, 1.0f);
                             fromVC.view.transform =
                             CGAffineTransformScale(fromVC.view.transform, 0.9f, 0.9f);
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
    else {
        
        [containerView addSubview:toVC.view];
        [containerView addSubview:fromVC.view];
        
        CGAffineTransform xForm = toVC.view.transform;
        toVC.view.transform = CGAffineTransformScale(toVC.view.transform, 0.9f, 0.9f);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             [fromVC.view setAlpha:0];
                             fromVC.view.transform =
                             CGAffineTransformScale(xForm, 2.0f, 2.0f);
                             toVC.view.transform =
                             CGAffineTransformScale(CGAffineTransformIdentity, 1.0f, 1.0f);
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
}

@end
