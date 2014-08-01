//
//  QHOtherTransition.h
//  Copy91Home
//
//  Created by chen on 14-8-1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "DMBaseTransition.h"

typedef NS_ENUM (NSUInteger, AnimationStyleTag)
{
    AnimationStyleTag_kCATransitionFade = 101,
    AnimationStyleTag_kCATransitionPush,
    AnimationStyleTag_kCATransitionReveal,
    AnimationStyleTag_kCATransitionMoveIn,
    AnimationStyleTag_cube,
    AnimationStyleTag_suckEffect,
    AnimationStyleTag_oglFlip,
    AnimationStyleTag_rippleEffect,
    AnimationStyleTag_pageCurl,
    AnimationStyleTag_pageUnCurl,
    AnimationStyleTag_cameraIrisHollowOpen,
    AnimationStyleTag_cameraIrisHollowClose,
    AnimationStyleTag_TransitionCurlDown = 201,
    AnimationStyleTag_TransitionCurlUp,
    AnimationStyleTag_TransitionFlipFromLeft,
    AnimationStyleTag_TransitionFlipFromRight
};

@interface QHOtherTransition : DMBaseTransition

@property (nonatomic, assign) int animationType;
@property (nonatomic, assign) int animationStyle;

@end
