//
//  AppDelegate.m
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "AppDelegate.h"
#import "Context.h"

@implementation AppDelegate
@synthesize tabBarViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [Context shareContext].homeWindow = self.window;

    
    self.tabBarViewController = [[TabBarViewController alloc] init];
    self.tabBarViewController.hidesBottomBarWhenPushed = YES;
    self.revealSideViewController = [[PPRevealSideViewController alloc]initWithRootViewController:self.tabBarViewController];
    
    [self.revealSideViewController setDirectionsToShowBounce:PPRevealSideDirectionNone];
    [self.revealSideViewController setPanInteractionsWhenClosed:PPRevealSideInteractionNone |PPRevealSideInteractionContentView | PPRevealSideInteractionNavigationBar];
    
    LeftViewController *left = [[LeftViewController alloc]init];
    [self.revealSideViewController preloadViewController:left forSide:PPRevealSideDirectionLeft];
    RightViewController *right = [[RightViewController alloc]init];
    [self.revealSideViewController preloadViewController:right forSide:PPRevealSideDirectionRight];
    
    
    self.window.rootViewController = self.revealSideViewController;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    if (PPSystemVersionGreaterOrEqualThan(7.0)) {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
//        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    }
    
    return YES;
}

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
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
