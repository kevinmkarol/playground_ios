/**
*  iPad_Home_ViewController.h
*  playground2014
*
*  Created by Kevin Karol on 1/1/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  ViewController for the home screen on the iPad
**/

#import <UIKit/UIKit.h>

@interface iPad_Home_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *nowDescription;
@property (weak, nonatomic) IBOutlet UILabel *nowTitle;
@property (weak, nonatomic) IBOutlet UILabel *nowLocation;



@property (weak, nonatomic) IBOutlet UITextView *nextDescription;
@property (weak, nonatomic) IBOutlet UILabel *nextTitle;
@property (weak, nonatomic) IBOutlet UILabel *nextLocation;

@property (weak, nonatomic) IBOutlet UITextView *afterDescription;
@property (weak, nonatomic) IBOutlet UILabel *afterTitle;
@property (weak, nonatomic) IBOutlet UILabel *afterLocation;


@property (weak, nonatomic) IBOutlet UITextView *nextBreak;


-(void) updateHome;

@end
