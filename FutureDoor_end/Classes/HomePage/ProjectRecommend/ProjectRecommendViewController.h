//
//  ProjectRecommendViewController.h
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKSegmentedControl.h"
#import "PullTableView.h"
#import "ProjectCell.h"
#import "ProjectTableViewCell.h"
@interface ProjectRecommendViewController : UIViewController <AKSegmentedControlDelegate,UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>

@property (strong,nonatomic) AKSegmentedControl *segmentedControl;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *newsList;
@property (strong,nonatomic) NSMutableArray *newsList1;
//+++++++++++++++
@property (strong,nonatomic) UILabel *titleLabel;//网页标题

@property (strong,nonatomic) UIActivityIndicatorView *activity;//活动指示器，进度轮

@property(nonatomic, strong)PullTableView *pullView;
@property (assign,nonatomic) int currentPage,totalPage;//当前页数,用于分页加载
@end
