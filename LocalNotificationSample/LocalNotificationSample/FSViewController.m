//
//  FSViewController.m
//  BasicSample
//
//  Created by Michael Han on 12-03-06.
//  Copyright (c) 2012 ForeSee. All rights reserved.
//

#import "FSViewController.h"
#import <EXPCore/EXPCore.h>
#import <EXPPredictive/EXPPredictive.h>
#import <UserNotifications/UserNotifications.h>


@implementation FSViewController

# pragma mark - Actions

- (IBAction)checkEligibility:(id)sender {
    [EXPPredictive checkIfEligibleForSurvey];
}

- (IBAction)resetState:(id)sender {
    [EXPCore resetState];

}

@end
