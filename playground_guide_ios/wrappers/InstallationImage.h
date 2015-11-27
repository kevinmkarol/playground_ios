/**
*  InstallationImage.h
*  playground_guide_ios
*
*  Created by Kevin Karol on 11/25/15.
*  Copyright © 2015 Kevin Karol. All rights reserved.
*
*  A wrapper class for Installation Images
**/

#import <Foundation/Foundation.h>

@interface InstallationImage : NSObject<NSCoding>

@property (nonatomic, strong) NSString* imageName;
@property (nonatomic, strong) NSURL* webURL;

- (void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;

@end

