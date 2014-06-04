//
//  NewsViewController.h
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"
#import "NewsListCell.h"
#import "AKSegmentedControl.h"
#import "UIImageView+WebCache.h"
#import "JSON.h"
#import "ASIFormDataRequest.h"
@interface NewsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,PullTableViewDelegate,AKSegmentedControlDelegate,NSURLConnectionDataDelegate>

@property (strong,nonatomic) UISegmentedControl *segment;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *newsList;//.................
@property (strong,nonatomic) UIActivityIndicatorView *activity;//活动指示器，进度轮

@property(nonatomic, strong)PullTableView *pullView;
@property (strong,nonatomic) AKSegmentedControl *segmentedControl;

//请求
@property (assign,nonatomic) int currentPage,resultRequest,totalPage;//当前页数,用于分页加载

@property(nonatomic, strong)NSMutableArray *listObjects;
@property (strong,nonatomic) NSMutableArray *mutArray,*idArray,*nameArray,*picArray,*contentArray;//下载的内容

@end
