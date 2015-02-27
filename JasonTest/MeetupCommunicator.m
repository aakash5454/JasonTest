//
//  MeetupCommunicator.m
//  JasonTest
//
//  Created by Sky on 2/24/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import "MeetupCommunicator.h"
#import "MeetupCommunicatorDelegate.h"

#define API_KEY  @"36379761b3b5b761160557b5970731f"
#define PAGE_COUNT 20

@implementation MeetupCommunicator


- (void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@", coordinate.latitude, coordinate.longitude, PAGE_COUNT, API_KEY];
        NSLog(@"the latitude is %f", coordinate.latitude);
        NSLog(@"the longitude is %f", coordinate.longitude);
    
    
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    NSLog(@"%@", urlString);
  //  NSURLRequest *requestObject = [[NSURLRequest alloc]initWithURL:url];
    
     [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error)
        {
            [self.delegate fetchingGroupsFailedWithError:error];
        }
        else
        {
            [self.delegate receivedGroupsJSON:data];
        }
    }];
}

@end


/*

#import "MeetupCommunicator.h"
#import "MeetupCommunicatorDelegate.h"

#define API_KEY @"1f5718c16a7fb3a5452f45193232"
#define PAGE_COUNT 20

@implementation MeetupCommunicator

- (void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@", coordinate.latitude, coordinate.longitude, PAGE_COUNT, API_KEY];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingGroupsFailedWithError:error];
        } else {
            [self.delegate receivedGroupsJSON:data];
        }
    }];
}

@end








*/








