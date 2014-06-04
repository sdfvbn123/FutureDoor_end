//
//  ProjectRecommendViewController.m
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ProjectRecommendViewController.h"

@interface ProjectRecommendViewController ()

@end

@implementation ProjectRecommendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"项目推荐";
    kNavigationBarFit(self);
//    kSET_NAV_BACKGOUND_COLOR;
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    [self createControl];
    
}


-(void)createControl{
    
    self.segmentedControl = [[AKSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 40)];
    self.segmentedControl.delegate = self;
    [self setupSegmentedControl];
    [self.view addSubview:self.segmentedControl];
    
    //创建tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.segmentedControl.frame.origin.y+self.segmentedControl.frame.size.height, Screen_width, Screen_height-64-49-self.segmentedControl.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.newsList = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i <20; i ++) {
        NSString *str1 = [NSString stringWithFormat:@"新闻列表%d",i+1];
        NSString *str2 = [NSString stringWithFormat:@"副标题%d",i+1];
        
        ProjectCell *project = [[ProjectCell alloc]initWithProjectImage:[UIImage imageNamed:@"banner1"] andText:str1 andDetailTex:str2 andDateTex:@"2014-5-29"];
        [self.newsList addObject:project];
    }
    
    self.pullView = [[PullTableView alloc]initWithFrame:CGRectMake(0, self.segmentedControl.frame.origin.y+self.segmentedControl.frame.size.height, Screen_width, Screen_height-64-49-self.segmentedControl.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.pullView];
    self.pullView.dataSource = self;
    self.pullView.delegate = self;
    self.pullView.pullDelegate = self;
    self.pullView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(void) setupSegmentedControl{
    UIImage *backgroundImage = [[UIImage imageNamed:@"nav_background.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.segmentedControl setBackgroundImage:backgroundImage];
    [self.segmentedControl setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.segmentedControl setSegmentedControlMode:AKSegmentedControlModeSticky];
    
    [self.segmentedControl setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin];
    UIButton *button1 = [[UIButton alloc]init];
    button1.tintColor = [UIColor whiteColor];
    UIImage *buttonTimeImageNormal1 = [UIImage imageNamed:@"time.png"];
    UIImage *buttonTimeImageNormal2 = [UIImage imageNamed:@"time_1.png"];
    [button1 setImage:buttonTimeImageNormal1 forState:UIControlStateNormal];
    [button1 setImage:buttonTimeImageNormal2 forState:UIControlStateSelected];
    [button1 setImage:buttonTimeImageNormal1 forState:UIControlStateHighlighted];
    
    UIButton *button2 = [[UIButton alloc]init];
    UIImage *buttonTypeImageNormal1 = [UIImage imageNamed:@"type.png"];
    UIImage *buttonTypeImageNormal2 = [UIImage imageNamed:@"type_2.png"];
    [button2 setImage:buttonTypeImageNormal1 forState:UIControlStateNormal];
    [button2 setImage:buttonTypeImageNormal2 forState:UIControlStateSelected];
    [button2 setImage:buttonTypeImageNormal1 forState:UIControlStateHighlighted];
    
    UIButton *button3 = [[UIButton alloc]init];
    UIImage *buttonAreaImageNormal1 = [UIImage imageNamed:@"area.png"];
    UIImage *buttonAreaImageNormal2 = [UIImage imageNamed:@"area_3.png"];
    [button3 setImage:buttonAreaImageNormal1 forState:UIControlStateNormal];
    [button3 setImage:buttonAreaImageNormal2 forState:UIControlStateSelected];
    [button3 setImage:buttonAreaImageNormal1 forState:UIControlStateHighlighted];
    
    [self.segmentedControl setButtonsArray:@[button1,button2,button3]];
    
                                                                                    
}
#pragma mark - 表视图委托，方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.newsList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!cell) {
        cell = [[ProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //单元格风格
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
    }
    
    ProjectCell *projectCell1 = self.newsList[indexPath.section];
    [cell blind:projectCell1];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 82.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//点击某一行进入下一页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
#pragma mark AKSegmentedControlDelegate
- (void)segmentedViewController:(AKSegmentedControl *)segmentedControl touchedAtIndex:(NSUInteger)index{
    
    NSLog(@"Selected Index %lu",(unsigned long)index);
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
        
        for (int i = 0; i < 20;  i++) {
            NSString *str1 = [NSString stringWithFormat:@"项目推荐%d",i+1];
            NSString *str2 = [NSString stringWithFormat:@"项目推荐%d",i+1];
            
            ProjectCell *project = [[ProjectCell alloc]initWithProjectImage:[UIImage imageNamed:@"banner1"] andText:str1 andDetailTex:str2 andDateTex:@"2014-5-29"];
            [self.newsList addObject:project];
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
            static int j = 10;
            for (int i = 0; i < 10; i++) {
                //                [self setToUp];
                j++;
                NSString *str1 = [NSString stringWithFormat:@"项目推荐%d",j+1];
                NSString *str2 = [NSString stringWithFormat:@"项目推荐%d",j+1];
                
                ProjectCell *project = [[ProjectCell alloc]initWithProjectImage:[UIImage imageNamed:@"banner1"] andText:str1 andDetailTex:str2 andDateTex:@"2014-5-29"];
                [self.newsList addObject:project];
            }
            //在主线程中更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.pullView reloadData];//表视图重新加载数据
                //让表视图滚动到最后
                //                [self.pullView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.newsList.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                [self.pullView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.newsList.count-1] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                
                [self.pullView reloadData];
            });
            
        });
    });
    self.pullView.pullTableIsLoadingMore = NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
