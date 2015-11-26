//
//  FirstViewController.m
//  playground2014
//
//  Created by Kevin Karol on 1/1/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "FirstViewController.h" 
#import "Util.h"
#import <iAd/iAd.h>
#import <CoreFoundation/CoreFoundation.h>
#import "ProgramInformationInterface.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentlyPlaying;
@property (weak, nonatomic) IBOutlet UILabel *nextPlaying;
@property (weak, nonatomic) IBOutlet UILabel *afterPlaying;
@property (weak, nonatomic) IBOutlet UITextView *nextBreak;


@property (weak, nonatomic) IBOutlet UITextView *currentTime;
@property (weak, nonatomic) IBOutlet UITextView *nextTime;
@property (weak, nonatomic) IBOutlet UITextView *afterTime;


@end

@implementation FirstViewController

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
            [self.currentlyPlaying setText: currentTitle];
            [self.currentlyPlaying setTextAlignment: NSTextAlignmentCenter];
            [self.currentlyPlaying setTextColor:[UIColor whiteColor]];
            [self.currentlyPlaying setFont:[UIFont fontWithName:@"ArialMT" size:20]];

            NSString *currentTime = [shows objectForKey:@"CurrentTime"];
            NSString *currentLocation = [shows objectForKey: @"CurrentLocation"];
            NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", currentLocation, currentTime];
            [self.currentTime setText: subtitle];
            [self.currentTime setTextAlignment: NSTextAlignmentCenter];
            [self.currentTime setTextColor:[UIColor whiteColor]];
            [self.currentTime setFont:[UIFont fontWithName:@"ArialMT" size:16]];

            
        
        }
        
        
        //update playing next
        if(![nextTitle isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.nextPlaying setText: nextTitle];
            [self.nextPlaying setTextAlignment: NSTextAlignmentCenter];
            [self.nextPlaying setTextColor:[UIColor whiteColor]];
            [self.nextPlaying setFont:[UIFont fontWithName:@"ArialMT" size:20]];


            
            NSString *nextTime = [shows objectForKey: @"NextTime"];
            NSString *nextLocation = [shows objectForKey: @"NextLocation"];
            NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", nextLocation, nextTime];
            [self.nextTime setText: subtitle];
            [self.nextTime setTextAlignment: NSTextAlignmentCenter];
            [self.nextTime setTextColor:[UIColor whiteColor]];
            [self.nextTime setFont:[UIFont fontWithName:@"ArialMT" size:16]];


        }

        //update playing after
        if(![afterTitle isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.afterPlaying setText: afterTitle];
            [self.afterPlaying setTextAlignment: NSTextAlignmentCenter];
            [self.afterPlaying setTextColor:[UIColor whiteColor]];
            [self.afterPlaying setFont:[UIFont fontWithName:@"ArialMT" size:20]];


            NSString *afterTime = [shows objectForKey: @"AfterTime"];
            NSString *afterLocation = [shows objectForKey: @"AfterLocation"];
            NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", afterLocation, afterTime];
            [self.afterTime setText: subtitle];
            [self.afterTime setTextAlignment: NSTextAlignmentCenter];
            [self.afterTime setTextColor:[UIColor whiteColor]];
            [self.afterTime setFont:[UIFont fontWithName:@"ArialMT" size:16]];


        }
        
        //update brake
        if(![nextBreak isEqual:@"null"])
        {
            //Pull other fields and place here
            [self.nextBreak setText: nextBreak];
            [self.nextBreak setTextAlignment: NSTextAlignmentCenter];
            [self.nextBreak setTextColor:[UIColor whiteColor]];
            [self.nextBreak setFont:[UIFont fontWithName:@"ArialMT" size:18]];

        }
    }else{
      [NSTimer scheduledTimerWithTimeInterval:1.0f target:self
           selector:@selector(updateHome) userInfo:nil repeats:NO];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.canDisplayBannerAds = YES;
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self
           selector:@selector(updateHome) userInfo:nil repeats:NO];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self
           selector:@selector(updateHome) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
