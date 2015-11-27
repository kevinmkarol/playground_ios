/**
*  iPhone_Description_ViewController.h
*  playground2014
*
*  Created by Kevin Karol on 1/4/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  ViewController for displaying piece information on iPhone
**/

#import <UIKit/UIKit.h>
#import "ShowInfo.h"

@interface iPhone_Description_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *showTitle;
@property (weak, nonatomic) IBOutlet UILabel *showWarnings;
@property (weak, nonatomic) IBOutlet UILabel *showCreator;
@property (weak, nonatomic) IBOutlet UITextView *showDescription;

@property (strong, nonatomic) ShowInfo *currentShow;


@end

