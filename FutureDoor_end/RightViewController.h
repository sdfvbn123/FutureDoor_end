//
//  RightViewController.h
//  MyPPRevealSide
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsViewController.h"
#import "PracticeCenterViewController.h"
#import "MyFutureDoorViewController.h"
#import "ProjectRecommendViewController.h"
#import "GroupPurchaseViewController.h"
#import "TrainingCampViewController.h"

@interface RightViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) PracticeCenterViewController *practiceCenterVC;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *listArray;


@end
