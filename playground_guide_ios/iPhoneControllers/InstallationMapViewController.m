//
//  InstallationMapViewController.m
//  playground2014
//
//  Created by Kevin Karol on 1/14/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "InstallationMapViewController.h"

@interface InstallationMapViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *displayMap;

@end

@implementation InstallationMapViewController

@synthesize map, displayMap;

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
    [displayMap setImage:[UIImage imageNamed:map]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
