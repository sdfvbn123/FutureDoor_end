//
//  SecondViewController.h
//  Future_Door
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DetailViewController.h"
@interface SecondViewController : UIViewController<UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray *noteArray;
@property (strong,nonatomic) NSMutableArray *dateArray;
@property (strong,nonatomic) NSMutableArray *filteredArray;
@property (strong,nonatomic) UISearchBar *searchBar;
@property (strong,nonatomic) UISearchDisplayController *displayController;
@property (strong,nonatomic) UITableView*tableView;

@end
