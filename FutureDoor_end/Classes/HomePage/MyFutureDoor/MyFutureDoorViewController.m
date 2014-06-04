//
//  MyFutureDoorViewController.m
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "MyFutureDoorViewController.h"

@interface MyFutureDoorViewController ()
{
    UIScrollView *bgScrollView;
}
@end

@implementation MyFutureDoorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"登录";
        self.hidesBottomBarWhenPushed = YES;
        
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    TabBarViewController *tabController = (TabBarViewController *)self.tabBarController;
    [tabController hideTabBar:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    kNavigationBarFit(self);
    [self createControl];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"delete"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleBordered target:self action:@selector(registered)];
    rightBtn.tintColor = [UIColor grayColor];
    
    self.navigationItem.rightBarButtonItem = rightBtn;

    
}

-(void)createControl{
    
    bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64)];
    bgScrollView.showsVerticalScrollIndicator = NO;
    bgScrollView.userInteractionEnabled = YES;
    bgScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgScrollView];
    
    self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(113.5, 29.5, 94, 94)];
    self.myImageView.image = [UIImage imageNamed:@"headImage.png"];
    self.myImageView.layer.cornerRadius = 12.0f;
    self.myImageView.layer.masksToBounds = YES;
    self.myImageView.layer.borderWidth = 2.0f;
    self.myImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [bgScrollView addSubview:self.myImageView];
    
    self.nameView = [[UIView alloc]initWithFrame:CGRectMake(0, self.myImageView.frame.origin.y+self.myImageView.frame.size.height+20, Screen_width, 40.5)];
    [bgScrollView addSubview:self.nameView];
    
    UIImageView *nameImageView = [[UIImageView alloc]initWithFrame:CGRectMake(24.5+6, 9.25, 19, 22)];
    nameImageView.image = [UIImage imageNamed:@"lock.png"];
    [self.nameView addSubview:nameImageView];
    
    self.nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(nameImageView.frame.origin.x+nameImageView.frame.size.width+30, 0, 194, 40.5)];
    self.nameTextField.borderStyle = UITextBorderStyleNone;
    self.nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameTextField.placeholder = @"输入用户名";
    self.nameTextField.font = [UIFont systemFontOfSize:14];
    self.nameTextField.delegate = self;
    [self.nameTextField addTarget:self action:@selector(textFieldEditingBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self.nameView addSubview:self.nameTextField];
    
    self.downBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.downBtn.frame = CGRectMake(self.nameTextField.frame.origin.x+self.nameTextField.frame.size.width+10, 15.5, 18, 9.5);
    [self.downBtn setImage:[UIImage imageNamed:@"down_login.png"] forState:UIControlStateNormal];
    self.downBtn.tintColor = [UIColor grayColor];
    [self.downBtn addTarget:self action:@selector(down) forControlEvents:UIControlEventTouchUpInside];
    [self.nameView addSubview:self.downBtn];
    
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, self.nameView.frame.origin.y+self.nameView.frame.size.height, 303.5, 1)];
    myImageView1.image = [UIImage imageNamed:@"mid"];
    [bgScrollView addSubview:myImageView1];
    
    self.passwordView = [[UIView alloc]initWithFrame:CGRectMake(0, self.nameView.frame.origin.y+self.nameView.frame.size.height+1, Screen_width, 40)];
    [bgScrollView addSubview:self.passwordView];
    UIImageView *passwordImageView = [[UIImageView alloc]initWithFrame:CGRectMake(24.5+6, 9.25, 19, 18)];
    passwordImageView.image = [UIImage imageNamed:@"tool.png"];
    [self.passwordView addSubview:passwordImageView];
    
    self.passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(nameImageView.frame.origin.x+nameImageView.frame.size.width+30, 0, 194, 40.5)];
    self.passwordTextField.borderStyle = UITextBorderStyleNone;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.placeholder = @"输入密码";
    self.passwordTextField.secureTextEntry = YES;//输入的密码变成小黑点
    self.passwordTextField.font = [UIFont systemFontOfSize:14];
    self.passwordTextField.delegate = self;
    [self.passwordTextField addTarget:self action:@selector(textFieldEditingBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self.passwordView addSubview:self.passwordTextField];

    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, self.passwordView.frame.origin.y+self.passwordView.frame.size.height, 303.5, 1)];
    myImageView2.image = [UIImage imageNamed:@"mid"];
    [bgScrollView addSubview:myImageView2];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(7.5, self.passwordView.frame.origin.y+self.passwordView.frame.size.height+15, 304.5, 34.5);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login1.png"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [bgScrollView addSubview:loginBtn];
    
    UIImageView *qqImageView = [[UIImageView alloc]initWithFrame:CGRectMake(89, loginBtn.frame.origin.y+loginBtn.frame.size.height+17, 31, 31)];
    qqImageView.image = [UIImage imageNamed:@"qq_login.png"];
    [bgScrollView addSubview:qqImageView];
    
    UIImageView *everyoneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(qqImageView.frame.origin.x+qqImageView.frame.size.width+11.5, loginBtn.frame.origin.y+loginBtn.frame.size.height+17, 56.5, 31)];
    everyoneImageView.image = [UIImage imageNamed:@"everyone_login.png"];
    [bgScrollView addSubview:everyoneImageView];
    
    UIImageView *sinaImageView = [[UIImageView alloc]initWithFrame:CGRectMake(everyoneImageView.frame.origin.x+everyoneImageView.frame.size.width+10, loginBtn.frame.origin.y+loginBtn.frame.size.height+17, 31, 31)];
    sinaImageView.image = [UIImage imageNamed:@"sina_login.png"];
    [bgScrollView addSubview:sinaImageView];
    
    UIButton *forgetPWDBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    forgetPWDBtn.frame = CGRectMake(115, everyoneImageView.frame.origin.y+everyoneImageView.frame.size.height+16, 87.5+20, 10);
    [forgetPWDBtn setTitle:@"Forgotten Password ?" forState:UIControlStateNormal];
    forgetPWDBtn.tintColor = [UIColor grayColor];
    forgetPWDBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [forgetPWDBtn addTarget:self action:@selector(forgetPWD) forControlEvents:UIControlEventTouchUpInside];
    [bgScrollView addSubview:forgetPWDBtn];
    
    UILabel *lookLabel = [[UILabel alloc]initWithFrame:CGRectMake(127.5, forgetPWDBtn.frame.origin.y+forgetPWDBtn.frame.size.height+20, 65, 13)];
    lookLabel.text = @"先逛逛看";
    lookLabel.font = [UIFont systemFontOfSize:12];
    [bgScrollView addSubview:lookLabel];
    
    UIImageView *rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(lookLabel.frame.origin.x+lookLabel.frame.size.width+2, forgetPWDBtn.frame.origin.y+forgetPWDBtn.frame.size.height+20, 13, 13)];
    rightImageView.image = [UIImage imageNamed:@"right.png"];
    UITapGestureRecognizer *tapRight = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goHomePage:)];
    rightImageView.userInteractionEnabled = YES;
    [rightImageView addGestureRecognizer:tapRight];
    [bgScrollView addSubview:rightImageView];
    
}
-(void)back{
    TabBarViewController *tabController = (TabBarViewController *)self.tabBarController;
    [tabController hideTabBar:NO];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)down{
    
}
-(void)loginBtnPressed{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
-(void)registered{
     RegisteredViewController*registeredVC = [[RegisteredViewController alloc] init];
    [self.navigationController pushViewController:registeredVC animated:YES];
}
-(void)forgetPWD{
    ForgetPWDViewController *forgetVC = [[ForgetPWDViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}
-(void)goHomePage:(UITapGestureRecognizer *)recognizer{
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}


-(void)textFieldEditingBegin
{
    [UIView animateWithDuration:0.5f animations:^{
        bgScrollView.frame = CGRectMake(0, -64, Screen_width, Screen_height);
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark --------------------收起键盘------------------------

//收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.5f animations:^{
        bgScrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height-64);
    } completion:^(BOOL finished) {
        
    }];
}
//textField委托方法收起键盘，点击return收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];//发布委托的textField对象放弃第一响应者
    [UIView animateWithDuration:0.5f animations:^{
        bgScrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height-64);
    } completion:^(BOOL finished) {
        
    }];
    return YES;
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
