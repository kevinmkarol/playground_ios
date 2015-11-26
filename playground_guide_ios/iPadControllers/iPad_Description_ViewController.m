//
//  iPad_Description_ViewController.m
//  playground2014
//
//  Created by Kevin Karol on 1/8/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "iPad_Description_ViewController.h"
#import "iPad_Shows_ViewController.h"

@interface iPad_Description_ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showName;
@property (weak, nonatomic) IBOutlet UITextView *participants;
@property (weak, nonatomic) IBOutlet UITextView *Description;
@property (weak, nonatomic) IBOutlet UILabel *warnings;
@property (weak, nonatomic) IBOutlet UILabel *thanks;

@end

@implementation iPad_Description_ViewController

@synthesize currentShow, title, participants, Description, warnings, thanks;

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
    //[self setEdgesForExtendedLayout:UIRectEdgeNone];

    
    [self.showName setText: [currentShow title]];
    [self.showName setTextColor:[UIColor whiteColor]];
    [self.showName setFont:[UIFont fontWithName:@"ArialMT" size:30]];
    [self.showName setTextAlignment: NSTextAlignmentCenter];
    [self.showName setAdjustsFontSizeToFitWidth:YES];
    
    [self.participants setText: [currentShow participants]];
    [self.participants setTextColor:[UIColor whiteColor]];
    [self.participants setFont:[UIFont fontWithName:@"ArialMT" size:20]];

    
    
    [self.Description setText: [currentShow description]];
    [self.Description setTextColor:[UIColor whiteColor]];
    [self.Description setFont:[UIFont fontWithName:@"ArialMT" size:20]];


    
    [self.warnings setText: [currentShow specialThanks]];
    [self.warnings setTextColor:[UIColor whiteColor]];
    [self.warnings setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.warnings setAdjustsFontSizeToFitWidth:YES];

    
    [self.thanks setText: [currentShow audienceWarnings]];
    [self.thanks setTextColor:[UIColor whiteColor]];
    [self.thanks setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.thanks setAdjustsFontSizeToFitWidth:YES];

    
    //[self setTitle: [NSMutableString stringWithFormat:@"%@-%@",[currentShow location],[currentShow time]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
