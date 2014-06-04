//
//  FourthViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"
@interface FourthViewController : UIViewController<UIScrollViewAccessibilityDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate,UIActionSheetDelegate>

@property (strong,nonatomic) NSMutableArray *imageArray;//snow 

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
@property (strong,nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIScrollView *scrollView;
//
@property (strong,nonatomic) UIButton *button1;
@property (strong,nonatomic) UIButton *button2;
@property (strong,nonatomic) UIButton *button3;
@property (strong,nonatomic) UIView *view1;
@end
