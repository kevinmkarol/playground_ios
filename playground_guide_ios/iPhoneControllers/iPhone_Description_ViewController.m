/**
*  iPhone_Description_ViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/4/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "iPhone_Description_ViewController.h"

@implementation iPhone_Description_ViewController

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
    
    [self.showTitle setText: [_currentShow title]];
    [self.showTitle setTextColor:[UIColor whiteColor]];
    [self.showTitle setTextAlignment:NSTextAlignmentCenter];
    [self.showTitle setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.showTitle setAdjustsFontSizeToFitWidth: YES];
    
    
    [self.showCreator setText: [_currentShow showCreator]];
    [self.showCreator setTextColor:[UIColor whiteColor]];
    [self.showCreator setTextAlignment:NSTextAlignmentCenter];
    [self.showCreator setFont:[UIFont fontWithName:@"ArialMT" size:16]];
    [self.showCreator setAdjustsFontSizeToFitWidth: YES];
    
    
    [self.showDescription setText: [_currentShow programNote]];
    [self.showDescription setTextColor:[UIColor whiteColor]];
    [self.showDescription setFont:[UIFont fontWithName:@"ArialMT" size:16]];
    
    
    [self.showWarnings setText: [_currentShow audienceWarnings]];
    [self.showWarnings setTextColor:[UIColor whiteColor]];
    [self.showWarnings setFont:[UIFont fontWithName:@"ArialMT" size:16]];
    [self.showWarnings setAdjustsFontSizeToFitWidth: YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
