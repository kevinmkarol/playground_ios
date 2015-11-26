//
//  CreditInfo.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "CreditInfo.h"

@implementation CreditInfo

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:self.positionTitle forKey:@"POSITION_TITLE"];
  [aCoder encodeObject:self.name forKey:@"NAME"];

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
  if(self = [super init]){
    self.positionTitle = [aDecoder decodeObjectForKey:@"POSITION_TITLE"];
    self.name = [aDecoder decodeObjectForKey:@"NAME"];

  }
  return self;

}

@end
