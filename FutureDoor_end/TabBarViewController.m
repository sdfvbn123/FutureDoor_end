//
//  TabBarViewController.m
//  MyPPRevealSide
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

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
    // Do any additional setup after loading the view.
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"tabBarTag"];
    
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:[[FirstViewController alloc] init]];
    firstNav.navigationBarHidden = NO;

    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:[[SecondViewController alloc] init]];
    secondNav.navigationBarHidden = NO;

    UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:[[ThirdViewController alloc] init]];
    thirdNav.navigationBarHidden = NO;

    UINavigationController *fourthNav = [[UINavigationController alloc]initWithRootViewController:[[FourthViewController alloc] init]];
    fourthNav.navigationBarHidden = NO;

    UINavigationController *fifthNav = [[UINavigationController alloc]initWithRootViewController:[[FifthViewController alloc] init]];
    fifthNav.navigationBarHidden = NO;
    
    
    NSArray *tabBarArr = [NSArray arrayWithObjects:firstNav,secondNav,thirdNav,fourthNav,fifthNav, nil];
    self.viewControllers = tabBarArr;
    
    //标签栏
//    UITabBarController *tabBC = [[UITabBarController alloc]init];
//    self.tabBarController = tabBC;
//    tabBC.viewControllers = tabBarArr;
//    tabBC.tabBar.hidden = NO;
    
    //添加自定义标签栏
    self.tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_height-49, Screen_width, 49)];
    
    //添加按钮
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 49)];
    [btn1 setImage:[UIImage imageNamed:@"homepage"] forState:UIControlStateNormal];
    btn1.tag = 0;
    [btn1 addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(64*1, 0, 64, 49)];
    [btn2 setImage:[UIImage imageNamed:@"reminders"] forState:UIControlStateNormal];
    btn2.tag = 1;
    [btn2 addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(64*2, 0, 64, 49)];
    [btn3 setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    btn3.tag = 2;
    [btn3 addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarView addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(64*3, 0, 64, 49)];
    [btn4 setImage:[UIImage imageNamed:@"contact"] forState:UIControlStateNormal];
    btn4.tag = 3;
    [btn4 addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarView addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]initWithFrame:CGRectMake(64*4, 0, 64, 49)];
    [btn5 setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    btn5.tag = 4;
    [btn5 addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarView addSubview:btn5];
    [self.view addSubview:self.tabBarView];
    self.tabBarController.selectedIndex = 0;
    self.lastBtn = btn1;
    [self.tabBarController hidesBottomBarWhenPushed];//+++++++++++++++++++++++
    
  /*  NSArray * imgarr = @[@"homepage",@"reminders",@"search",@"contact",@"more"];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_height-49, Screen_width, 49)];
    [self.view addSubview:view];
    
//    UIImageView * tabImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49 , 320, 49)];
//    tabImgView.image = [UIImage imageNamed:@"nav_background.png"];
//    tabImgView.userInteractionEnabled = YES;
//    [view addSubview:tabImgView];
    
    for (int i = 0; i < 5; i++) {
        self.btn = [[UIButton alloc]initWithFrame:CGRectMake(64*i, [UIScreen mainScreen].bounds.size.height - 49 , 64, 49)];
        self.btn.tag = i;
//        self.btn.hidden = YES;
        [self.btn setBackgroundImage:[UIImage imageNamed:[imgarr objectAtIndex:i]] forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(pressedTabButton:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:self.btn];
    }*/
    
    
    
}
-(void)tabBarButtonPressed:(UIButton *)button{
    
    NSInteger tag = [[[NSUserDefaults standardUserDefaults] objectForKey:@"tabBarTag"] integerValue];
    if (button.tag == 3) {
        self.selectedIndex = tag;
        UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"我们将竭诚为您服务", @"拨打电话 010-5339322", nil];
        [choiceSheet showInView:self.view];
    }else{
        self.selectedIndex = button.tag;
        [[NSUserDefaults standardUserDefaults] setInteger:button.tag forKey:@"tabBarTag"];
    }
    
    
    
//    [self.lastBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.lastBtn = button;
    
}
- (void)hideTabBar:(BOOL)hide
{
    if (hide) {
        self.tabBarView.hidden = YES;
    }else{
        self.tabBarView.hidden = NO;
    }
//    CGRect rect = CGRectMake(0, self.view.frame.size.height+49, self.view.frame.size.width, 49);
//    self.tabBarView.frame = rect;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
    }else if(buttonIndex == 1){
        
        NSString *deviceType = [UIDevice currentDevice].model;
        if([deviceType  isEqualToString:@"iPod touch"]||[deviceType  isEqualToString:@"iPad"]||[deviceType  isEqualToString:@"iPhone Simulator"]){//判断设备是否可以打电话
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"您的设备不支持拨打电话" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
        
        NSString *urlStr = @"010-5339322";
        urlStr = [NSString stringWithFormat:@"tel://%@",urlStr];
        NSURL *url = [NSURL URLWithString:urlStr];
        [[UIApplication sharedApplication]openURL:url];
        
    }else{
        
    }
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
