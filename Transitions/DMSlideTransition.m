//
//  DMSlideTransition.m
//  DMCustomTransition
//
//  Created by Thomas Ricouard on 26/11/13.
//  Copyright (c) 2013 Thomas Ricouard. All rights reserved.
//

#import "DMSlideTransition.h"

@implementation DMSlideTransition


#pragma mark - UIViewControllerAnimatedTransitioning


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.50f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView setBackgroundColor:self.backgroundColor ? self.backgroundColor : [UIColor whiteColor]];
    if (self.isPresenting) {
        
        [containerView addSubview:toVC.view];
        CGRect fromFrame = fromVC.view.frame;
        CGRect toFrame = toVC.view.frame;
        
        fromFrame.origin.y = -fromFrame.size.height/2;
        toFrame.origin.y = containerView.frame.size.height;
        [toVC.view setFrame:toFrame];
        toFrame.origin.y = 0;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.92f
              initialSpringVelocity:17
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [fromVC.view setFrame:fromFrame];
                             [toVC.view setFrame:toFrame];
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
        
    }
    else {
        
        [containerView addSubview:toVC.view];
        [containerView addSubview:fromVC.view];
        
        CGRect fromFrame = fromVC.view.frame;
        CGRect toFrame = toVC.view.frame;
        
        fromFrame.origin.y = containerView.frame.size.height;
        
        toFrame.origin.y = -containerView.frame.size.height;
        [toVC.view setFrame:toFrame];
        toFrame.origin.y = 0;
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.92f
              initialSpringVelocity:17
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [fromVC.view setFrame:fromFrame];
                             [toVC.view setFrame:toFrame];
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
        
    }
}

@end
