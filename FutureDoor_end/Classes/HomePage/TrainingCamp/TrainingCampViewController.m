//
//  TrainingCampViewController.m
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "TrainingCampViewController.h"

@interface TrainingCampViewController ()

@end

@implementation TrainingCampViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"训练营";
    }
    return self;
}

- (void)viewDidLoad
{
    kNavigationBarFit(self);
    kSET_NAV_BACKGOUND_COLOR;
    [super viewDidLoad];
    [self createControl];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}
-(void)createControl{
    
//    self.segmentedControl = [[AKSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 40)];
//    self.segmentedControl.delegate = self;
//    [self setupSegmentedControl];
//    [self.view addSubview:self.segmentedControl];
    
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 38.5)];
    myImageView1.image = [UIImage imageNamed:@"21day"];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goFirst)];
    [myImageView1 addGestureRecognizer:tap1];
    myImageView1.userInteractionEnabled = YES;
    
    [self.view addSubview:myImageView1];
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 0, 180, 38.5)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goSecond)];
    [myImageView2 addGestureRecognizer:tap2];
    myImageView2.userInteractionEnabled = YES;
    myImageView2.image = [UIImage imageNamed:@"500training"];
    [self.view addSubview:myImageView2];
    
   
    //创建tableview
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.segmentedControl.frame.origin.y+self.segmentedControl.frame.size.height, Screen_width, Screen_height) style:UITableViewStylePlain];
     self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, myImageView1.frame.origin.y+myImageView1.frame.size.height, Screen_width, Screen_height-myImageView1.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.newsList = [NSMutableArray arrayWithCapacity:20];
    self.newsList = [NSMutableArray arrayWithObjects:@"新闻标题1",@"新闻标题2",@"新闻标题3",@"新闻标题4",@"新闻标题5",@"新闻标题6",@"新闻标题7",@"新闻标题8",@"新闻标题9",@"新闻标题10", nil];
    
    self.pullView = [[PullTableView alloc]initWithFrame:CGRectMake(0, myImageView1.frame.origin.y+myImageView1.frame.size.height, Screen_width, Screen_height-64-49-myImageView1.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.pullView];
    self.pullView.dataSource = self;
    self.pullView.delegate = self;
    self.pullView.pullDelegate = self;
    self.pullView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(void) setupSegmentedControl{
    UIImage *backgroundImage = [[UIImage imageNamed:@"nav_backgound.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.segmentedControl setBackgroundImage:backgroundImage];
    [self.segmentedControl setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.segmentedControl setSegmentedControlMode:AKSegmentedControlModeSticky];
    [self.segmentedControl setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin];
    UIButton *button1 = [[UIButton alloc]init];
    UIImage *buttonImageNormal1 = [UIImage imageNamed:@"1.png"];
    [button1 setImage:buttonImageNormal1 forState:UIControlStateNormal];
    [button1 setImage:buttonImageNormal1 forState:UIControlStateSelected];
    [button1 setImage:buttonImageNormal1 forState:UIControlStateHighlighted];
    
    UIButton *button2 = [[UIButton alloc]init];
    UIImage *buttonSocialImageNormal2 = [UIImage imageNamed:@"2.png"];
    [button2 setImage:buttonSocialImageNormal2 forState:UIControlStateNormal];
    [button2 setImage:buttonSocialImageNormal2 forState:UIControlStateSelected];
    [button2 setImage:buttonSocialImageNormal2 forState:UIControlStateHighlighted];
    
    
    [self.segmentedControl setButtonsArray:@[button1,button2]];
    
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //单元格风格
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    //显示图片
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15.5, 67.5, 51.5)];
//    myImageView.layer.cornerRadius = myImageView.frame.size.height/2;
//    myImageView.layer.masksToBounds = YES;
    myImageView.image = [UIImage imageNamed:@"banner4.png"];
    [cell addSubview:myImageView];
    
    //显示标题
    cell.textLabel.text = self.newsList[indexPath.section];
    cell.detailTextLabel.text = @"新闻副标题";
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(225, 50, 90, 15)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm"];
    NSDate *now = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:now];
    timeLabel.text = [NSString stringWithFormat:@"%@",dateStr];
    timeLabel.font = [UIFont systemFontOfSize:12];
    [cell addSubview:timeLabel];
    
    CGSize itmeSize = CGSizeMake(65, 40);
    UIGraphicsBeginImageContext(itmeSize);
    CGRect imageRect = CGRectMake(0, 0, itmeSize.width, itmeSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//****
    UIGraphicsEndImageContext();
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//点击某一行进入下一页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
            [self.newsList addObject:[NSString stringWithFormat:@"新闻列表%d",i+1]];
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
                NSString *str = [NSString stringWithFormat:@"新闻列表%d",j+1];
                [self.newsList addObject:str];
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

#pragma mark AKSegmentedControlDelegate
- (void)segmentedViewController:(AKSegmentedControl *)segmentedControl touchedAtIndex:(NSUInteger)index{
    
    NSLog(@"Selected Index %lu",(unsigned long)index);
    
}
-(void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)goFirst{
    NSLog(@"+++++++++++++++");
}
-(void)goSecond{
    NSLog(@"_________________");
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
