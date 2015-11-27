/**
*  InstallationInfo.m
*  playground_guide_ios
*
*  Created by Kevin Karol on 11/25/15.
*  Copyright © 2015 Kevin Karol. All rights reserved.
**/

#import "InstallationInfo.h"

@implementation InstallationInfo


- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:self.title forKey:@"TITLE"];
  [aCoder encodeObject:self.participants forKey:@"PARTICIPANTS"];
  [aCoder encodeObject:self.programNote forKey:@"PROGRAM_NOTE"];
  [aCoder encodeObject:self.specialThanks forKey:@"SPECIAL_THANKS"];
  [aCoder encodeObject:self.audienceWarnings forKey:@"AUDIENCE_WARNING"];
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
    self.location = [aDecoder decodeObjectForKey:@"LOCATION"];
    self.showCreator = [aDecoder decodeObjectForKey:@"SHOW_CREATOR"];
  }
  return self;

}

@end
