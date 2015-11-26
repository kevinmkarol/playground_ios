//
//  WebInterfaceController.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "WebInterfaceController.h"
#import "ProgramInformationInterface.h"

@implementation WebInterfaceController


-(id) init{
  if(self = [super init]){

  }
  
  return self;
}

+(id) sharedManager{
   static WebInterfaceController* sharedWebInterface = nil;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
        sharedWebInterface = [[self alloc] init];
   });

   return sharedWebInterface;
}

-(void)fetchNewProgramInformation
{
  GTLServiceDrive *drive = [[GTLServiceDrive alloc] init];
  GTLDriveFile *file = [[GTLDriveFile alloc] init];
  GTMSessionFetcher* fetcher = [drive.fetcherService fetcherWithURLString:PLAYGROUND_SHEET_URL];

  
  [fetcher beginFetchWithCompletionHandler:^(NSData *data, NSError *error){
    if(error == nil){
        [[ProgramInformationInterface sharedManager] parseProgramInformation:data];
    }else{
      NSLog(@"An error occured: %@", error);
    }
  }];

}






@end
