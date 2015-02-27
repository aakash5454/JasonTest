//
//  MeetupCommunicatorDelegate.h
//  JasonTest
//
//  Created by Sky on 2/24/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupCommunicatorDelegate <NSObject>


- (void)receivedGroupsJSON:(NSData *)objectNotation;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

//things that I wrote:
/*
-(void) receivedGroupJSON: (NSData *) objectNotation;
-(void) fetchingGroupsFailedWithError: (NSError *) error;
*/
@end
