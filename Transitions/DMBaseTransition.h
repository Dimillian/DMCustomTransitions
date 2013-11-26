//
//  DMBaseTransition.h
//  DMCustomTransition
//
//  Created by Thomas Ricouard on 26/11/13.
//  Copyright (c) 2013 Thomas Ricouard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMBaseTransition : NSObject
<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, readwrite, assign, getter = isPresenting) BOOL presenting;

@end
