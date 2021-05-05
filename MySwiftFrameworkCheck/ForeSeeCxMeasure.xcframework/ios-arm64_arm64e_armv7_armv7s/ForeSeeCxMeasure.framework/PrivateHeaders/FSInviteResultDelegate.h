//
//  FSInviteResultDelegate.h
//  Foresee
//
//  Created by Wayne Burkett on 5/2/16.
//  Copyright © 2016 Foresee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ForeSee/ForeSee.h>

@class TRMeasure;

/**
 The `FSInviteResultDelegate` protocol describes methods implemented by the main tracker in 
 the ForeSee SDK. The methods in this protocol allow invite modes to communicate with the SDK 
 about the user's state.
 
 */
@protocol FSInviteResultDelegate <NSObject>

/** @name Invitation Events */

/** Tells the delegate that a user has accepted an invite. 
 
 Invites must send this message when an invite is accepted.
 
 @note CONTACT surveys should use `didAcceptInviteForSurvey:contactDetails:` unless details have already been provided via `contactDetails:`
 @param measure The measure for which the user accepted an invitation.
 @see didAcceptInviteForMeasure:contactDetails:
 */
- (void)didAcceptInviteForMeasure:(TRMeasure *)measure;

/** Tells the delegate that a user has declined an invite. 
 
 Invites must send this message when an invite is declined.
 
 @param measure The measure for which the user declined an invitation.
 */
- (void)didDeclineInviteForMeasure:(TRMeasure *)measure;

@end
