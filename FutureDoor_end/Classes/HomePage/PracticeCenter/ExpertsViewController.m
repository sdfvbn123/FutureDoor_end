//
//  ExpertsViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-28.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ExpertsViewController.h"

@interface ExpertsViewController ()

@end

@implementation ExpertsViewController

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
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(9, 7.5, 302, 130.5)];
    myImageView.layer.cornerRadius = 5.0f;
    myImageView.image = [UIImage imageNamed:@"experts"];
    [self.view addSubview:myImageView];
    
    
    //创建tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(9, myImageView.frame.origin.y+myImageView.frame.size.height+8, Screen_width, Screen_height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.newsList = [NSMutableArray arrayWithCapacity:20];
    self.newsList = [NSMutableArray arrayWithObjects:@"新闻标题1",@"新闻标题2",@"新闻标题3",@"新闻标题4",@"新闻标题5",@"新闻标题6",@"新闻标题7",@"新闻标题8",@"新闻标题9",@"新闻标题10", nil];
    
    self.pullView = [[PullTableView alloc]initWithFrame:CGRectMake(0, myImageView.frame.origin.y+myImageView.frame.size.height+8, Screen_width, Screen_height-64-49-146) style:UITableViewStylePlain];
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
    //    [button1 setImage:buttonImageNormal1 forState:UIControlStateSelected];
    [button1 setImage:buttonTimeImageNormal2 forState:UIControlStateSelected];
    [button1 setImage:buttonTimeImageNormal1 forState:UIControlStateHighlighted];
    
    UIButton *button2 = [[UIButton alloc]init];
    UIImage *buttonTypeImageNormal1 = [UIImage imageNamed:@"type.png"];
    UIImage *buttonTypeImageNormal2 = [UIImage imageNamed:@"type_2.png"];
    [button2 setImage:buttonTypeImageNormal1 forState:UIControlStateNormal];
    //    [button2 setImage:buttonSocialImageNormal2 forState:UIControlStateSelected];
    [button2 setImage:buttonTypeImageNormal2 forState:UIControlStateSelected];
    [button2 setImage:buttonTypeImageNormal1 forState:UIControlStateHighlighted];
    
    UIButton *button3 = [[UIButton alloc]init];
    UIImage *buttonAreaImageNormal1 = [UIImage imageNamed:@"area.png"];
    UIImage *buttonAreaImageNormal2 = [UIImage imageNamed:@"area_3.png"];
    [button3 setImage:buttonAreaImageNormal1 forState:UIControlStateNormal];
    //    [button3 setImage:buttonSocialImageNormal3 forState:UIControlStateSelected];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //单元格风格
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
    }
    
    //显示图片
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 13.5, 76, 51)];
//    myImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    myImageView.layer.masksToBounds = YES;
    
    myImageView.image = [UIImage imageNamed:@"banner4.png"];
    [cell addSubview:myImageView];
    
    //显示标题
    cell.textLabel.text = self.newsList[indexPath.section];
//    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.text = @"新闻副标题";
//    cell.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(96, 54, 90, 15)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:now];
    timeLabel.text = [NSString stringWithFormat:@"%@",dateStr];
    timeLabel.font = [UIFont systemFontOfSize:10];
    [cell addSubview:timeLabel];
    
    CGSize itmeSize = CGSizeMake(66, 7.5);
    UIGraphicsBeginImageContext(itmeSize);
    CGRect imageRect = CGRectMake(0, 0, itmeSize.width, itmeSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//****
    UIGraphicsEndImageContext();
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//点击某一行进入下一页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%d",indexPath.section);
    
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
        
        for (int i = 0; i < 20; i++) {
            //[self setToUp];
            [self.newsList addObject:[NSString stringWithFormat:@"项目推荐列表%d",i+1]];
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
                //[self setToUp];
                NSString *str = [NSString stringWithFormat:@"新闻列表%d",j+1];
                [self.newsList addObject:str];
                j++;
            }
            
            //在主线程中更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.pullView reloadData];//表视图重新加载数据
                //让表视图滚动到当前最后一个的下一个
                [self.pullView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.newsList.count-10] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                
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
