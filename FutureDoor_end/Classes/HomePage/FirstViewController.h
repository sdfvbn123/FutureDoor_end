//
//  FirstViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsViewController.h"
#import "PracticeCenterViewController.h"
#import "MyFutureDoorViewController.h"
#import "ProjectRecommendViewController.h"
#import "GroupPurchaseViewController.h"
#import "TrainingCampViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "PPRevealSideViewController.h"
#import "AppDelegate.h"
#import "CoverButton.h"
#import "FutureDoorService.h"

@interface FirstViewController : UIViewController <UIActionSheetDelegate,UIScrollViewAccessibilityDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate,FutureDoorServiceDelegate>

@property (strong,nonatomic) UIImageView *myImageView;
@property (strong,nonatomic) NSMutableArray *array;//存放图片的数组

@property (strong,nonatomic) UIButton *practiceBtn;//实践中心按钮
@property (strong,nonatomic) UIButton *newsBtn;//新闻按钮
@property (strong,nonatomic) UIButton *projectBtn;//项目推荐按钮
@property (strong,nonatomic) UIButton *futureDoorBtn;//未来门按钮
@property (strong,nonatomic) UIButton *groupPurchaseBtn;//团购按钮
@property (strong,nonatomic) UIButton *trainingCampBtn;//训练营按钮

@property (nonatomic) NSInteger page;
@property (strong,nonatomic) NSMutableArray *picArray;
@property (strong,nonatomic) NSMutableArray *labelArray;
@property (strong,nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong,nonatomic) NSMutableArray *imageArray;

@end
