/**
*  InstallationMapViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/14/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "InstallationMapViewController.h"

@implementation InstallationMapViewController

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
    NSFileManager* fm = [NSFileManager defaultManager];
    BOOL fileExists = [fm fileExistsAtPath:_pathToImage];
    if(fileExists){
        UIImage* installationMap = [UIImage imageWithContentsOfFile:_pathToImage];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:installationMap];

        CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
        CGFloat tabHeight = self.tabBarController.tabBar.frame.size.height;
        CGRect fullScreen = [[UIScreen mainScreen] bounds];
        
        
        CGRect usableScreenCoords = CGRectMake(0, navHeight, fullScreen.size.width, fullScreen.size.height - navHeight - tabHeight);

        [imageView setFrame:usableScreenCoords];
        
        [self.view addSubview:imageView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
