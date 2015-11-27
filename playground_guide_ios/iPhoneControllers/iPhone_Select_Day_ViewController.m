/**
*  iPhone_Select_Day_ViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/1/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "iPhone_Select_Day_ViewController.h"
#import "showListingsViewController.h"

@implementation iPhone_Select_Day_ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"dayCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    
    NSString* day;
    // Configure the cell...
    switch(indexPath.row){
      case 0:{
        day = @"Thursday";
        break;
      }
      case 1:{
        day = @"Friday";
        break;
      }
      case 2:{
        day = @"Saturday";
        break;
      }
      case 3:{
        day = @"Installations";
        break;
      }
    
    }
    cell.textLabel.text = day;
    
    return cell;
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    showListingsViewController *dvc = [segue destinationViewController];
    if([segue.identifier isEqualToString: @"thursday"]){
        dvc.plistSelector = @"thursday";
    }
    else if ([segue.identifier isEqualToString: @"friday"]){
        dvc.plistSelector = @"friday";
    }
    else if ([segue.identifier isEqualToString: @"saturday"]){
        dvc.plistSelector = @"saturday";
    }
    else if([segue.identifier isEqualToString: @"installation"]){
        dvc.plistSelector = @"installation";
    }

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
