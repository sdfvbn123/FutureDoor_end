//
//  TabBarViewController.h
//  MyPPRevealSide
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "PPRevealSideViewController.h"

@interface TabBarViewController : UITabBarController<UIActionSheetDelegate>
@property (nonatomic) BOOL isOK;
@property (strong,nonatomic) UIButton *btn;

@property (strong,nonatomic) UITabBarController *tabBarController;
@property (strong,nonatomic) UIButton *lastBtn;

@property (strong,nonatomic) UIView *tabBarView;

-(void)hideTabBar:(BOOL)hide;


@end
