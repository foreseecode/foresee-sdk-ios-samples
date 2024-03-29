//
//  AppDelegate.h
//  LocalNotificationSample
//
//  Created by Michael Han on 12-06-08.
//  Copyright (c) 2012 ForeSee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@class ViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)initializeSDK;

@end
