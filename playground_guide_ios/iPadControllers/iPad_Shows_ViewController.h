/**
*  iPad_Shows_ViewController.h
*  playground2014
*
*  Created by Kevin Karol on 1/6/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
*
*  ViewController for TableView Performance Selection
**/

#import <UIKit/UIKit.h>
#import "ShowInfo.h"


@interface iPad_Shows_ViewController : UITableViewController

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

@property (nonatomic, strong) NSArray<ShowInfo*> *thursdayArray;
@property (nonatomic, strong) NSArray<ShowInfo*> *fridayArray;
@property (nonatomic, strong) NSArray<ShowInfo*> *saturdayArray;
@property (nonatomic, strong) NSArray<ShowInfo*> *installationArray;

@end
