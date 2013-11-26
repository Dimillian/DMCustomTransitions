//
//  DMViewController.m
//  DMCustomTransition
//
//  Created by Thomas Ricouard on 26/11/13.
//  Copyright (c) 2013 Thomas Ricouard. All rights reserved.
//

#import "DMViewController.h"
#import "DMPresentedViewController.h"
#import "DMAlphaTransition.h"
#import "DMScaleTransition.h"
#import "DMSlideTransition.h"

@interface DMViewController ()

@end

@implementation DMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onScaleTransitionButton:(id)sender {
    DMScaleTransition *scaleTransition = [[DMScaleTransition alloc]init];
    [self presentWithTransition:scaleTransition];
}

- (IBAction)onAlphaTransitionButton:(id)sender {
    DMAlphaTransition *alphaTransition = [[DMAlphaTransition alloc]init];
    [self presentWithTransition:alphaTransition];
}

- (IBAction)onSlideTransitionButton:(id)sender {
    DMSlideTransition *slideTransition = [[DMSlideTransition alloc]init];
    [slideTransition setBackgroundColor:[UIColor whiteColor]];
    [self presentWithTransition:slideTransition];
}

- (void)presentWithTransition:(id)transition
{
    DMPresentedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"presentedVC"];
    [vc setTransitioningDelegate:transition];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

@end
