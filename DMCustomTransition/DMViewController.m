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
#import "QHOtherTransition.h"

@interface DMViewController ()

@property (nonatomic, strong) DMAlphaTransition *alphaTransition;
@property (nonatomic, strong) DMScaleTransition *scaleTransition;
@property (nonatomic, strong) DMSlideTransition *slideTransition;
@property (nonatomic, strong) QHOtherTransition *otherTransition;

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
    self.scaleTransition = [[DMScaleTransition alloc]init];
    [self presentWithTransition:self.scaleTransition];
}

- (IBAction)onAlphaTransitionButton:(id)sender {
    self.alphaTransition = [[DMAlphaTransition alloc]init];
    [self presentWithTransition:self.alphaTransition];
}

- (IBAction)onSlideTransitionButton:(id)sender {
    self.slideTransition = [[DMSlideTransition alloc]init];
    [self.slideTransition setBackgroundColor:[UIColor whiteColor]];
    [self presentWithTransition:self.slideTransition];
}

- (IBAction)onOtherTransitionButton:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.otherTransition = [[QHOtherTransition alloc] init];
    self.otherTransition.animationStyle = btn.tag;
    [self presentWithTransition:self.otherTransition];
}

- (void)presentWithTransition:(id)transition
{
    DMPresentedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"presentedVC"];
    [vc setTransitioningDelegate:transition];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

@end
