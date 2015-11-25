//
//  helpers.m
//  playground2014
//
//  Created by Kevin Karol on 1/7/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "helpers.h"
#import "Util.h"

@implementation helpers


+(BOOL) needsUpdate{
    NSArray *lastUpdate = [Util arrayContentsOfFile:@"update.plist"];
    NSDate *lastTime = [lastUpdate objectAtIndex:0];
    if([lastTime timeIntervalSinceNow] < 0){
        return YES;
    }
    else{
        return NO;
    }
}



@end

