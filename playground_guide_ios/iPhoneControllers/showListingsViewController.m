/**
*  showListingsViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/3/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "showListingsViewController.h"
#import "Util.h"
#import "ProgramInformationInterface.h"

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
    
    //Setup date formatter
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale* usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:usLocale];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
    [dateFormatter setDateFormat:@"h:mm"];
    
    if([_plistSelector isEqualToString: @"installation"]){
        NSString *subtitle = [NSMutableString stringWithFormat:@"%@",[current location]];
        cell.detailTextLabel.text = subtitle;
    }
    else{
        NSString* dateString = [dateFormatter stringFromDate:[current date]];
        NSString *subtitle = [NSString stringWithFormat:@"%@-%@", dateString, [current location]];
        cell.detailTextLabel.text = subtitle;
    }
    return cell;
}

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
