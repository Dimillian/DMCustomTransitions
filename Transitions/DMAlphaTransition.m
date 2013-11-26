//
//  DMAlphaTransition.m
//  DMCustomTransition
//
//  Created by Thomas Ricouard on 26/11/13.
//  Copyright (c) 2013 Thomas Ricouard. All rights reserved.
//

#import "DMAlphaTransition.h"

@implementation DMAlphaTransition


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
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             [toVC.view setAlpha:1];
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
    else {
        
        [containerView addSubview:toVC.view];
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             [fromVC.view setAlpha:0];
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
}

@end
