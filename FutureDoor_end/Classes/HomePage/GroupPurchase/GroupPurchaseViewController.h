//
//  GroupPurchaseViewController.h
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageWaterView.h"
#import "SVPullToRefresh.h"
#import "JSONKit.h"
@interface GroupPurchaseViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSInteger page;
@property (strong,nonatomic) NSMutableArray *picArray;
@property (strong,nonatomic) UIPageControl *pageControl;


@property (nonatomic,strong)ImageWaterView *waterView;


@end

