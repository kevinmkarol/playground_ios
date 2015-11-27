/**
*  CreditInfo.h
*  playground_guide_ios
*
*  Created by Kevin Karol on 11/25/15.
*  Copyright © 2015 Kevin Karol. All rights reserved.
*
*  A wrapper class for playground credits
**/

#import <Foundation/Foundation.h>

@interface CreditInfo : NSObject<NSCoding>

@property (nonatomic, strong) NSString* positionTitle;
@property (nonatomic, strong) NSString* name;


- (void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;

@end
