//
//  GroupBuilder.h
//  JasonTest
//
//  Created by Sky on 2/24/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuilder : NSObject

//+ (NSArray *) groupsFromJSON: (NSData *) objectNotation error: (NSError **)error;

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end


