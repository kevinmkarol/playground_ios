/**
*  showListingsViewController.h
*  playground2014
*
*  Created by Kevin Karol on 1/3/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  ViewController for list of shows on a specific day
**/

#import <UIKit/UIKit.h>
#import "iPhone_Description_ViewController.h"
#import "ShowInfo.h"

@interface showListingsViewController : UITableViewController

@property (weak,nonatomic) NSString *plistSelector;
@property (retain, nonatomic) NSArray *showArray;


@end
