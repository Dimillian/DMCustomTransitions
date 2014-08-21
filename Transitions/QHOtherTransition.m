//
//  QHOtherTransition.m
//  Copy91Home
//
//  Created by chen on 14-8-1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "QHOtherTransition.h"
#import <QuartzCore/QuartzCore.h>

#define kDuration 0.7   // thn animation's duration after view transition (动画持续时间(秒))

@interface QHOtherTransition ()
{
    id<UIViewControllerContextTransitioning> _transitionContext;
}

@property (nonatomic, assign) int animationType;

@end

@implementation QHOtherTransition

#pragma mark - UIViewControllerAnimatedTransitioning


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.01f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    _transitionContext = transitionContext;
    
    if (self.isPresenting)
    {
        typeID = arc4random() % 4 + 1;//random 1 to 4, means top, left, bottom and right 
        if(_animationType == 1)
            [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        else
            [containerView insertSubview:toVC.view aboveSubview:fromVC.view];
        
        [self startAnimationTransition:containerView from:fromVC to:toVC];
    }
    else
    {
        if(_animationType == 1)
            [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        else
            [containerView insertSubview:toVC.view aboveSubview:fromVC.view];
        
        [self startAnimationTransition:containerView from:fromVC to:toVC];
    }
}

- (void)setAnimationStyle:(int)animationStyle
{
    _animationStyle = animationStyle;
    _animationType = _animationStyle/100;
}

static int typeID = 1;

- (void)startAnimationTransition:(UIView *)mainV from:(UIViewController *)fromVC to:(UIViewController *)toVC
{
    switch (_animationType)
    {
        case 1:
        {
            CATransition *animation = [CATransition animation];
            animation.delegate = self;
            animation.duration = kDuration;
            animation.timingFunction = UIViewAnimationCurveEaseInOut;
            
            switch (_animationStyle) {
                case AnimationStyleTag_kCATransitionFade:
                    animation.type = kCATransitionFade;
                    break;
                case AnimationStyleTag_kCATransitionPush:
                    animation.type = kCATransitionPush;
                    break;
                case AnimationStyleTag_kCATransitionReveal:
                    animation.type = kCATransitionReveal;
                    break;
                case AnimationStyleTag_kCATransitionMoveIn:
                    animation.type = kCATransitionMoveIn;
                    break;
                case AnimationStyleTag_cube:
                    animation.type = @"cube";
                    break;
                case AnimationStyleTag_suckEffect:
                    animation.type = @"suckEffect";
                    break;
                case AnimationStyleTag_oglFlip:
                    animation.type = @"oglFlip";
                    break;
                case AnimationStyleTag_rippleEffect:
                    animation.type = @"rippleEffect";
                    break;
                case AnimationStyleTag_pageCurl:
                    animation.type = @"pageCurl";
                    _animationStyle = AnimationStyleTag_pageUnCurl;
                    break;
                case AnimationStyleTag_pageUnCurl:
                    animation.type = @"pageUnCurl";
                    _animationStyle = AnimationStyleTag_pageCurl;
                    break;
                case AnimationStyleTag_cameraIrisHollowOpen:
                    animation.type = @"cameraIrisHollowOpen";
                    _animationStyle = AnimationStyleTag_cameraIrisHollowClose;
                    break;
                case AnimationStyleTag_cameraIrisHollowClose:
                    animation.type = @"cameraIrisHollowClose";
                    _animationStyle = AnimationStyleTag_cameraIrisHollowOpen;
                    break;
                default:
                    break;
            }
            
            switch (typeID) {
                case 1:
                    animation.subtype = kCATransitionFromLeft;
                    typeID = 3;
                    break;
                case 2:
                    animation.subtype = kCATransitionFromBottom;
                    typeID = 4;
                    break;
                case 3:
                    animation.subtype = kCATransitionFromRight;
                    typeID = 1;
                    break;
                case 4:
                    animation.subtype = kCATransitionFromTop;
                    typeID = 2;
                    break;
                default:
                    break;
            }
            
            NSUInteger fromV = [[mainV subviews] indexOfObject:fromVC.view];
            NSUInteger toV = [[mainV subviews] indexOfObject:toVC.view];
            [mainV exchangeSubviewAtIndex:toV withSubviewAtIndex:fromV];
            
            [[mainV layer] addAnimation:animation forKey:@"animation"];
            break;
        }
        case 2:
        {
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:nil context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:kDuration];
            switch (_animationStyle)
            {
                case AnimationStyleTag_TransitionCurlDown:
                    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:mainV cache:YES];
                    _animationStyle = AnimationStyleTag_TransitionCurlUp;
                    break;
                case AnimationStyleTag_TransitionCurlUp:
                    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:mainV cache:YES];
                    _animationStyle = AnimationStyleTag_TransitionCurlDown;
                    break;
                case AnimationStyleTag_TransitionFlipFromLeft:
                    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:mainV cache:YES];
                    _animationStyle = AnimationStyleTag_TransitionFlipFromRight;
                    break;
                case AnimationStyleTag_TransitionFlipFromRight:
                    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:mainV cache:YES];
                    _animationStyle = AnimationStyleTag_TransitionFlipFromLeft;
                    break;
                default:
                    break;
            }
            
            [UIView setAnimationDelegate:self];
            //[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
            [UIView commitAnimations];
            break;
        }
        default:
            break;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [_transitionContext completeTransition:YES];
}

@end
