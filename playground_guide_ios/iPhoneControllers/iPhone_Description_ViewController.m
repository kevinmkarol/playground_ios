//
//  iPhone_Description_ViewController.m
//  playground2014
//
//  Created by Kevin Karol on 1/4/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "iPhone_Description_ViewController.h"

@interface iPhone_Description_ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showTitle;
@property (weak, nonatomic) IBOutlet UILabel *showWarnings;
@property (weak, nonatomic) IBOutlet UILabel *showCreator;
@property (weak, nonatomic) IBOutlet UITextView *showDescription;

@end

@implementation iPhone_Description_ViewController

@synthesize currentShow;

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
    
    [self.showTitle setText: [currentShow title]];
    [self.showTitle setTextColor:[UIColor whiteColor]];
    [self.showTitle setTextAlignment:NSTextAlignmentCenter];
    [self.showTitle setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.showTitle setAdjustsFontSizeToFitWidth: YES];
    
    
    [self.showCreator setText: [currentShow showCreator]];
    [self.showCreator setTextColor:[UIColor whiteColor]];
    [self.showCreator setTextAlignment:NSTextAlignmentCenter];
    [self.showCreator setFont:[UIFont fontWithName:@"ArialMT" size:16]];
    [self.showCreator setAdjustsFontSizeToFitWidth: YES];
    
    
    [self.showDescription setText: [currentShow description]];
    [self.showDescription setTextColor:[UIColor whiteColor]];
    [self.showDescription setFont:[UIFont fontWithName:@"ArialMT" size:16]];
    
    
    [self.showWarnings setText: [currentShow audienceWarnings]];
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
