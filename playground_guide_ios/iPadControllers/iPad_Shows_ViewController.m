/**
*  iPad_Shows_ViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/6/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "iPad_Shows_ViewController.h"
#import "Util.h"
#import "ShowInfo.h"
#import "iPad_Description_ViewController.h"
#import "ProgramInformationInterface.h"

@implementation iPad_Shows_ViewController

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
    
    _thursdayArray = [[ProgramInformationInterface sharedManager]
                               getProgramInformation:THURSDAY_FILE_NAME];
    _fridayArray = [[ProgramInformationInterface sharedManager]
                                   getProgramInformation:FRIDAY_FILE_NAME];
    _saturdayArray = [[ProgramInformationInterface sharedManager]
                                     getProgramInformation:SATURDAY_FILE_NAME];
    _installationArray = [[ProgramInformationInterface sharedManager]
                                         getProgramInformation:INSTALLATION_FILE_NAME];
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
    return 4;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int rowCount;
    //specify by section
    if(section == 0) {
        rowCount = (int)[_thursdayArray count];
    }
    else if (section == 1){
        rowCount = (int)[_fridayArray count];
    }
    else if (section == 2){
        rowCount = (int)[_saturdayArray count];
    }
    else{
        rowCount = (int)[_installationArray count];
    }
    
    return rowCount;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* title;
    if(section == 0) {
        title = @"Thursday";
    }
    else if (section == 1){
        title = @"Friday";
    }
    else if (section == 2){
        title = @"Saturday";
    }
    else{
        title = @"Installations";
    }
    
    return title;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"showCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                       forIndexPath:indexPath];
    
    //Setup date formatter for subtitles
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale* usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:usLocale];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
    [dateFormatter setDateFormat:@"h:mm"];

    // Configure the cell...
    if(indexPath.section == 0) {
        ShowInfo *current = [_thursdayArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        
        NSString* dateString = [dateFormatter stringFromDate:[current date]];
        NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@",
                                      dateString, [current location]];
        cell.detailTextLabel.text = subtitle;
    }
    else if(indexPath.section == 1){
        ShowInfo *current = [_fridayArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        
        NSString* dateString = [dateFormatter stringFromDate:[current date]];
        NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@",
                                      dateString, [current location]];
        cell.detailTextLabel.text = subtitle;
    }
    else if(indexPath.section == 2){
        ShowInfo *current = [_saturdayArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        
        NSString* dateString = [dateFormatter stringFromDate:[current date]];
        NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@",
                                       dateString, [current location]];
        cell.detailTextLabel.text = subtitle;
    }
    else{
        ShowInfo *current = [_installationArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@",
                                                     [current location]];
        cell.detailTextLabel.text = subtitle;
    }
    return cell;
}


#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowInfo *selected;
    
    if (indexPath.section == 0) {
        selected = [_thursdayArray objectAtIndex: indexPath.row];
    }
    else if(indexPath.section == 1){
        selected = [_fridayArray objectAtIndex: indexPath.row];
    }
    else if(indexPath.section == 2){
        selected = [_saturdayArray objectAtIndex: indexPath.row];
    }
    else{
        selected = [_installationArray objectAtIndex: indexPath.row];
    }
    
    
}


// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    iPad_Description_ViewController *dvc = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    if (path.section == 0) {
        ShowInfo *c = [_thursdayArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
    else if(path.section == 1){
        ShowInfo *c = [_fridayArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
    else if(path.section == 2){
        ShowInfo *c = [_saturdayArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
    else{
        ShowInfo *c = [_installationArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
}


@end
