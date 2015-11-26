//
//  BreakInfo.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "BreakInfo.h"

@implementation BreakInfo

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:self.date forKey:@"DATE"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
  if(self = [super init]){
    self.date = [aDecoder decodeObjectForKey:@"DATE"];
  }
  return self;

}


@end
