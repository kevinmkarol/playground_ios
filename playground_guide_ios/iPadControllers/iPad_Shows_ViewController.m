//
//  iPad_Shows_ViewController.m
//  playground2014
//
//  Created by Kevin Karol on 1/6/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "iPad_Shows_ViewController.h"
#import "Util.h"
#import "ShowInfo.h"
#import "iPad_Description_ViewController.h"

@interface iPad_Shows_ViewController ()

@end

@implementation iPad_Shows_ViewController

@synthesize thursdayArray, fridayArray, saturdayArray, installationArray;


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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSMutableArray *thursdayShows = [[NSMutableArray alloc] initWithArray:[Util arrayContentsOfFile:@"thursday.plist"]];
    NSMutableArray *fridayShows = [[NSMutableArray alloc] initWithArray:[Util arrayContentsOfFile:@"friday.plist"]];
    NSMutableArray *saturdayShows = [[NSMutableArray alloc] initWithArray:[Util arrayContentsOfFile:@"saturday.plist"]];
    NSMutableArray *installationShows = [[NSMutableArray alloc] initWithArray:[Util arrayContentsOfFile:@"installation.plist"]];

    ShowInfo *show;
    
    thursdayArray = [[NSMutableArray alloc] init];
    fridayArray = [[NSMutableArray alloc] init];
    saturdayArray = [[NSMutableArray alloc] init];
    installationArray = [[NSMutableArray alloc] init];

    
    
    //Potentially modify the showInfo class to accomodate installations
    for(NSMutableDictionary *temporary in thursdayShows){
        show = [[ShowInfo alloc] init];
        [show setTitle: [temporary objectForKey: @"title"]];
        [show setParticipants: [temporary objectForKey:@"showParticipants"]];
        [show setProgramNote: [temporary objectForKey:@"description"]];
        [show setSpecialThanks:[temporary objectForKey:@"specialThanks"]];
        [show setAudienceWarnings:[temporary objectForKey:@"audienceWarning"]];
        //[show setTime: [temporary objectForKey:@"time"]];
        [show setLocation:[temporary objectForKey:@"location"]];
        [thursdayArray addObject: show];
    }
    for(NSMutableDictionary *temporary in fridayShows){
        show = [[ShowInfo alloc] init];
        [show setTitle: [temporary objectForKey: @"title"]];
        [show setParticipants: [temporary objectForKey:@"showParticipants"]];
        [show setProgramNote: [temporary objectForKey:@"description"]];
        [show setSpecialThanks:[temporary objectForKey:@"specialThanks"]];
        [show setAudienceWarnings:[temporary objectForKey:@"audienceWarning"]];
        //[show setTime: [temporary objectForKey:@"time"]];
        [show setLocation:[temporary objectForKey:@"location"]];
        [fridayArray addObject: show];
    }
    for(NSMutableDictionary *temporary in saturdayShows){
        show = [[ShowInfo alloc] init];
        [show setTitle: [temporary objectForKey: @"title"]];
        [show setParticipants: [temporary objectForKey:@"showParticipants"]];
        [show setProgramNote: [temporary objectForKey:@"description"]];
        [show setSpecialThanks:[temporary objectForKey:@"specialThanks"]];
        [show setAudienceWarnings:[temporary objectForKey:@"audienceWarning"]];
        //[show setTime: [temporary objectForKey:@"time"]];
        [show setLocation:[temporary objectForKey:@"location"]];
        [saturdayArray addObject: show];
    }
    for(NSMutableDictionary *temporary in installationShows){
        show = [[ShowInfo alloc] init];
        [show setTitle: [temporary objectForKey: @"title"]];
        [show setParticipants: [temporary objectForKey:@"showParticipants"]];
        [show setProgramNote: [temporary objectForKey:@"description"]];
        [show setSpecialThanks:[temporary objectForKey:@"specialThanks"]];
        [show setAudienceWarnings:[temporary objectForKey:@"audienceWarning"]];
        //[show setTime: [temporary objectForKey:@"time"]];
        [show setLocation:[temporary objectForKey:@"location"]];
        [installationArray addObject: show];
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
    return 4;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    //specify by section
    if(section == 0) {
        
        NSArray *thursday = [Util arrayContentsOfFile:@"thursday.plist"];
        return [thursday count];
    }
    else if (section == 1){
        NSArray *friday = [Util arrayContentsOfFile:@"friday.plist"];
        return [friday count];
    }
    else if (section == 2){
        NSArray *saturday = [Util arrayContentsOfFile:@"saturday.plist"];
        return [saturday count];
    }
    else{
        NSArray *installation = [Util arrayContentsOfFile:@"installation.plist"];
        return [installation count];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0) {
        return @"Thursday";
    }
    else if (section == 1){
        return @"Friday";
    }
    else if (section == 2){
        return @"Saturday";
    }
    else{
        return @"Installations";
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"showCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(indexPath.section == 0) {
        ShowInfo *current = [thursdayArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        //NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", [current time], [current location]];
        //cell.detailTextLabel.text = subtitle;
    }
    else if(indexPath.section == 1){
        ShowInfo *current = [fridayArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        //NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", [current time], [current location]];
        //cell.detailTextLabel.text = subtitle;
    }
    else if(indexPath.section == 2){
        ShowInfo *current = [saturdayArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        //NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@-%@", [current time], [current location]];
        //cell.detailTextLabel.text = subtitle;
    }
    else{
        ShowInfo *current = [installationArray objectAtIndex: indexPath.row];
        cell.textLabel.text = [current title];
        NSMutableString *subtitle = [NSMutableString stringWithFormat:@"%@",[current location]];
        cell.detailTextLabel.text = subtitle;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowInfo *selected;
    
    if (indexPath.section == 0) {
        selected = [thursdayArray objectAtIndex: indexPath.row];
    }
    else if(indexPath.section == 1){
        selected = [fridayArray objectAtIndex: indexPath.row];
    }
    else if(indexPath.section == 2){
        selected = [saturdayArray objectAtIndex: indexPath.row];
    }
    else{
        selected = [installationArray objectAtIndex: indexPath.row];
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
        ShowInfo *c = [thursdayArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
    else if(path.section == 1){
        ShowInfo *c = [fridayArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
    else if(path.section == 2){
        ShowInfo *c = [saturdayArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
    else{
        ShowInfo *c = [installationArray objectAtIndex: path.row];
        [dvc setCurrentShow:c];
    }
}


@end
