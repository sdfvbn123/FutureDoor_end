//
//  NewsViewController.m
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "NewsViewController.h"
#import "UIImageView+WebCache.h"
@interface NewsViewController ()

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"新闻中心";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if (!self.pullView.pullTableIsRefreshing) {
//        self.pullView.pullTableIsRefreshing = YES;
//        [self performSelector:@selector(refreshing) withObject:nil afterDelay:0];
//    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    kNavigationBarFit(self);
//    kSET_NAV_BACKGOUND_COLOR;
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.newsList = [NSMutableArray arrayWithCapacity:20];
    self.newsList = [NSMutableArray arrayWithObjects:@"新闻标题0",@"新闻标题1",@"新闻标题2",@"新闻标题3",@"新闻标题4",@"新闻标题5",@"新闻标题6",@"新闻标题7",@"新闻标题8",@"新闻标题9", nil];
    
    [self createControl];
    
    self.currentPage = 1;
    
    self.hidesBottomBarWhenPushed = YES;
}
-(void)createControl{
    //创建分段按钮
    self.segmentedControl = [[AKSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 40)];
    self.segmentedControl.delegate = self;
    [self setupSegmentedControl];
    [self.view addSubview:self.segmentedControl];
    
    //创建tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.segmentedControl.frame.origin.y+self.segmentedControl.frame.size.height, Screen_width, Screen_height-64-49-self.segmentedControl.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.pullView = [[PullTableView alloc]initWithFrame:CGRectMake(0, self.segmentedControl.frame.origin.y+self.segmentedControl.frame.size.height, Screen_width, Screen_height-64-49-self.segmentedControl.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.pullView];
    self.pullView.dataSource = self;
    self.pullView.delegate = self;
    self.pullView.pullDelegate = self;
    self.pullView.separatorStyle = UITableViewCellSeparatorStyleNone;

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
            for (int i = 1; i < 10; i++) {
                //[self setToUp];
                NSString *str = [NSString stringWithFormat:@"新闻列表%d",j+1];
                [self.newsList addObject:str];
                j++;
            }
            //在主线程中更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.pullView reloadData];//表视图重新加载数据
                //让表视图滚动到最后
                [self.pullView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.newsList.count-10] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                
                [self.pullView reloadData];
            });
            
        });
    });
    self.pullView.pullTableIsLoadingMore = NO;
}

#pragma mark-分段按钮动作实现
-(void) setupSegmentedControl{
    UIImage *backgroundImage = [[UIImage imageNamed:@"nav_backgound.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.segmentedControl setBackgroundImage:backgroundImage];
    [self.segmentedControl setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.segmentedControl setSegmentedControlMode:AKSegmentedControlModeSticky];
    [self.segmentedControl setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin];
    UIButton *button1 = [[UIButton alloc]init];
    UIImage *buttonImageNormal1 = [UIImage imageNamed:@"news_1.png"];
    UIImage *buttonImageSelected1 = [UIImage imageNamed:@"news_11.png"];
    [button1 setImage:buttonImageNormal1 forState:UIControlStateNormal];
    [button1 setImage:buttonImageSelected1 forState:UIControlStateSelected];
    [button1 setImage:buttonImageNormal1 forState:UIControlStateHighlighted];
    
    UIButton *button2 = [[UIButton alloc]init];
    UIImage *buttonImageNormal2 = [UIImage imageNamed:@"news_2.png"];
    UIImage *buttonImageSelected2 = [UIImage imageNamed:@"news_22.png"];
    [button2 setImage:buttonImageNormal2 forState:UIControlStateNormal];
    [button2 setImage:buttonImageSelected2 forState:UIControlStateSelected];
    [button2 setImage:buttonImageNormal2 forState:UIControlStateHighlighted];
    
    UIButton *button3 = [[UIButton alloc]init];
    UIImage *buttonImageNormal3 = [UIImage imageNamed:@"news_3.png"];
    UIImage *buttonImageSelected3 = [UIImage imageNamed:@"news_33.png"];
    [button3 setImage:buttonImageNormal3 forState:UIControlStateNormal];
    [button3 setImage:buttonImageSelected3 forState:UIControlStateSelected];
    [button3 setImage:buttonImageNormal3 forState:UIControlStateHighlighted];
    
    UIButton *button4 = [[UIButton alloc]init];
    UIImage *buttonImageNormal4 = [UIImage imageNamed:@"news_4.png"];
    UIImage *buttonImageSelected4 = [UIImage imageNamed:@"news_44.png"];
    [button4 setImage:buttonImageNormal4 forState:UIControlStateNormal];
    [button4 setImage:buttonImageSelected4 forState:UIControlStateSelected];
    [button4 setImage:buttonImageNormal4 forState:UIControlStateHighlighted];
    
    [self.segmentedControl setButtonsArray:@[button1,button2,button3,button4]];
    
}

- (void)segmentedViewController:(AKSegmentedControl *)segmentedControl touchedAtIndex:(NSUInteger)index{
    
    NSLog(@"Selected Index %lu",(unsigned long)index);
    
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
    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!cell) {
        cell = [[NewsListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //单元格风格
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    /* NSDictionary *model = [self.listObjects objectAtIndex:indexPath.row];
    [cell.imgView setImageWithURL:[NSURL URLWithString:[model objectForKey:@"picture"]] placeholderImage:[UIImage imageNamed:@"banner1"]];
    cell.lbTitle.text = [model objectForKey:@"title"];
    cell.lbSubtitle.text = [model objectForKey:@"content"];
    */
        
    
   //显示图片
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(16.5, 11.5, 65, 65)];
    myImageView.layer.cornerRadius = myImageView.frame.size.height/2;
    myImageView.layer.borderWidth = 1.5;
    myImageView.layer.masksToBounds = YES;
    myImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    myImageView.image = [UIImage imageNamed:@"banner1.png"];
    [cell addSubview:myImageView];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(220, 55, 90, 15)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd"];
    NSDate *now = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:now];
    timeLabel.text = [NSString stringWithFormat:@"%@",dateStr];
    timeLabel.font = [UIFont systemFontOfSize:12];
    [cell addSubview:timeLabel];
    
    
    //显示标题
    cell.textLabel.text = self.newsList[indexPath.section];
    cell.detailTextLabel.text = @"副标题";
    
    CGSize itmeSize = CGSizeMake(70, 40);
    UIGraphicsBeginImageContext(itmeSize);
    CGRect imageRect = CGRectMake(0, 0, itmeSize.width, itmeSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//****
    UIGraphicsEndImageContext();
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

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
