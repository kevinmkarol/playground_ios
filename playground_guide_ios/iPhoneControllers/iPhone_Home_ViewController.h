/**
*  iPhone_Home_ViewController.h
*  playground2014
*
*  Created by Kevin Karol on 1/1/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  ViewController for the home screen on iPhone
**/

#import <UIKit/UIKit.h>
@class Util;

@interface iPhone_Home_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentlyPlaying;
@property (weak, nonatomic) IBOutlet UILabel *nextPlaying;
@property (weak, nonatomic) IBOutlet UILabel *afterPlaying;
@property (weak, nonatomic) IBOutlet UITextView *nextBreak;


@property (weak, nonatomic) IBOutlet UITextView *currentTime;
@property (weak, nonatomic) IBOutlet UITextView *nextTime;
@property (weak, nonatomic) IBOutlet UITextView *afterTime;


-(void) updateHome;

@end
