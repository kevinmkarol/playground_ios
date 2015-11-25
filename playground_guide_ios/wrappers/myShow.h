//
//  myShow.h
//  playground2014
//
//  Created by Kevin Karol on 5/26/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowInfo.h"

@interface myShow : NSObject

@property (nonatomic, retain) UILocalNotification *showNotification;
@property (nonatomic, retain) ShowInfo *showStats;

@end
