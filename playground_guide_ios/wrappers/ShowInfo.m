/**
*  ShowInfo.m
*  playground2014
*
*  Created by Kevin Karol on 5/25/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "ShowInfo.h"

@implementation ShowInfo

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:self.title forKey:@"TITLE"];
  [aCoder encodeObject:self.participants forKey:@"PARTICIPANTS"];
  [aCoder encodeObject:self.programNote forKey:@"PROGRAM_NOTE"];
  [aCoder encodeObject:self.specialThanks forKey:@"SPECIAL_THANKS"];
  [aCoder encodeObject:self.audienceWarnings forKey:@"AUDIENCE_WARNING"];
  [aCoder encodeObject:self.date forKey:@"DATE"];
  [aCoder encodeObject:self.location forKey:@"LOCATION"];
  [aCoder encodeObject:self.showCreator forKey:@"SHOW_CREATOR"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
  if(self = [super init]){
    self.title = [aDecoder decodeObjectForKey:@"TITLE"];
    self.participants = [aDecoder decodeObjectForKey:@"PARTICIPANTS"];
    self.programNote = [aDecoder decodeObjectForKey:@"PROGRAM_NOTE"];
    self.specialThanks = [aDecoder decodeObjectForKey:@"SPECIAL_THANKS"];
    self.audienceWarnings = [aDecoder decodeObjectForKey:@"AUDIENCE_WARNING"];
    self.date = [aDecoder decodeObjectForKey:@"DATE"];
    self.location = [aDecoder decodeObjectForKey:@"LOCATION"];
    self.showCreator = [aDecoder decodeObjectForKey:@"SHOW_CREATOR"];
  }
  return self;

}



@end
