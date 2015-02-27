//
//  MeetupManager.h
//  JasonTest
//
//  Created by Sky on 2/25/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface MeetupManager : NSObject

//#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MeetupManagerDelegate.h"
#import "MeetupCommunicatorDelegate.h"

@class MeetupCommunicator;

@interface MeetupManager : NSObject<MeetupCommunicatorDelegate>
@property (strong, nonatomic) MeetupCommunicator *communicator;
@property (weak, nonatomic) id<MeetupManagerDelegate> delegate;

- (void)fetchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;
@end

