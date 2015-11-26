//
//  showListingsViewController.m
//  playground2014
//
//  Created by Kevin Karol on 1/3/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "showListingsViewController.h"
#import "Util.h"
#import "ProgramInformationInterface.h"

@interface showListingsViewController ()

@end

@implementation showListingsViewController

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
    
    if([_plistSelector isEqualToString: @"thursday"]){
        _showArray = [[ProgramInformationInterface sharedManager] getProgramInformation:THURSDAY_FILE_NAME];
    }
    else if([_plistSelector isEqualToString: @"friday"]){
        _showArray = [[ProgramInformationInterface sharedManager] getProgramInformation:FRIDAY_FILE_NAME];
    }
    else if([_plistSelector isEqualToString: @"saturday"]){
        _showArray = [[ProgramInformationInterface sharedManager] getProgramInformation:SATURDAY_FILE_NAME];
    }
    else if([_plistSelector isEqualToString:@"installation"]){
        _showArray = [[ProgramInformationInterface sharedManager] getProgramInformation:INSTALLATION_FILE_NAME];
    }
    else{
        //initialize list of shows to be pulled from myList - sorting here?
    }
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [_showArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"performanceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ShowInfo *current = [_showArray objectAtIndex:indexPath.row];
    cell.textLabel.text =  [current title];
    
    if([_plistSelector isEqualToString: @"installation"]){
        NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@",[current location]];
        cell.detailTextLabel.text = subtitle;
    }
    else{
        //NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", [current time], [current location]];
        //cell.detailTextLabel.text = subtitle;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    iPhone_Description_ViewController *dvc = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    ShowInfo *c = [_showArray objectAtIndex: path.row];
    [dvc setCurrentShow:c];
    
}


@end
