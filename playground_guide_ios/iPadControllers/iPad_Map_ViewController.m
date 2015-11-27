/**
*  iPad_Map_ViewController.m
*  playground_guide_ios
*
*  Created by Kevin Karol on 11/26/15.
*  Copyright © 2015 Kevin Karol. All rights reserved.
**/

#import "iPad_Map_ViewController.h"
#import "ProgramInformationInterface.h"
#import "InstallationImage.h"

@implementation iPad_Map_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* allImages = [[ProgramInformationInterface sharedManager]
                              getProgramInformation:INSTALLATION_IMAGES_FILE_NAME];
    NSString* pathToImage = @"";
    
    for(InstallationImage* imageWrapper in allImages){
      if([[imageWrapper imageName] isEqualToString:@"fullMap"]){
        pathToImage = [[ProgramInformationInterface sharedManager]
                        getPathToInstallationImage:imageWrapper];
        break;
      }
    }
    
    
    NSFileManager* fm = [NSFileManager defaultManager];
    BOOL fileExists = [fm fileExistsAtPath:pathToImage];
    if(fileExists){
        UIImage* installationMap = [UIImage imageWithContentsOfFile:pathToImage];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:installationMap];

        CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
        CGFloat tabHeight = self.tabBarController.tabBar.frame.size.height;
        CGRect fullScreen = [[UIScreen mainScreen] bounds];
        
        
        CGRect usableScreenCoords = CGRectMake(0, navHeight, fullScreen.size.width, fullScreen.size.height - navHeight - tabHeight);

        [imageView setFrame:usableScreenCoords];
        
        [self.view addSubview:imageView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
