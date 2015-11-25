//
//  iPad_Shows_ViewController.h
//  playground2014
//
//  Created by Kevin Karol on 1/6/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowInfo.h"


@interface iPad_Shows_ViewController : UITableViewController

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

@property (nonatomic, strong) NSMutableArray *thursdayArray;
@property (nonatomic, strong) NSMutableArray *fridayArray;
@property (nonatomic, strong) NSMutableArray *saturdayArray;
@property (nonatomic, strong) NSMutableArray *installationArray;

@end
