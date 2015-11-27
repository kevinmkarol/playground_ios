/**
*  SecondViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/1/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "iPad_Home_ViewController.h"
#import "Util.h"
#import <iAd/iAd.h>
#import "ProgramInformationInterface.h"

@implementation iPad_Home_ViewController

-(void) updateHome
{
   if([[ProgramInformationInterface sharedManager] isProgramInfoReady]){

        NSDictionary *shows = [Util upcomingShows];
        NSString *nextTitle = [shows objectForKey:@"NextTitle"];
        NSString *currentTitle = [shows objectForKey:@"CurrentTitle"];
        NSString *afterTitle = [shows objectForKey:@"AfterTitle"];
        NSString *nextBreak = [shows objectForKey:@"nextBreak"];
        
        
        //update playing now
        if(![currentTitle isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.nowTitle setText: currentTitle];
            [self.nowTitle setTextColor:[UIColor whiteColor]];
            [self.nowTitle setFont:[UIFont fontWithName:@"ArialMT" size:20]];
            [self.nowTitle setAdjustsFontSizeToFitWidth: YES];

            
            NSString *currentTime = [shows objectForKey:@"CurrentTime"];
            NSString *currentLocation = [shows objectForKey: @"CurrentLocation"];
            NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@ \n%@ Theater",
                                                         currentTime, currentLocation];
            [self.nowLocation setText: subtitle];
            [self.nowLocation setTextColor:[UIColor whiteColor]];
            [self.nowLocation setFont:[UIFont fontWithName:@"ArialMT" size:16]];

            
            
            NSString *currentdescription = [shows objectForKey:@"CurrentDescription"];
            [self.nowDescription setText: currentdescription];
            [self.nowDescription setTextColor:[UIColor whiteColor]];
            [self.nowDescription setFont:[UIFont fontWithName:@"ArialMT" size:16]];

        }
        
        
        //update playing next
        if(![nextTitle isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.nextTitle setText: nextTitle];
            [self.nextTitle setTextColor:[UIColor whiteColor]];
            [self.nextTitle setFont:[UIFont fontWithName:@"ArialMT" size:20]];
            [self.nextTitle setAdjustsFontSizeToFitWidth: YES];

            
            NSString *nextTime = [shows objectForKey:@"NextTime"];
            NSString *nextLocation = [shows objectForKey: @"NextLocation"];
            NSMutableString *nextText = [NSMutableString stringWithFormat:@"%@ \n%@ Theater",
                                                         nextTime, nextLocation];
            [self.nextLocation setText: nextText];
            [self.nextLocation setTextColor:[UIColor whiteColor]];
            
            
            
            NSString *nextdescription = [shows objectForKey:@"NextDescription"];
            [self.nextDescription setText: nextdescription];
            [self.nextDescription setTextColor:[UIColor whiteColor]];
            [self.nextDescription setFont:[UIFont fontWithName:@"ArialMT" size:16]];
        }
        
        //update playing after
        if(![afterTitle isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.afterTitle setText: afterTitle];
            [self.afterTitle setTextColor:[UIColor whiteColor]];
            [self.afterTitle setFont:[UIFont fontWithName:@"ArialMT" size:20]];
            [self.afterTitle setAdjustsFontSizeToFitWidth: YES];

            
            NSString *afterTime = [shows objectForKey:@"AfterTime"];
            NSString *afterLocation = [shows objectForKey: @"AfterLocation"];
            NSMutableString *afterText = [NSMutableString stringWithFormat:@"%@ \n%@ Theater",
                                                          afterTime, afterLocation];
            [self.afterLocation setText: afterText];
            [self.afterLocation setTextColor:[UIColor whiteColor]];
            [self.afterLocation setFont:[UIFont fontWithName:@"ArialMT" size:16]];
            
            
            NSString *afterdescription = [shows objectForKey:@"AfterDescription"];
            [self.afterDescription setText: afterdescription];
            [self.afterDescription setTextColor:[UIColor whiteColor]];
            [self.afterDescription setFont:[UIFont fontWithName:@"ArialMT" size:16]];

        }
        
        //update brake
        if(![nextBreak isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.nextBreak setText: nextBreak];
            [self.nextBreak setTextAlignment: NSTextAlignmentCenter];
            [self.nextBreak setTextColor:[UIColor whiteColor]];
            [self.nextBreak setFont:[UIFont fontWithName:@"ArialMT" size:25]];
        }
    
    }else{
      [NSTimer scheduledTimerWithTimeInterval:1.0f target:self
           selector:@selector(updateHome) userInfo:nil repeats:NO];
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.canDisplayBannerAds = YES;
    [self updateHome];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [self updateHome];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
