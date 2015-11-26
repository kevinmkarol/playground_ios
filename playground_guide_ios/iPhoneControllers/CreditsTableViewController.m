//
//  CreditsTableViewController.m
//  playground_guide_ios
//
//  Created by Kevin Karol on 11/26/15.
//  Copyright © 2015 Kevin Karol. All rights reserved.
//

#import "CreditsTableViewController.h"
#import "ProgramInformationInterface.h"
#import "CreditInfo.h"

@interface CreditsTableViewController ()

@end

@implementation CreditsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _festivalStaff = [[ProgramInformationInterface sharedManager] getProgramInformation:FESTIVAL_STAFF_FILE_NAME];
    _specialThanks =[[ProgramInformationInterface sharedManager] getProgramInformation:SPECIAL_THANKS_FILE_NAME];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
