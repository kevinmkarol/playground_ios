//
//  InstallationImage.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "InstallationImage.h"

@implementation InstallationImage

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:self.imageName forKey:@"IMAGE_NAME"];
  [aCoder encodeObject:self.imageURL forKey:@"IMAGE_URL"];

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
  if(self = [super init]){
    self.imageName = [aDecoder decodeObjectForKey:@"IMAGE_NAME"];
    self.imageURL = [aDecoder decodeObjectForKey:@"IMAGE_URL"];

  }
  return self;

}

@end
