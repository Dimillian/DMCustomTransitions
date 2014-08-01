//
//  QHOtherTransition.m
//  Copy91Home
//
//  Created by chen on 14-8-1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "QHOtherTransition.h"
#import <QuartzCore/QuartzCore.h>

#define kDuration 0.7   // 动画持续时间(秒)

@interface QHOtherTransition ()
{
    id<UIViewControllerContextTransitioning> _transitionContext;
}

@end

@implementation QHOtherTransition

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
    _transitionContext = transitionContext;
    
    if (self.isPresenting)
    {
        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        [self startAnimationTransition:containerView from:fromVC to:toVC];
    }
    else
    {
//        [containerView addSubview:toVC.view];
//        [containerView addSubview:fromVC.view];
        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        [self startAnimationTransition:containerView from:fromVC to:toVC];
    }
}

static int typeID = 0;

- (void)startAnimationTransition:(UIView *)mainV from:(UIViewController *)fromVC to:(UIViewController *)toVC
{
    int animationType = 1;
    int animationStyle = 205;
    
    switch (animationType)
    {
        case 1:
        {
            CATransition *animation = [CATransition animation];
            animation.delegate = self;
            animation.duration = kDuration;
            animation.timingFunction = UIViewAnimationCurveEaseInOut;
            
            switch (animationStyle) {
                case 101:
                    animation.type = kCATransitionFade;
                    break;
                case 102:
                    animation.type = kCATransitionPush;
                    break;
                case 103:
                    animation.type = kCATransitionReveal;
                    break;
                case 104:
                    animation.type = kCATransitionMoveIn;
                    break;
                case 201:
                    animation.type = @"cube";
                    break;
                case 202:
                    animation.type = @"suckEffect";
                    break;
                case 203:
                    animation.type = @"oglFlip";
                    break;
                case 204:
                    animation.type = @"rippleEffect";
                    break;
                case 205:
                    animation.type = @"pageCurl";
                    break;
                case 206:
                    animation.type = @"pageUnCurl";
                    break;
                case 207:
                    animation.type = @"cameraIrisHollowOpen";
                    break;
                case 208:
                    animation.type = @"cameraIrisHollowClose";
                    break;
                default:
                    break;
            }
            
            switch (typeID) {
                case 0:
                    animation.subtype = kCATransitionFromLeft;
                    break;
                case 1:
                    animation.subtype = kCATransitionFromBottom;
                    break;
                case 2:
                    animation.subtype = kCATransitionFromRight;
                    break;
                case 3:
                    animation.subtype = kCATransitionFromTop;
                    break;
                default:
                    break;
            }
            typeID += 1;
            if (typeID > 3) {
                typeID = 0;
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
            switch (animationStyle)
            {
                case 105:
                    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:mainV cache:YES];
                    break;
                case 106:
                    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:mainV cache:YES];
                    break;
                case 107:
                    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:mainV cache:YES];
                    break;
                case 108:
                    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:mainV cache:YES];
                    break;
                default:
                    break;
            }
            
            [UIView setAnimationDelegate:self];
            // 动画完毕后调用某个方法
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
