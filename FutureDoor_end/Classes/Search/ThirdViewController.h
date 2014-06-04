//
//  ThirdViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *list;
@property (strong,nonatomic) UIView *mainView;
@end
