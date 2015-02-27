//
//  MeetupCommunicator.h
//  JasonTest
//
//  Created by Sky on 2/24/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MeetupCommunicatorDelegate;

@interface MeetupCommunicator : NSObject

@property (weak, nonatomic) id<MeetupCommunicatorDelegate> delegate;

- (void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;

/*  code that I wrote.
@property (weak, nonatomic) id <MeetupCommunicatorDelegate> delegate;

- (void) searchGroupsAtCoordinate: (CLLocationCoordinate2D) coordinate;
*/

@end
