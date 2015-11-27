/**
*  ShowInfo.h
*  playground2014
*
*  Created by Kevin Karol on 5/25/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  A wrapper class for showInformation
**/

#import <Foundation/Foundation.h>

@interface ShowInfo : NSObject<NSCoding>

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSArray *participants;
@property (retain, nonatomic) NSString *programNote;
@property (retain, nonatomic) NSString *specialThanks;
@property (retain, nonatomic) NSString *audienceWarnings;
@property (retain, nonatomic) NSDate *date;
@property (retain, nonatomic) NSString *location;
@property (retain, nonatomic) NSString *showCreator;

- (void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;


@end
