//
//  CustomInviteHandler.h
//  CustomInvitationSample
//
//  Created by Wayne Burkett on 5/31/16.
//  Copyright © 2016 ForeSee. All rights reserved.
//

#import <ForeSeeCxMeasure/FSInviteHandler.h>
#import <UIKit/UIKit.h>
#import <ForeSee/ForeSee.h>

@interface CustomInviteHandler : NSObject <FSInviteHandler>

- (id)initWithViewController:(UIViewController *)viewController;

@end
