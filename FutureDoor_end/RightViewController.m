//
//  RightViewController.m
//  MyPPRevealSide
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import "RightViewController.h"

#define RIGHT_X  70
@interface RightViewController ()

@end

@implementation RightViewController

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
    self.view.backgroundColor = [UIColor cyanColor];
//    kNavigationBarFit( self);
//    kSET_NAV_BACKGOUND_COLOR;
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor lightGrayColor];
    [self createALabelToShowMessage];
//    [self createTable];
    
    // Do any additional setup after loading the view.
}

-(void)createTable{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0+RIGHT_X, 0, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [view addSubview:self.tableView];
    
    self.listArray = [NSArray arrayWithObjects:@"实践中心",@"新闻列表",@"团购",@"个人中心", nil];
    
}
- (void)createALabelToShowMessage
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(0, 64, Screen_width, 50);
    button1.layer.borderWidth = 0.5f;
    button1.layer.borderColor = [UIColor blackColor].CGColor;
    button1.backgroundColor = [UIColor clearColor];
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(33+RIGHT_X, 0, 29.5, 50)];
    myImageView1.image = [UIImage imageNamed:@"practiceicon.png"];
    [button1 addSubview:myImageView1];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(77.5+RIGHT_X, 0, 120, 50)];
    label1.text = @"实践中心";
    label1.textColor = [UIColor lightGrayColor];
    [button1 addSubview:label1];
    [button1 addTarget:self action:@selector(goPractice) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(0, button1.frame.origin.y+button1.frame.size.height-0.25, Screen_width, 50);
    button2.layer.borderWidth = 0.25f;
    button2.layer.borderColor = [UIColor blackColor].CGColor;
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(33+RIGHT_X, 0, 29.5, 50)];
    myImageView2.image = [UIImage imageNamed:@"newsicon.png"];
    [button2 addSubview:myImageView2];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(77.5+RIGHT_X, 0, Screen_width-77.5, 50)];
    label2.text = @"新闻中心";
    label2.textColor = [UIColor lightGrayColor];
    [button2 addSubview:label2];
    [button2 addTarget:self action:@selector(goNews) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(0, button2.frame.origin.y+button2.frame.size.height, Screen_width, 50);
    button3.layer.borderWidth = 0.25f;
    button3.layer.borderColor = [UIColor blackColor].CGColor;
    UIImageView *myImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(33+RIGHT_X, 0, 29.5, 50)];
    myImageView3.image = [UIImage imageNamed:@"projecticon.png"];
    [button3 addSubview:myImageView3];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(77.5+RIGHT_X, 0, Screen_width-77.5, 50)];
    label3.text = @"项目推荐";
    label3.textColor = [UIColor lightGrayColor];
    [button3 addSubview:label3];
    [button3 addTarget:self action:@selector(goProject) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(0, button3.frame.origin.y+button3.frame.size.height, Screen_width, 50);
    button4.layer.borderWidth = 0.25f;
    button4.layer.borderColor = [UIColor blackColor].CGColor;
    UIImageView *myImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(33+RIGHT_X, 0, 29.5, 50)];
    myImageView4.image = [UIImage imageNamed:@"futureicon.png"];
    [button4 addSubview:myImageView4];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(77.5+RIGHT_X, 0, Screen_width-77.5, 50)];
    label4.text = @"我的未来门";
    label4.textColor = [UIColor lightGrayColor];
    [button4 addSubview:label4];
    [button4 addTarget:self action:@selector(goFutureDoor) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button5.frame = CGRectMake(0, button4.frame.origin.y+button4.frame.size.height, Screen_width, 50);
    button5.layer.borderWidth = 0.25f;
    button5.layer.borderColor = [UIColor blackColor].CGColor;
    UIImageView *myImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(33+RIGHT_X, 0, 29.5, 50)];
    myImageView5.image = [UIImage imageNamed:@"purchaseicon.png"];
    [button5 addSubview:myImageView5];
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(77.5+RIGHT_X, 0, Screen_width-77.5, 50)];
    label5.text = @"团购";
    label5.textColor = [UIColor lightGrayColor];
    [button5 addSubview:label5];
    [button5 addTarget:self action:@selector(goGroupPurchase) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button6.frame = CGRectMake(0, button5.frame.origin.y+button5.frame.size.height-0.25, Screen_width, 50);
    button6.layer.borderWidth = 0.5f;
    button6.layer.borderColor = [UIColor blackColor].CGColor;
    UIImageView *myImageView6 = [[UIImageView alloc]initWithFrame:CGRectMake(33+RIGHT_X, 0, 29.5, 50)];
    myImageView6.image = [UIImage imageNamed:@"trainingicon.png"];
    [button6 addSubview:myImageView6];
    UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(77.5+RIGHT_X, 0, Screen_width-77.5, 50)];
    label6.text = @"实践中心";
    label6.textColor = [UIColor lightGrayColor];
    [button6 addSubview:label6];
    [button6 addTarget:self action:@selector(goTrainingCamp) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button6];
    
    
    UIImageView *myImageQQ = [[UIImageView alloc]initWithFrame:CGRectMake(52+RIGHT_X, 399, 31, 31)];
    myImageQQ.image = [UIImage imageNamed:@"qq.png"];
    [view addSubview:myImageQQ];
    
    UIImageView *myImageEveryone = [[UIImageView alloc]initWithFrame:CGRectMake(myImageQQ.frame.origin.x+myImageQQ.frame.size.width+10, 399, 56.5, 31)];
    myImageEveryone.image = [UIImage imageNamed:@"everyone.png"];
    [view addSubview:myImageEveryone];
    
    UIImageView *myImageSina = [[UIImageView alloc]initWithFrame:CGRectMake(myImageEveryone.frame.origin.x+myImageEveryone.frame.size.width+10, 399, 31, 31)];
    myImageSina.image = [UIImage imageNamed:@"sina.png"];
    [view addSubview:myImageSina];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(92.5+RIGHT_X, myImageEveryone.frame.origin.y+myImageEveryone.frame.size.height+7, 70.5, 20)];
    label.text = @"使用第三方登陆";
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    
}
#pragma mark - 表视图委托，方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.listArray.count;
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
    
    
    switch (indexPath.section) {
        case 0:
            
            cell.textLabel.text =[self.listArray objectAtIndex:indexPath.section];
            cell.imageView.image = [UIImage imageNamed:@"practiceicon.png"];
            
            break;
        case 1:
            
            cell.textLabel.text = [self.listArray objectAtIndex:indexPath.section];
            cell.imageView.image = [UIImage imageNamed:@"projecticon.png"];
            
            break;
        case 2:
            
            cell.textLabel.text = [self.listArray objectAtIndex:indexPath.section];
            cell.imageView.image = [UIImage imageNamed:@"futureicon.png"];
            
        case 3:
            
            cell.textLabel.text = [self.listArray objectAtIndex:indexPath.section];
            cell.imageView.image = [UIImage imageNamed:@"futureicon.png"];
            
            
            break;
        default:
            break;
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//点击某一行进入下一页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath == 0) {
        PracticeCenterViewController *pcVC = [[PracticeCenterViewController alloc] init];
        [self.navigationController pushViewController:pcVC animated:YES];
    }
    
}

-(void)goPractice{
    NSLog(@"++++++++++++");
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
    
}
-(void)goGroupPurchase{
    //    GroupPurchaseViewController *groupPurchaseVC = [GroupPurchaseViewController new];
    //    [self.navigationController pushViewController:groupPurchaseVC animated:YES];
}
-(void)goTrainingCamp{
    //    TrainingCampViewController *trainingView = [TrainingCampViewController new];
    //    [self.navigationController pushViewController:trainingView animated:YES];
    
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
