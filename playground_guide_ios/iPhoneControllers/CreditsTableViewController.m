/**
*  CreditsTableViewController.m
*  playground_guide_ios
*
*  Created by Kevin Karol on 11/26/15.
*  Copyright © 2015 Kevin Karol. All rights reserved.
**/

#import "CreditsTableViewController.h"
#import "ProgramInformationInterface.h"
#import "CreditInfo.h"

@implementation CreditsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    _festivalStaff = [[ProgramInformationInterface sharedManager]
                      getProgramInformation:FESTIVAL_STAFF_FILE_NAME];
    _specialThanks =[[ProgramInformationInterface sharedManager]
                     getProgramInformation:SPECIAL_THANKS_FILE_NAME];
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count;
    switch(section){
      case 0:{
        count = [_festivalStaff count];
        break;
      }
      case 1:{
        count = [_specialThanks count];
        break;
      }
    
    }
    return count;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* title;
    switch(section){
      case 0:{
        title = @"Festival Staff";
        break;
      }
      case 1:{
        title = @"Special Thanks";
        break;
      }
    
    }
    return title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"creditCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                       forIndexPath:indexPath];
    
    switch(indexPath.section){
      case 0:{
        CreditInfo* credit = [_festivalStaff objectAtIndex:indexPath.row];
        cell.textLabel.text = [credit name];
        cell.detailTextLabel.text = [credit positionTitle];
        break;
      }
      case 1:{
        CreditInfo* credit = [_specialThanks objectAtIndex:indexPath.row];
        cell.textLabel.text = [credit name];
        break;
      }
    }
    
    // Configure the cell...
    
    return cell;
}

@end
