/**
*  iPad_Description_ViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/8/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "iPad_Description_ViewController.h"
#import "iPad_Shows_ViewController.h"

@implementation iPad_Description_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.showName setText: [_currentShow title]];
    [self.showName setTextColor:[UIColor whiteColor]];
    [self.showName setFont:[UIFont fontWithName:@"ArialMT" size:30]];
    [self.showName setTextAlignment: NSTextAlignmentCenter];
    [self.showName setAdjustsFontSizeToFitWidth:YES];
    
    NSMutableString* participantsList = [[NSMutableString alloc] init];
    for(NSString* person in [_currentShow participants]){
      NSString* withNewline = [person stringByAppendingString:@"\n"];
      [participantsList appendString:withNewline];
    }
    
    [self.participants setText: participantsList];
    [self.participants setTextColor:[UIColor whiteColor]];
    [self.participants setFont:[UIFont fontWithName:@"ArialMT" size:20]];

    
    
    [self.Description setText: [_currentShow programNote]];
    [self.Description setTextColor:[UIColor whiteColor]];
    [self.Description setFont:[UIFont fontWithName:@"ArialMT" size:20]];


    
    [self.warnings setText: [_currentShow specialThanks]];
    [self.warnings setTextColor:[UIColor whiteColor]];
    [self.warnings setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.warnings setAdjustsFontSizeToFitWidth:YES];

    
    [self.thanks setText: [_currentShow audienceWarnings]];
    [self.thanks setTextColor:[UIColor whiteColor]];
    [self.thanks setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.thanks setAdjustsFontSizeToFitWidth:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
