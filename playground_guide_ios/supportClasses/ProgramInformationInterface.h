//
//  ProgramInformationInterface.h
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

@import Foundation;

#define VERSION_FILE_NAME @"version.json"
#define INSTALLATION_FILE_NAME @"installations.json"
#define INSTALLATION_IMAGES_FILE_NAME @"installationImages.json"
#define FESTIVAL_STAFF_FILE_NAME @"festivalStaff.json"
#define SPECIAL_THANKS_FILE_NAME @"thanks.json"
#define THURSDAY_FILE_NAME @"thursday.json"
#define FRIDAY_FILE_NAME @"friday.json"
#define SATURDAY_FILE_NAME @"saturday.json"


@interface ProgramInformationInterface : NSObject

typedef NS_ENUM(NSInteger, ProgramInformationType){
  VERSION,
  INSTALLATION_IMAGES,
  CREDITS_FESTIVAL_STAFF,
  CREDITS_SPECIAL_THANKS,
  SHOW_INFO_THURSDAY,
  SHOW_INFO_FRIDAY,
  SHOW_INFO_SATURDAY,
  SHOW_INFO_INSTALLATION
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


//Parses CSV data into NSDictionaries
//NOTE: If the structure of the Sheets document changes, this function will
//need to be re-written
-(void)parseProgramInformation:(NSData*)programData;

//Saves NSDictionaries to the file system
-(void)saveProgramInformation:(NSString*)fileName programInformation:(NSMutableArray*)programInformation;

//Returns the full file path for a fileName
-(NSString*)pathToJSONFile:(NSString*)fileName;

//Returns an array of the data stored in the fileName
-(NSArray*)getProgramInformation:(NSString*)fileName;

@end
