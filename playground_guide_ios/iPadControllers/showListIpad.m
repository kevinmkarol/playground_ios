//
//  showListIpad.m
//  playground2014
//
//  Created by Kevin Karol on 1/15/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "showListIpad.h"
#import "ShowInfo.h"
#import "Util.h"

@implementation showListIpad

@synthesize thursdayArray, fridayArray, saturdayArray, installationArray;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
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
        [show setParticipants: [temporary objectForKey:@"participants"]];
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
        [show setParticipants: [temporary objectForKey:@"participants"]];
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
        [show setParticipants: [temporary objectForKey:@"participants"]];
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
        [show setParticipants: [temporary objectForKey:@"participants"]];
        [show setProgramNote: [temporary objectForKey:@"description"]];
        [show setSpecialThanks:[temporary objectForKey:@"specialThanks"]];
        [show setAudienceWarnings:[temporary objectForKey:@"audienceWarning"]];
        //[show setTime: [temporary objectForKey:@"time"]];
        [show setLocation:[temporary objectForKey:@"location"]];
        [installationArray addObject: show];
    }
    
    
    
    
}


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

@end
