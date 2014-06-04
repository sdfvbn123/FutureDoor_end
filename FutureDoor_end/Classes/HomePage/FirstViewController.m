//
//  FirstViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "FirstViewController.h"
#import "ASIHTTPRequest.h"

@interface FirstViewController ()
{
    UILabel *contentLabel;
    CoverButton *coverButton;
    NSMutableArray *_imageRequests;  // 下载图片请求
    UIImageView *scrollImageView;
    int downLoadNum;
}
@end

@implementation FirstViewController

- (void)dealloc
{
    [_imageRequests enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        ASIHTTPRequest *request = (ASIHTTPRequest *)obj;
        [request clearDelegatesAndCancel];
        request = nil;
    }];
    _imageRequests = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"未来门";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 发送首页数据请求
    [FutureDoorService sharedFutureDoorService].delegate = self;
    [[FutureDoorService sharedFutureDoorService] getHomePageData];

    
    TabBarViewController *tabController = (TabBarViewController *)self.tabBarController;
    [tabController hideTabBar:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    kNavigationBarFit(self);
    kSET_NAV_BACKGOUND_COLOR;
    
    downLoadNum = 0;
    self.picArray = [NSMutableArray arrayWithCapacity:5];
    self.labelArray = [NSMutableArray arrayWithCapacity:5];
    self.imageArray = [NSMutableArray arrayWithCapacity:5];
    _imageRequests = [[NSMutableArray alloc] initWithCapacity:5];

//    for (int i =0; i<4; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%d.png",i+1]];
//        NSData *data = UIImageJPEGRepresentation(image, 1);
//        [self.picArray addObject:data];
//    }
//    self.labelArray = [NSMutableArray arrayWithObjects:@"中国成为世界第二大经济体",@"欧洲冠军联赛皇家马德里夺冠欧洲冠军联赛皇家马德里夺冠",@"中国足球冲出亚洲",@"习近平考察与工人淋雨拍照留念", nil];
    
    [self createControl];
    
    UIImage *nImage = [UIImage imageNamed:@"search_11"];
    UIImage *hImage = [UIImage imageNamed:@"search_11"];
    UIButton *leftSlideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftSlideBtn.frame = CGRectMake(0, 0, nImage.size.width, nImage.size.height);
    [leftSlideBtn setBackgroundImage:nImage forState:UIControlStateNormal];
    [leftSlideBtn setBackgroundImage:hImage forState:UIControlStateHighlighted];
    UIBarButtonItem *leftSlideBtnItem =[[UIBarButtonItem alloc] initWithCustomView:leftSlideBtn];
    self.navigationItem.leftBarButtonItem = leftSlideBtnItem;
    [leftSlideBtn addTarget:self action:@selector(leftSlidePressed:) forControlEvents:UIControlEventTouchUpInside];

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //创建一个遮挡的button，菜单界面向左滑后，挡住菜单界面滑动后的点击事件
    coverButton = [CoverButton instance];
    coverButton.coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    coverButton.coverBtn.frame = CGRectMake(0, 0, 70, self.view.frame.size.height);
    coverButton.coverBtn.backgroundColor = [UIColor clearColor];
    coverButton.coverBtn.alpha = 0.0f;
    [coverButton.coverBtn addTarget:self action:@selector(cancelEventButton:) forControlEvents:UIControlEventTouchUpInside];
    [appDelegate.window addSubview:coverButton.coverBtn];
    [appDelegate.window bringSubviewToFront:coverButton.coverBtn];
    
}

-(void)leftSlidePressed:(id)sender
{
    coverButton = [CoverButton instance];
    if (coverButton.coverBtn) {
        coverButton.coverBtn.frame = CGRectMake(320-70, 0, 70, self.view.frame.size.height+120);
        coverButton.coverBtn.alpha = 0.3f;
        coverButton.direction = @"leftToRight";
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    LeftViewController *left = [[LeftViewController alloc] init];
    [appDelegate.tabBarViewController.revealSideViewController pushViewController:left onDirection:PPRevealSideDirectionLeft withOffset:70 animated:YES];
    PP_RELEASE(left);
}

//取消事件coverButton的点击事件
- (void)cancelEventButton:(id)sender{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([coverButton.direction isEqualToString:@"leftToRight"]) {
        LeftViewController *left = [[LeftViewController alloc] init];
        [appDelegate.tabBarViewController.revealSideViewController pushViewController:left onDirection:PPRevealSideDirectionLeft withOffset:70 animated:YES];
        PP_RELEASE(left);
    }else{
        RightViewController *right = [[RightViewController alloc] init];
        [appDelegate.tabBarViewController.revealSideViewController pushViewController:right onDirection:PPRevealSideDirectionRight withOffset:70 animated:YES];
        PP_RELEASE(right);
    }
    if (coverButton.coverBtn.alpha == 0.0) {
        coverButton.coverBtn.alpha = 0.3f;
    }else{
        coverButton.coverBtn.alpha = 0.0f;
    }
}

-(void)createControl{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    if (Screen_height<490) {
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 4.5f, Screen_width, kH_MyImageViewHeight)];
        self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.picArray.count, kH_MyImageViewHeight);
 
        //-------------------1-----------------
        self.practiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.practiceBtn.frame = CGRectMake(2, self.scrollView.frame.origin.y+self.scrollView.frame.size.height+3.5, 210, 69.5);
        [self.practiceBtn setBackgroundImage:[UIImage imageNamed:@"practice.png"] forState:UIControlStateNormal];
        [self.practiceBtn addTarget:self action:@selector(goPractice) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.practiceBtn];
        
        self.newsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.newsBtn.frame = CGRectMake(self.practiceBtn.frame.origin.x +self.practiceBtn.frame.size.width+5.5, self.scrollView.frame.origin.y+self.scrollView.frame.size.height+3.5, 101 , 69.5);
        [self.newsBtn setBackgroundImage:[UIImage imageNamed:@"news.png"] forState:UIControlStateNormal];
        [self.newsBtn addTarget:self action:@selector(goNews) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.newsBtn];
        
        //--------------------2------------------
        self.projectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.projectBtn.frame = CGRectMake(2, self.practiceBtn.frame.origin.y+self.practiceBtn.frame.size.height+4, 101, 84.5);
        [self.projectBtn setBackgroundImage:[UIImage imageNamed:@"project.png"] forState:UIControlStateNormal];
        [self.projectBtn addTarget:self action:@selector(goProject) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.projectBtn];
        
        self.futureDoorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.futureDoorBtn.frame = CGRectMake(self.projectBtn.frame.origin.x +self.projectBtn.frame.size.width+4.5, self.newsBtn.frame.origin.y+self.newsBtn.frame.size.height+4, 211, 84.5);
        [self.futureDoorBtn setBackgroundImage:[UIImage imageNamed:@"future.png"] forState:UIControlStateNormal];
        [self.futureDoorBtn addTarget:self action:@selector(goFutureDoor) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.futureDoorBtn];
        
        //--------------------3-------------------
        self.groupPurchaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.groupPurchaseBtn.frame = CGRectMake(2, self.projectBtn.frame.origin.y+self.projectBtn.frame.size.height+3.5, 210, 86);
        [self.groupPurchaseBtn setBackgroundImage:[UIImage imageNamed:@"purchase.png"] forState:UIControlStateNormal];
        [self.groupPurchaseBtn addTarget:self action:@selector(goGroupPurchase) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.groupPurchaseBtn];
        
        self.trainingCampBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.trainingCampBtn.frame = CGRectMake(self.groupPurchaseBtn.frame.origin.x +self.groupPurchaseBtn.frame.size.width+5.5, self.futureDoorBtn.frame.origin.y+self.futureDoorBtn.frame.size.height+3.5, 101, 86);
        [self.trainingCampBtn setBackgroundImage:[UIImage imageNamed:@"training.png"] forState:UIControlStateNormal];
        [self.trainingCampBtn addTarget:self action:@selector(goTrainingCamp) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.trainingCampBtn];
        
    }else{
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 7, Screen_width, kH_MyImageViewHeight+30)];
        self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.picArray.count, kH_MyImageViewHeight+50);
        
        
        //-------------------1-----------------
        self.practiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.practiceBtn.frame = CGRectMake(2, self.scrollView.frame.origin.y+self.scrollView.frame.size.height+3.5, 210, 69.5);
        [self.practiceBtn setBackgroundImage:[UIImage imageNamed:@"practice.png"] forState:UIControlStateNormal];
        [self.practiceBtn addTarget:self action:@selector(goPractice) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.practiceBtn];
        
        self.newsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.newsBtn.frame = CGRectMake(self.practiceBtn.frame.origin.x +self.practiceBtn.frame.size.width+5.5, self.scrollView.frame.origin.y+self.scrollView.frame.size.height+3.5, 101 , 69.5);
        [self.newsBtn setBackgroundImage:[UIImage imageNamed:@"news.png"] forState:UIControlStateNormal];
        [self.newsBtn addTarget:self action:@selector(goNews) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.newsBtn];
        
        //--------------------2------------------
        self.projectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.projectBtn.frame = CGRectMake(2, self.practiceBtn.frame.origin.y+self.practiceBtn.frame.size.height+4, 101, 84.5);
        [self.projectBtn setBackgroundImage:[UIImage imageNamed:@"project.png"] forState:UIControlStateNormal];
        [self.projectBtn addTarget:self action:@selector(goProject) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.projectBtn];
        
        self.futureDoorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.futureDoorBtn.frame = CGRectMake(self.projectBtn.frame.origin.x +self.projectBtn.frame.size.width+4.5, self.newsBtn.frame.origin.y+self.newsBtn.frame.size.height+4, 211, 84.5);
        [self.futureDoorBtn setBackgroundImage:[UIImage imageNamed:@"future.png"] forState:UIControlStateNormal];
        [self.futureDoorBtn addTarget:self action:@selector(goFutureDoor) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.futureDoorBtn];
        
        //--------------------3-------------------
        self.groupPurchaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.groupPurchaseBtn.frame = CGRectMake(2, self.projectBtn.frame.origin.y+self.projectBtn.frame.size.height+3.5, 210, 86);
        [self.groupPurchaseBtn setBackgroundImage:[UIImage imageNamed:@"purchase.png"] forState:UIControlStateNormal];
        [self.groupPurchaseBtn addTarget:self action:@selector(goGroupPurchase) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.groupPurchaseBtn];
        
        self.trainingCampBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.trainingCampBtn.frame = CGRectMake(self.groupPurchaseBtn.frame.origin.x +self.groupPurchaseBtn.frame.size.width+5.5, self.futureDoorBtn.frame.origin.y+self.futureDoorBtn.frame.size.height+3.5, 101, 86);
        [self.trainingCampBtn setBackgroundImage:[UIImage imageNamed:@"training.png"] forState:UIControlStateNormal];
        [self.trainingCampBtn addTarget:self action:@selector(goTrainingCamp) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.trainingCampBtn];
        
    }
    for (int i = 0; i < [self.picArray count]; i++) {
        scrollImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.bounds.size.width * i, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        
        scrollImageView.image = [UIImage imageNamed:@"banner1.png"];
        [self.scrollView addSubview:scrollImageView];
    }
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self; //**代理一定要设置,需要用到代理方法
    self.scrollView.userInteractionEnabled = NO;
    self.page = 0;
    [view addSubview:self.scrollView];
    
    CGRect cRect = CGRectMake(0, self.scrollView.frame.origin.y+self.scrollView.frame.size.height-20, Screen_width, 20);
    UIView *contentView = [[UIView alloc] initWithFrame:cRect];
    contentView.backgroundColor = [UIColor blackColor];
    contentView.alpha = 0.1;
    [view addSubview:contentView];
    
    CGRect lRect = CGRectMake(10, self.scrollView.frame.origin.y+self.scrollView.frame.size.height-20, Screen_width-90, 20);
    contentLabel = [[UILabel alloc] initWithFrame:lRect];
//    contentLabel.text = [self.labelArray objectAtIndex:0];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [view addSubview:contentLabel];
    
    //创建pageControl对象
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(260, self.scrollView.frame.origin.y+self.scrollView.frame.size.height-30, 40, 40)];
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.userInteractionEnabled = YES;
    self.pageControl.selected = YES;
//    [self.pageControl addTarget:self action:@selector(paging:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.pageControl];
    
}

//点击pageControl让scrolView滚动
-(void)paging:(UIPageControl *)sender{
    switch (sender.currentPage) {
        case 0:
            self.scrollView.contentOffset = CGPointMake(Screen_width*0, 0);
            break;
        case 1:
            self.scrollView.contentOffset = CGPointMake(Screen_width*1, 0);
            break;
        case 2:
            self.scrollView.contentOffset = CGPointMake(Screen_width*2, 0);
            break;
        case 3:
            self.scrollView.contentOffset = CGPointMake(Screen_width*3, 0);
            break;
            
        default:
            break;
    }
}
//此委托方法在scrolview滚动结束时被调用，可以完成scrolview和pageControl联动效果
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //根据scrolview的x轴偏移量计算当前页码
    //    int pageNumber = scrollView.contentOffset.x/scrollView.frame.size.width;
    //    self.pageControl.currentPage = pageNumber;
    self.page = self.pageControl.currentPage;
    
}

-(void)timeUpdate:(id*)sender{
    if (self.page == self.picArray.count-1) {
        self.page = 0;
        self.pageControl.currentPage = 0;
    }else{
        self.page++;
        self.pageControl.currentPage++;
    }
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * self.page, 0) animated:YES];
    contentLabel.text = [self.labelArray objectAtIndex:self.page];
}

-(void)goPractice{
    PracticeCenterViewController *practiceView = [[PracticeCenterViewController alloc]init];
    [self.navigationController pushViewController:practiceView animated:YES];
}

-(void)goNews{
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    [self.navigationController pushViewController:newsVC animated:YES];
}

-(void)goProject{
    ProjectRecommendViewController *projectRecommendVC = [[ProjectRecommendViewController alloc] init];
    [self.navigationController pushViewController:projectRecommendVC animated:YES];
    projectRecommendVC.hidesBottomBarWhenPushed = YES;
}

-(void)goFutureDoor{
    MyFutureDoorViewController *myFutureDoorVC = [[MyFutureDoorViewController alloc] init];
    [self.navigationController pushViewController:myFutureDoorVC animated:YES];
}

-(void)goGroupPurchase{
    GroupPurchaseViewController *groupPurchaseVC = [[GroupPurchaseViewController alloc] init];
    [self.navigationController pushViewController:groupPurchaseVC animated:YES];
}

-(void)goTrainingCamp{
    TrainingCampViewController *trainingView = [[TrainingCampViewController alloc] init];
    [self.navigationController pushViewController:trainingView animated:YES];
}

#pragma mark - TourServiceDelegate method

- (void)getHomePageDataResult:(NSArray *)homeArray
{
    NSLog(@"homeArray:%@",homeArray);
    for (int i = 0; i < homeArray.count; i++) {
        NSString *title = [[homeArray objectAtIndex:i] objectForKey:@"title"];
        NSString *imageUrl = [[homeArray objectAtIndex:i] objectForKey:@"litpic"];
        [self.labelArray addObject:title];
        [self.picArray addObject:imageUrl];
    }
    
    contentLabel.text = [self.labelArray objectAtIndex:0];

    
    // 下载图片
    if (homeArray.count > 0) {
        [self.picArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            NSURL *url = [NSURL URLWithString:[obj stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
            request.tag = idx;
            request.delegate = self;
            request.didFinishSelector = @selector(requestFinished:);
            request.didFailSelector = @selector(requestFailed:);
            [request startAsynchronous];
            [_imageRequests addObject:request];
        }];
    }
}

#pragma mark - ASIHTTPRequest callback methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    downLoadNum ++;
    if (request.responseData.length > 0) {
        UIImage *image = [UIImage imageWithData:request.responseData];
        [self.imageArray addObject:image];
    }
    
    if (downLoadNum == self.picArray.count) {
        [self reloadData];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"error: %@",[request error]);
}

- (void)reloadData
{
    self.pageControl.numberOfPages = self.picArray.count;
    
    for (int i = 0; i < [self.picArray count]; i++) {
        scrollImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.bounds.size.width * i, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        
        scrollImageView.image = [self.imageArray objectAtIndex:i];
        [self.scrollView addSubview:scrollImageView];
    }

    //启动NSTimer,每2秒执行一次
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(timeUpdate:) userInfo:nil repeats:YES];

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
