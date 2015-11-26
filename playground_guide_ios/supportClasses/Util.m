//
//  Util.m
//  playground2014
//
//  Created by Kevin Karol on 1/2/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "Util.h"
#import "helpers.h"
#import "ShowInfo.h"

@implementation Util

+(void)retrieveData{
    if([helpers needsUpdate]){
        NSURL * url = [NSURL URLWithString: getDataURL];
        NSData * data = [NSData dataWithContentsOfURL: url];
        if(data != nil){
            NSDictionary *jsonArray;
    
            jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentFolder = [path objectAtIndex:0];
            NSString *filePath;

            NSArray *thursday = [jsonArray objectForKey:@"thursday"];
            NSArray *friday = [jsonArray objectForKey: @"friday"];
            NSArray *saturday = [jsonArray objectForKey:@"saturday"];
            NSArray *installation = [jsonArray objectForKey:@"installation"];
    
            NSArray *breaks = [jsonArray objectForKey: @"breakTimes"];

            path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            documentFolder = [path objectAtIndex:0];
            filePath = [documentFolder stringByAppendingPathComponent:@"thursday.plist"];
    
    
            [thursday writeToFile:filePath atomically: YES];
    
            filePath = [documentFolder stringByAppendingPathComponent:@"friday.plist"];

            [friday writeToFile:filePath atomically: YES];
    
            filePath = [documentFolder stringByAppendingPathComponent:@"saturday.plist"];
            [saturday writeToFile:filePath atomically: YES];
    
            filePath = [documentFolder stringByAppendingPathComponent:@"installation.plist"];
            [installation writeToFile:filePath atomically: YES];
    
            filePath = [documentFolder stringByAppendingPathComponent:@"breaks.plist"];
            [breaks writeToFile:filePath atomically: YES];
        
            NSTimeInterval oneDay = 86400;
            NSDate *tomorrow = [[NSDate alloc] initWithTimeIntervalSinceNow:oneDay];
            NSArray *oneEntry = [NSArray arrayWithObject:tomorrow];
            filePath = [documentFolder stringByAppendingString:@"update.plist"];
            [oneEntry writeToFile:filePath atomically:YES];
        }
        //Update the updater file so that it only connects every 24 hours

    }

}


+(NSMutableArray *) arrayContentsOfFile: (NSString *)fileName{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [path objectAtIndex:0];
    NSString *filePath = [documentFolder stringByAppendingPathComponent: fileName];
    
    NSMutableArray *result = [NSMutableArray arrayWithContentsOfFile: filePath];
    return result;
}

+(NSDictionary *) upcomingShows{
    NSTimeZone *eastern = [NSTimeZone timeZoneWithName:@"America/New_York"];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
	// Do any additional setup after loading the view, typically from a nib.

    //set up array for breaktimes
    NSMutableArray *listOfBreaks = [Util arrayContentsOfFile:@"breaks.plist"];
    
    //set up array for showtimes
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear: 2014];
    [comps setMonth: 1];
    [comps setDay: 30];
    [comps setTimeZone: eastern];
    
    NSDate *thursday = [gregorian dateFromComponents:comps];

    [comps setMonth: 1];
    [comps setDay: 31];
    
    NSDate *friday = [gregorian dateFromComponents:comps];
    
    [comps setMonth: 2];
    [comps setDay: 1];
    
    NSDate *saturday = [gregorian dateFromComponents: comps];
    
    //determine day of weekend by specific date strings, load appropriate file - cycle through and place proper in place.
    NSMutableArray *shows;
    

    if([saturday timeIntervalSinceNow] < 0){
        shows = [Util arrayContentsOfFile:@"saturday.plist"];
        
    }
    else if([friday timeIntervalSinceNow] < 0){
        shows = [Util arrayContentsOfFile:@"friday.plist"];
    }
    else{
        shows = [Util arrayContentsOfFile:@"thursday.plist"];
    }


    //Search through the assigend plist and pull the first
    //time that hasn't passed yet
    //Pre-Condition: Assumes plist is ordered chronologically
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] initWithCapacity:10];
    int iterations = [shows count] - 1;
    int i = 0;
    BOOL searching = YES;
    NSDateComponents *performanceTime = [[NSDateComponents alloc] init];
    [performanceTime setYear: 2014];
    [returnDict setValue:@"null" forKey: @"NextTitle"];
    [returnDict setValue: @"null" forKey: @"nextBreak"];
    [returnDict setValue:@"null" forKey: @"CurrentTitle"];
    [returnDict setValue:@"null" forKey: @"AfterTitle"];


    
    
    while((iterations >= i) && searching){
        NSDictionary *show = [shows objectAtIndex:i];
        [performanceTime setMonth: [[show objectForKey:@"month"] integerValue]];
        [performanceTime setDay: [[show objectForKey:@"day"] integerValue]];
        [performanceTime setHour: [[show objectForKey:@"hour"] integerValue]];
        [performanceTime setMinute:[[show objectForKey:@"minutes"] integerValue]];
        
        NSDate *showTime = [gregorian dateFromComponents:performanceTime];
        
        
        // POSSIBLY ADD DISTINCTION HERE FOR IPAD AND IPHONE
        if([showTime timeIntervalSinceNow] > 0){
            //Coming Up
            [returnDict setValue:[show objectForKey:@"title"] forKey: @"NextTitle"];
            [returnDict setValue:[show objectForKey:@"locationAbbr"] forKey: @"NextLocation"];
            [returnDict setValue:[show objectForKey:@"time"] forKey: @"NextTime"];
            if([Util isIpad]){
                [returnDict setValue:[show objectForKey:@"description"] forKey: @"NextDescription"];
                [returnDict setValue:[show objectForKey:@"location"] forKey: @"NextLocation"];
            }
            
            //check if there's a currently playing, otherwise set to null
            if(i != 0){
                NSDictionary *previousShow = [shows objectAtIndex: i -1];
                [returnDict setValue:[previousShow objectForKey:@"title"] forKey: @"CurrentTitle"];
                [returnDict setValue:[previousShow objectForKey:@"locationAbbr"] forKey: @"CurrentLocation"];
                [returnDict setValue:[previousShow objectForKey:@"time"] forKey: @"CurrentTime"];
                if([Util isIpad]){
                    [returnDict setValue:[previousShow objectForKey:@"description"] forKey: @"CurrentDescription"];
                    [returnDict setValue:[previousShow objectForKey:@"location"] forKey: @"CurrentLocation"];
                    
                }
            }
            
            //check if there's an afterThat
            if(i != iterations){
                NSDictionary *afterShow = [shows objectAtIndex: i +1];
                [returnDict setValue:[afterShow objectForKey:@"title"] forKey: @"AfterTitle"];
                [returnDict setValue:[afterShow objectForKey:@"locationAbbr"] forKey: @"AfterLocation"];
                [returnDict setValue:[afterShow objectForKey:@"time"] forKey: @"AfterTime"];
                if([Util isIpad]){
                    [returnDict setValue:[afterShow objectForKey:@"description"] forKey: @"AfterDescription"];
                    [returnDict setValue:[afterShow objectForKey:@"location"] forKey: @"AfterLocation"];
                    
                }
                
            }
            searching = false;
        }
        i = i +1;
    }
    
    i = 0;
    searching = true;
    iterations = [listOfBreaks count];
    
    //find next upcoming break
    while(iterations > i && searching){
        NSDictionary *possibleBreak = [listOfBreaks objectAtIndex:i];
        [performanceTime setMonth: [[possibleBreak objectForKey:@"month"] integerValue]];
        [performanceTime setDay: [[possibleBreak objectForKey:@"day"] integerValue]];
        [performanceTime setHour: [[possibleBreak objectForKey:@"hour"] integerValue]];
        [performanceTime setMinute:[[possibleBreak objectForKey:@"minute"] integerValue]];
        
    
    
        NSDate *breakTime = [gregorian dateFromComponents:performanceTime];
        //break updates for next day but show doesn't...
        if([thursday timeIntervalSinceNow] < 0){
            if([breakTime timeIntervalSinceNow] > 0 ){
                [returnDict setValue:[possibleBreak objectForKey:@"time"] forKey: @"nextBreak"];
                searching = false;
            }
        }
        i = i + 1;
    }
    
    return returnDict;

}

+(BOOL) isIpad{
#ifdef UI_USER_INTERFACE_IDIOM
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
#else
    return NO;
#endif
}




@end
