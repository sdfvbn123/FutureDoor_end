//
//  ProjectViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ProjectViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = self.curTitle;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.list = [NSMutableArray arrayWithCapacity:20];
    self.dateList = [NSMutableArray arrayWithCapacity:10];
    self.numList = [NSMutableArray arrayWithCapacity:20];
    self.detailLbel = [NSMutableArray arrayWithCapacity:20];
    self.array = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 20;  i++) {
        NSString *str = [NSString stringWithFormat:@"项目推荐列表%d",i+1];
        NSString *str1 = [NSString stringWithFormat:@"项目推荐%d",i+1];
        
        xiangmuCell *xiangmu = [[xiangmuCell alloc]initWithLbelText:str andDetailText1:str1 andNumImage:[UIImage imageNamed:@"project_2"] andDateImage:[UIImage imageNamed:@"project_1"] andNumLabel:@"1233" andDateLabel:@"2014-05-30"];
        [self.array addObject:xiangmu];
    }
    
    self.pullView = [[PullTableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64-49) style:UITableViewStylePlain];
    [self.view addSubview:self.pullView];
    self.pullView.dataSource = self;
    self.pullView.delegate = self;
    self.pullView.pullDelegate = self;
    self.pullView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 表视图委托，方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    xiangmuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!cell) {
        cell = [[xiangmuTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //单元格风格
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
    }
    
    xiangmuCell *XMCell = self.array[indexPath.section];
    [cell bind:XMCell];
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//点击某一行进入下一页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%d",indexPath.section);
    
}
#pragma mark --------pullTable delegate--------
//加载更多
-(void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView {
    [self performSelector:@selector(loadMore) withObject:nil afterDelay:0];
}
//下拉刷新
-(void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView {
    [self performSelector:@selector(refreshing) withObject:nil afterDelay:0];
}

-(void)refreshing {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
//        for (int i = 0; i < 20; i++) {
//            //            [self setToUp];
//            
//            xiangmuCell *xiangmu = [xiangmuCell alloc]initWithLbelText:<#(NSString *)#> andDetailText1:<#(NSString *)#> andNumImage:<#(UIImage *)#> andDateImage:<#(UIImage *)#> andNumLabel:<#(NSString *)#> andDateLabel:<#(NSString *)#>
//            
//            [self.array addObject:[NSString stringWithFormat:@"项目推荐列表%d",i+1]];
//            
//        }
        for (int i = 0; i < 20;  i++) {
            NSString *str = [NSString stringWithFormat:@"项目推荐列表%d",i+1];
            NSString *str1 = [NSString stringWithFormat:@"项目推荐%d",i+1];
            
            xiangmuCell *xiangmu = [[xiangmuCell alloc]initWithLbelText:str andDetailText1:str1 andNumImage:[UIImage imageNamed:@"project_2"] andDateImage:[UIImage imageNamed:@"project_1"] andNumLabel:@"1233" andDateLabel:@"2014-05-30"];
            [self.array addObject:xiangmu];
        }

        
        //在主线程中更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.pullView reloadData];//表视图重新加载数据
        });
        
    });
    self.pullView.pullLastRefreshDate = [NSDate date];
    self.pullView.pullTableIsRefreshing = NO;
}

-(void)loadMore{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.currentPage < self.totalPage) {
            self.currentPage++;
            //NSLog(@"indexPage:%d",self.indexPage);
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //更新数据源
//            static int j = 10;
//            for (int i = 0; i < 10; i++) {
//                //                [self setToUp];
//                j++;
//                NSString *str = [NSString stringWithFormat:@"新闻列表%d",j+1];
//                [self.array addObject:str];
//            }
            static int j = 10;
            for (int i = 0; i < 10; i++) {
                //                [self setToUp];
                j++;
                NSString *str = [NSString stringWithFormat:@"项目推荐列表%d",j+1];
                NSString *str1 = [NSString stringWithFormat:@"项目推荐%d",j+1];
                
                xiangmuCell *xiangmu = [[xiangmuCell alloc]initWithLbelText:str andDetailText1:str1 andNumImage:[UIImage imageNamed:@"project_2"] andDateImage:[UIImage imageNamed:@"project_1"] andNumLabel:@"1233" andDateLabel:@"2014-05-30"];
                [self.array addObject:xiangmu];
            }
            
            //在主线程中更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.pullView reloadData];//表视图重新加载数据
                //让表视图滚动到当前最后一个的下一个
                [self.pullView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.array.count-10] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                
                [self.pullView reloadData];
            });
            
        });
    });
    self.pullView.pullTableIsLoadingMore = NO;
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
