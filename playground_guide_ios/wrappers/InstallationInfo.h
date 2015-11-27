/**
*  InstallationInfo.h
*  playground_guide_ios
*
*  Created by Kevin Karol on 11/25/15.
*  Copyright © 2015 Kevin Karol. All rights reserved.
*
*  A wrapper class for installation information
**/

#import <Foundation/Foundation.h>

@interface InstallationInfo : NSObject<NSCoding>

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSArray *participants;
@property (retain, nonatomic) NSString *programNote;
@property (retain, nonatomic) NSString *specialThanks;
@property (retain, nonatomic) NSString *audienceWarnings;
@property (retain, nonatomic) NSString *location;
@property (retain, nonatomic) NSString *showCreator;

- (void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;

@end
