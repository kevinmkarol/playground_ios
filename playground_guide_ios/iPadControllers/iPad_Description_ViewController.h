/**  
*   iPad_Description_ViewController.h
*  playground2014
*
*  Created by Kevin Karol on 1/8/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  ViewController for displaying program note information on the iPad
**/

#import <UIKit/UIKit.h>
#import "ShowInfo.h"
#import "iPad_Shows_ViewController.h"

@interface iPad_Description_ViewController : UIViewController

@property (nonatomic, weak) ShowInfo *currentShow;
@property (weak, nonatomic) IBOutlet UILabel *showName;
@property (weak, nonatomic) IBOutlet UITextView *participants;
@property (weak, nonatomic) IBOutlet UITextView *Description;
@property (weak, nonatomic) IBOutlet UILabel *warnings;
@property (weak, nonatomic) IBOutlet UILabel *thanks;

@end


