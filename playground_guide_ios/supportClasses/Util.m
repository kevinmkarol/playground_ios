//
//  Util.m
//  playground2014
//
//  Created by Kevin Karol on 1/2/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "Util.h"
#import "ShowInfo.h"
#import "ProgramInformationInterface.h"
#import "BreakInfo.h"

@implementation Util


+(NSDictionary *) upcomingShows{
	// Do any additional setup after loading the view, typically from a nib.
    NSCalendar *gregorian = [NSCalendar currentCalendar];

    //set up array for breaktimes
    NSArray *listOfBreaks = [[ProgramInformationInterface sharedManager] getProgramInformation:BREAKS_FILE_NAME];
    
    //set up array for showtimes
    NSArray* listOfDates = [[ProgramInformationInterface sharedManager] getProgramInformation:FESTIVAL_DATES_FILE_NAME];
    
    NSDate *thursday = listOfDates[0];
    NSDate *friday = listOfDates[1];
    NSDate *saturday = listOfDates[2];
    
    //determine day of weekend by specific date strings, load appropriate file - cycle through and place proper in place.
    NSArray *shows;
    
    if([saturday timeIntervalSinceNow] < 0){
        shows = [[ProgramInformationInterface sharedManager] getProgramInformation:SATURDAY_FILE_NAME];
        
    }
    else if([friday timeIntervalSinceNow] < 0){
        shows = [[ProgramInformationInterface sharedManager] getProgramInformation:FRIDAY_FILE_NAME];
    }
    else{
        shows = [[ProgramInformationInterface sharedManager] getProgramInformation:THURSDAY_FILE_NAME];
    }


    //Search through the assigend plist and pull the first
    //time that hasn't passed yet
    //Pre-Condition: Assumes plist is ordered chronologically
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] initWithCapacity:10];
    int iterations = [shows count] - 1;
    int i = 0;
    BOOL searching = YES;
    [returnDict setValue:@"null" forKey: @"NextTitle"];
    [returnDict setValue: @"null" forKey: @"nextBreak"];
    [returnDict setValue:@"null" forKey: @"CurrentTitle"];
    [returnDict setValue:@"null" forKey: @"AfterTitle"];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm"];
    
    
    while((iterations >= i) && searching){
        ShowInfo *show = [shows objectAtIndex:i];
    
        // POSSIBLY ADD DISTINCTION HERE FOR IPAD AND IPHONE
        if([[show date] timeIntervalSinceNow] > 0){
            //Coming Up
            [returnDict setValue:[show title] forKey: @"NextTitle"];
            [returnDict setValue:[show location] forKey: @"NextLocation"];
            [returnDict setValue:[dateFormatter stringFromDate:[show date]] forKey: @"NextTime"];
            if([Util isIpad]){
                [returnDict setValue:[show programNote] forKey: @"NextDescription"];
                [returnDict setValue:[show location] forKey: @"NextLocation"];
            }
            
            //check if there's a currently playing, otherwise set to null
            if(i != 0){
                ShowInfo *previousShow = [shows objectAtIndex: i -1];
                [returnDict setValue:[previousShow title] forKey: @"CurrentTitle"];
                [returnDict setValue:[previousShow location] forKey: @"CurrentLocation"];
                [returnDict setValue:[dateFormatter stringFromDate:[previousShow date]] forKey: @"CurrentTime"];
                if([Util isIpad]){
                    [returnDict setValue:[previousShow programNote] forKey: @"CurrentDescription"];
                    [returnDict setValue:[previousShow location] forKey: @"CurrentLocation"];
                    
                }
            }
            
            //check if there's an afterThat
            if(i != iterations){
                ShowInfo *afterShow = [shows objectAtIndex: i +1];
                [returnDict setValue:[afterShow title] forKey: @"AfterTitle"];
                [returnDict setValue:[afterShow location] forKey: @"AfterLocation"];
                [returnDict setValue:[dateFormatter stringFromDate:[afterShow date]] forKey: @"AfterTime"];
                if([Util isIpad]){
                    [returnDict setValue:[afterShow programNote] forKey: @"AfterDescription"];
                    [returnDict setValue:[afterShow location] forKey: @"AfterLocation"];
                    
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
        BreakInfo *possibleBreak = [listOfBreaks objectAtIndex:i];
        
        //break updates for next day but show doesn't...
        if([thursday timeIntervalSinceNow] < 0){
            if([[possibleBreak date] timeIntervalSinceNow] > 0 ){
                [returnDict setValue:[dateFormatter stringFromDate:[possibleBreak date]] forKey: @"nextBreak"];
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
