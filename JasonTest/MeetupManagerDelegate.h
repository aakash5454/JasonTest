//
//  MeetupManagerDelegate.h
//  JasonTest
//
//  Created by Sky on 2/25/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupManagerDelegate <NSObject>

- (void)didReceiveGroups:(NSArray *)groups;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

@end

