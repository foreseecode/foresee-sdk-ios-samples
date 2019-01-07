//
//  SRViewChangeDefinition.h
//  Foresee
//
//  Created by Michael Han on 2013-06-18.
//  Copyright (c) 2013 Foresee. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Your UIViewController subclass can adopt this protocol to disable automatic view logging and counting.

 Most of time, the appearance of a UIViewController on screen is counted as a "page view" by the SDK. Some container
 controllers, however, are not counted (e.g. UINavigationController). You may have your own custom controllers
 that you don't wish to be counted (or containers that you think should be). This protocol enables an override 
 of the default behavior.
 */
@protocol SRViewChangeDefinition <NSObject>

@optional

/** @name Page View Behaviour */

/** Returns whether the SDK should count the appearance of this controller as a "page view"
 
 @return YES if you want to count the current controller, otherwise NO
 */
- (BOOL)shouldCountPageViews;

/** @name View Change Behaviour */

/** Implement this method to control whether or not Replay records when this view
 controller appears.

 Implementation of this method is optional. (This method has no effect when Replay is not enabled.)

 @deprecated v5.1.0
 @return YES if you want the default behaviour, NO if you want to disable.
 */
- (BOOL)isAutoViewChangeEnabled __attribute__((deprecated("first deprecated in ForeSee SDK 5.1.0 - Replay is no longer supported.")));

/** @name Custom Log Properties */

/** You can optionally provide a custom name when Replay logs view changes.

 The default name will be the class name.

 Implementation of this method is optional. (This method has no effect when Replay is not enabled.)

 @deprecated v5.1.0
 @return The custom view name
 */
- (NSString *)sessionReplayViewName __attribute__((deprecated("first deprecated in ForeSee SDK 5.1.0 - Replay is no longer supported.")));

@end