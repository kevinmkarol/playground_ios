//
//  WebInterfaceController.h
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/25/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTLDrive.h"

#define PLAYGROUND_SHEET_URL @"https://docs.google.com/spreadsheets/d/1cWkRhxul9vv7amo6ASlC2PyRal57hYwJdW09f7FE0Sw/pub?gid=0&single=true&output=csv" 

//@"https://docs.google.com/spreadsheets/d/1cWkRhxul9vv7amo6ASlC2PyRal57hYwJdW09f7FE0Sw/edit?alt=media"

@interface WebInterfaceController : NSObject

-(void)fetchNewProgramInformation;

@end
