//
//  AppDelegate.m
//  playground2014
//
//  Created by Kevin Karol on 1/1/14.
//  Copyright (c) 2014 Kevin Karol. All rights reserved.
//

#import "AppDelegate.h"
#import "Util.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Reachability.h"
#import "iPad_Shows_ViewController.h"
#import "iPad_Description_ViewController.h"
#import "WebInterfaceController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Override point for customization after application launch.
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [path objectAtIndex:0];
    NSString *filePath = [documentFolder stringByAppendingPathComponent:@"update.plist"];

    NSTimeInterval oneDay = -86400;
    NSDate *today = [NSDate date];
    NSDate *yesterday = [NSDate dateWithTimeInterval:oneDay sinceDate:today];
    NSArray *oneEntry = [NSArray arrayWithObject:yesterday];
    [oneEntry writeToFile:filePath atomically:YES];
    
    
    //Reachability *reachability = [Reachability reachabilityForInternetConnection];
    //NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    [[WebInterfaceController sharedManager] fetchNewProgramInformation];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    //[FirstViewController updateHome];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
