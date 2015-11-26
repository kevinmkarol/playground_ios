//
//  ProgramInformationInterface.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "ProgramInformationInterface.h"
#import "ShowInfo.h"
#import "InstallationImage.h"
#import "CreditInfo.h"
#import "InstallationInfo.h"

@implementation ProgramInformationInterface

-(id) init{
  if(self = [super init]){
    _version = nil;
    _installations = nil;
    _installationImages = nil;
    _festivalStaff = nil;
    _specialThanks = nil;
    _thursday = nil;
    _friday = nil;
    _saturday = nil;
  }
  
  return self;
}

+(id) sharedManager{
   static ProgramInformationInterface* sharedProgramInformation = nil;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
        sharedProgramInformation = [[self alloc] init];
   });

   return sharedProgramInformation;
}


-(NSString*)pathToJSONFile:(NSString*)fileName
{
  NSFileManager* fm = [NSFileManager defaultManager];
  NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask, YES);
  NSString* documentsDirectory = [paths objectAtIndex:0];
  NSString* jsonDirectory = [documentsDirectory
                               stringByAppendingPathComponent:@"jsonFiles"];
    
  NSError* err;
  [fm createDirectoryAtPath:jsonDirectory
                             withIntermediateDirectories:YES attributes:nil error:&err];
    
  NSString* filePath = [jsonDirectory
                        stringByAppendingPathComponent:fileName];

  return filePath;
}


-(void)saveProgramInformation:(NSString*)fileName programInformation:(NSMutableArray*)programInformation
{
  NSFileManager* fm = [NSFileManager defaultManager];
  NSString* filePath = [self pathToJSONFile:fileName];

  NSData* fileData =  [NSKeyedArchiver archivedDataWithRootObject:programInformation];
  [fm createFileAtPath:filePath contents:fileData attributes:nil];
  
  
  //Keep the in-memory cache up to date
  if([fileName isEqualToString:VERSION_FILE_NAME]){
    _version = programInformation;
  }else if([fileName isEqualToString: INSTALLATION_FILE_NAME]){
    _installations = programInformation;
  }else if([fileName isEqualToString: INSTALLATION_IMAGES_FILE_NAME]){
    _installationImages = programInformation;
  }else if([fileName isEqualToString: FESTIVAL_STAFF_FILE_NAME]){
    _festivalStaff = programInformation;
  }else if([fileName isEqualToString: SPECIAL_THANKS_FILE_NAME]){
    _specialThanks = programInformation;
  }else if([fileName isEqualToString: THURSDAY_FILE_NAME]){
    _thursday = programInformation;
  }else if([fileName isEqualToString: FRIDAY_FILE_NAME]){
    _friday = programInformation;
  }else if([fileName isEqualToString: SATURDAY_FILE_NAME]){
    _saturday = programInformation;
  }

}


-(NSArray*)getProgramInformation:(NSString*)fileName
{
  NSString* filePath = [self pathToJSONFile:fileName];
  NSError* err;

  NSArray* fileContents;
  NSArray* cachedArray;

  if([fileName isEqualToString:VERSION_FILE_NAME]){
    cachedArray = _version;
  }else if([fileName isEqualToString: INSTALLATION_FILE_NAME]){
    cachedArray = _installations;
  }else if([fileName isEqualToString: INSTALLATION_IMAGES_FILE_NAME]){
    cachedArray = _installationImages;
  }else if([fileName isEqualToString: FESTIVAL_STAFF_FILE_NAME]){
    cachedArray = _festivalStaff;
  }else if([fileName isEqualToString: SPECIAL_THANKS_FILE_NAME]){
    cachedArray = _specialThanks;
    
  }else if([fileName isEqualToString: THURSDAY_FILE_NAME]){
    cachedArray = _thursday;

  }else if([fileName isEqualToString: FRIDAY_FILE_NAME]){
    cachedArray = _friday;
  }else if([fileName isEqualToString: SATURDAY_FILE_NAME]){
    cachedArray = _saturday;
  }
  
  if(cachedArray != nil){
    fileContents = _version;
  }else{
    NSData* rawFile = [NSData dataWithContentsOfFile:filePath];
    NSArray* savedInfo =  [NSKeyedUnarchiver unarchiveObjectWithData:rawFile];
    cachedArray = savedInfo;
    fileContents = savedInfo;
  }
  
  return fileContents;
}

-(void)parseProgramInformation:(NSData*)programData
{
  NSString* sheetsContents = [[NSString alloc] initWithData:programData encoding:NSUTF8StringEncoding];
  NSArray* lines = [sheetsContents componentsSeparatedByString:@"\r\n"];


  //Create date formatter
  NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
  //dateFormatter.timeStyle = NSDateFormatterShortStyle;
  //dateFormatter.dateStyle = NSDateFormatterShortStyle;
 
  NSLocale* usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
  [dateFormatter setLocale:usLocale];
  [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
  [dateFormatter setDateFormat:@"MM-dd-yyyy-H-mm-ss"];
  
  //Initialize data for for loop
  ProgramInformationType currentInfo = VERSION;
  NSMutableArray* cumulativeData = [[NSMutableArray alloc] init];
  
  for(NSString* line in lines){
    NSArray* fields = [line componentsSeparatedByString:@","];
    
    //Save data to files when see row with special heading
    if([fields[0] isEqualToString:@"Installation Images"]){
      currentInfo = INSTALLATION_IMAGES;
      continue;
    }else if([fields[0] isEqualToString:@"Festival Staff"]){
      currentInfo = CREDITS_FESTIVAL_STAFF;
      [self saveProgramInformation:INSTALLATION_IMAGES_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }else if([fields[0] isEqualToString:@"Special Thanks"]){
      currentInfo = CREDITS_SPECIAL_THANKS;
      [self saveProgramInformation:FESTIVAL_STAFF_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }else if([fields[0] isEqualToString:@"Thursday"]){
      currentInfo = SHOW_INFO_THURSDAY;
      [self saveProgramInformation:SPECIAL_THANKS_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }else if([fields[0] isEqualToString:@"Friday"]){
      currentInfo = SHOW_INFO_FRIDAY;
      [self saveProgramInformation:THURSDAY_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }else if([fields[0] isEqualToString:@"Saturday"]){
      currentInfo = SHOW_INFO_SATURDAY;
      [self saveProgramInformation:FRIDAY_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }else if([fields[0] isEqualToString:@"Installations"]){
      currentInfo = SHOW_INFO_INSTALLATION;
      [self saveProgramInformation:SATURDAY_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }else if([fields[0] isEqualToString:@"End"]){
      [self saveProgramInformation:INSTALLATION_FILE_NAME programInformation:cumulativeData];
      [cumulativeData removeAllObjects];
      continue;
    }

    //Parse data for current data type
    switch(currentInfo){
       case VERSION:
         break;
         
       case INSTALLATION_IMAGES:{
        InstallationImage* currentImage = [[InstallationImage alloc] init];
        [currentImage setImageName:fields[1]];
        NSURL* url = [[NSURL alloc] initWithString: fields[2]];
        [currentImage setImageURL:url];
        [cumulativeData addObject:currentImage];
         break;
       }
       case CREDITS_FESTIVAL_STAFF:{
         CreditInfo* currentCredit = [[CreditInfo alloc] init];
         [currentCredit setPositionTitle:fields[1]];
         [currentCredit setName:fields[2]];
         [cumulativeData addObject:currentCredit];
         break;
       }
       case CREDITS_SPECIAL_THANKS:{
         CreditInfo* currentCredit = [[CreditInfo alloc] init];
         [currentCredit setName:fields[1]];
         [cumulativeData addObject:currentCredit];
         break;
       }
       case SHOW_INFO_THURSDAY:
       case SHOW_INFO_FRIDAY:
       case SHOW_INFO_SATURDAY:{

         NSDate* date = [dateFormatter dateFromString:fields[3]];
         
         NSString* commaSeperatedParticipants = fields[8];
         NSArray* participants = [commaSeperatedParticipants componentsSeparatedByString:@" - "];
       
         ShowInfo* currentShow = [[ShowInfo alloc] init];
         [currentShow setTitle:fields[1]];
         [currentShow setLocation:fields[2]];
         [currentShow setDate:date];
         [currentShow setProgramNote: fields[4]];
         [currentShow setSpecialThanks:fields[5]];
         [currentShow setAudienceWarnings:fields[6]];
         [currentShow setShowCreator:fields[7]];
         [currentShow setParticipants:participants];

         [cumulativeData addObject:currentShow];
         break;
       }
       case SHOW_INFO_INSTALLATION:{
         NSString* commaSeperatedParticipants = fields[8];
         NSArray* participants = [commaSeperatedParticipants componentsSeparatedByString:@" - "];
       
         InstallationInfo* currentShow = [[InstallationInfo alloc] init];
         [currentShow setTitle:fields[1]];
         [currentShow setLocation:fields[2]];
         [currentShow setProgramNote: fields[4]];
         [currentShow setSpecialThanks:fields[5]];
         [currentShow setAudienceWarnings:fields[6]];
         [currentShow setShowCreator:fields[7]];
         [currentShow setParticipants:participants];

         [cumulativeData addObject:currentShow];
         break;
         break;
       }
    }
  }
}


@end