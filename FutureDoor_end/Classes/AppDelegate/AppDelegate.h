//
//  AppDelegate.h
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "TabBarViewController.h"
@class TabBarViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UITabBarController *tabBarController;

@property (strong,nonatomic) UIButton *button1;
@property (strong,nonatomic) UIButton *button2;
@property (strong,nonatomic) UIButton *button3;
@property (strong,nonatomic) UIButton *button4;
@property (strong,nonatomic) UIButton *button5;
@property (strong,nonatomic) UIButton *lastButton;

@property (strong,nonatomic) UIView *tabBarView;

//@property (strong,nonatomic) PanViewController *panVC;
//@property (strong,nonatomic) PanLeftViewController *panLeftVC;

@property (strong,nonatomic) PPRevealSideViewController *revealSideViewController;
@property (strong,nonatomic) TabBarViewController *tabBarViewController;

- (AppDelegate *)appDelegate;

@end
