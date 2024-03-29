//
//  ViewController.m
//  BasicSample
//
//  Created by Michael Han on 12-03-06.
//  Copyright (c) 2012 ForeSee. All rights reserved.
//

#import "ViewController.h"
#import <EXPCore/EXPCore.h>
#import <EXPPredictive/EXPPredictive.h>

@implementation ViewController

# pragma mark - Actions

- (void)checkEligibility:(id)sender {
  [EXPPredictive checkIfEligibleForSurvey];
}

- (void)resetState:(id)sender {
    [EXPCore resetState];
}

@end
