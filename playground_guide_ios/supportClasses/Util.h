//
//  Util.h
//  playground2014
//
//  Created by Kevin Karol on 1/2/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Util : NSObject

#define getDataURL @"http://kevinmkarol.com/playgroundapp"

+(NSDictionary *)upcomingShows;
+(BOOL) isIpad;


@end
