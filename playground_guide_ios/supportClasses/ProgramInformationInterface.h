//
//  ProgramInformationInterface.h
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

@import Foundation;
#import "InstallationImage.h"

#define VERSION_FILE_NAME @"version"
#define FESTIVAL_DATES_FILE_NAME @"dates"
#define INSTALLATION_FILE_NAME @"installations"
#define INSTALLATION_IMAGES_FILE_NAME @"installationImages"
#define FESTIVAL_STAFF_FILE_NAME @"festivalStaff"
#define SPECIAL_THANKS_FILE_NAME @"thanks"
#define THURSDAY_FILE_NAME @"thursday"
#define FRIDAY_FILE_NAME @"friday"
#define SATURDAY_FILE_NAME @"saturday"
#define BREAKS_FILE_NAME @"breaks"
#define LAST_UPDATE_FILE_NAME @"lastUpdate"


@interface ProgramInformationInterface : NSObject

typedef NS_ENUM(NSInteger, ProgramInformationType){
  VERSION,
  FESTIVAL_DATES,
  INSTALLATION_IMAGES,
  CREDITS_FESTIVAL_STAFF,
  CREDITS_SPECIAL_THANKS,
  SHOW_INFO_THURSDAY,
  SHOW_INFO_FRIDAY,
  SHOW_INFO_SATURDAY,
  SHOW_INFO_INSTALLATION,
  BREAKS
};


@property (nonatomic, strong) NSArray* version;
@property (nonatomic, strong) NSArray* installations;
@property (nonatomic, strong) NSArray* installationImages;
@property (nonatomic, strong) NSArray* festivalStaff;
@property (nonatomic, strong) NSArray* specialThanks;
@property (nonatomic, strong) NSArray* thursday;
@property (nonatomic, strong) NSArray* friday;
@property (nonatomic, strong) NSArray* saturday;


+(id)sharedManager;

//Checks to see whether the last program information update was more than a day ago
-(bool)hasBeenOneDaySinceUpdate;

//Checks to see if this class will return proper information when queried
-(bool)isProgramInfoReady;

//Returns the version number currently on file
-(float)getVersionNumber;

//Parses CSV data into NSDictionaries
//NOTE: If the structure of the Sheets document changes, this function will
//need to be re-written
-(void)parseProgramInformation:(NSData*)programData;

//Saves NSDictionaries to the file system
-(void)saveProgramInformation:(NSString*)fileName programInformation:(NSMutableArray*)programInformation;

//Saves the image to the device, and stores its location in the imageWrapper
-(void)saveInstallationImage:(NSData*)imageData imageWrapper:(InstallationImage*)imageWrapper;

//Returns the path to an image
-(NSString*)getPathToInstallationImage:(InstallationImage*)imageWrapper;

//Returns the full file path for a fileName
-(NSString*)pathToFile:(NSString*)fileName;

//Returns an array of the data stored in the fileName
-(NSArray*)getProgramInformation:(NSString*)fileName;

@end
