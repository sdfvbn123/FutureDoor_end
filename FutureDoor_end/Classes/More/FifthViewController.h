//
//  FifthViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreCellTableViewCell.h"
#import "MoreCellObject.h"
#import "FirstDetailViewController.h"
#import "TouSuViewController.h"
#import "ShareViewController.h"
@interface FifthViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *array1;
@property (strong,nonatomic) NSArray *array2;
@property (strong,nonatomic) NSArray *array3;

@end
