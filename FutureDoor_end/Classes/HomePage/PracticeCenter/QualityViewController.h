//
//  QualityViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-28.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKSegmentedControl.h"
#import "PullTableView.h"
@interface QualityViewController : UIViewController<AKSegmentedControlDelegate,UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>

@property (strong,nonatomic) NSString *curTitle;
@property (strong,nonatomic) AKSegmentedControl *segmentedControl;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *newsList;

@property (nonatomic,strong) PullTableView *pullView;
@property (assign,nonatomic) int currentPage,totalPage;//当前页数,用于分页加载

@end
