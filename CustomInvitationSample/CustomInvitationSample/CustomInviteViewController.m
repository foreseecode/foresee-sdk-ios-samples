//
//  CustomInviteViewController.m
//  CustomInvitationSample
//
//  Created by Wayne Burkett on 5/31/16.
//  Copyright © 2016 ForeSee. All rights reserved.
//

#import "CustomInviteViewController.h"
#import "CustomInviteTracker.h"

@implementation CustomInviteViewController

- (void)viewDidLoad {
    self.inviteHandler = [[CustomInviteTracker alloc] init];
    [ForeSeeCxMeasure setInviteHandler:self.inviteHandler];
}

- (IBAction)handleShowInviteTouchUpInside:(id)sender {
    // check for eligibility (which is what triggers the invite)
    [ForeSeeCxMeasure checkIfEligibleForSurvey];
}

- (IBAction)resetState:(id)sender {
    [ForeSee resetState];
}

@end
