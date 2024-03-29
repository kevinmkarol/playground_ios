/**
*  InstallationTableViewController.m
*  playground2014
*
*  Created by Kevin Karol on 1/14/14.
*  Copyright (c) 2014 Kevin Karol. All rights reserved.
**/

#import "InstallationTableViewController.h"
#import "InstallationMapViewController.h"
#import "ProgramInformationInterface.h"
#import "InstallationImage.h"

@implementation InstallationTableViewController

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
    _imageArray = [[ProgramInformationInterface sharedManager]
                   getProgramInformation:INSTALLATION_IMAGES_FILE_NAME];
    return [_imageArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"installationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[_imageArray objectAtIndex:indexPath.row] imageName];
    
    return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath* path = [self.tableView indexPathForSelectedRow];
    InstallationMapViewController *dvc = [segue destinationViewController];
    NSString* imagePath = [[ProgramInformationInterface sharedManager]
                           getPathToInstallationImage:[_imageArray objectAtIndex:path.row]];
    [dvc setPathToImage:imagePath];
    
}



@end
