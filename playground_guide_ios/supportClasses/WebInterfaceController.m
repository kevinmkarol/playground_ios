//
//  WebInterfaceController.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "WebInterfaceController.h"


@implementation WebInterfaceController


-(void)fetchNewProgramInformation
{
  GTLServiceDrive *drive = [[GTLServiceDrive alloc] init];
  GTLDriveFile *file = [[GTLDriveFile alloc] init];
  GTMSessionFetcher* fetcher = [drive.fetcherService fetcherWithURLString:PLAYGROUND_SHEET_URL];

  
  [fetcher beginFetchWithCompletionHandler:^(NSData *data, NSError *error){
    if(error == nil){
       NSLog(@"We're going to need a bigger function");
       NSString* sheetsContents = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSArray* lines = [sheetsContents componentsSeparatedByString:@"\r\n"];

       NSLog(sheetsContents);
    }else{
      NSLog(@"An error occured: %@", error);
    }
  }];

}


@end
