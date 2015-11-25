//
//  ShowInfo.h
//  playground2014
//
//  Created by Kevin Karol on 5/25/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowInfo : NSObject

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSMutableArray *participants;
@property (retain, nonatomic) NSString *description;
@property (retain, nonatomic) NSString *specialThanks;
@property (retain, nonatomic) NSString *audienceWarnings;
@property (retain, nonatomic) NSString *time;
@property (retain, nonatomic) NSString *location;
@property (retain, nonatomic) NSString *showCreator;


@end
