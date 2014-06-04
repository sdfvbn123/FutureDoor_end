//
//  ProjectViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xiangmuCell.h"
#import "xiangmuTableViewCell.h"
#import "PullTableView.h"
@interface ProjectViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>

@property (strong,nonatomic) NSString *curTitle;
@property (strong,nonatomic) NSMutableArray *list;
@property (strong,nonatomic) NSMutableArray *dateList;
@property (strong,nonatomic) NSMutableArray *numList;
@property (strong,nonatomic) NSMutableArray *detailLbel;
@property (strong,nonatomic) NSMutableArray *array;

@property (strong,nonatomic) UITableView *tableView;
@property(nonatomic, strong)PullTableView *pullView;
@property (assign,nonatomic) int currentPage,totalPage;//当前页数,用于分页加载
@end
