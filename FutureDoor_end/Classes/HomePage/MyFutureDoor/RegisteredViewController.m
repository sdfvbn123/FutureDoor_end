//
//  RegisteredViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "RegisteredViewController.h"

@interface RegisteredViewController ()

@end

@implementation RegisteredViewController

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
    [self createControl];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"delete"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    // Do any additional setup after loading the view.
}
-(void)createControl{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.numText = [[UITextField alloc]initWithFrame:CGRectMake(15, 20.5, 303.5, 40)];
    self.numText.placeholder = @"手机号";
    self.numText.font = [UIFont systemFontOfSize:16];
    self.numText.delegate = self;
    [view addSubview:self.numText];
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, self.numText.frame.origin.y+self.numText.frame.size.height, 303.5, 1)];
    myImageView1.image = [UIImage imageNamed:@"mid"];
    [view addSubview:myImageView1];
    
    self.pwdText = [[UITextField alloc]initWithFrame:CGRectMake(15, self.numText.frame.origin.y+self.numText.frame.size.height, 303.5, 40)];
    self.pwdText.placeholder = @"密码";
    self.pwdText.font = [UIFont systemFontOfSize:16];
    self.pwdText.delegate = self;
    [view addSubview:self.pwdText];
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, self.pwdText.frame.origin.y+self.pwdText.frame.size.height, 303.5, 1)];
    myImageView2.image = [UIImage imageNamed:@"mid"];
    [view addSubview:myImageView2];
    
    self.secondPWD = [[UITextField alloc]initWithFrame:CGRectMake(15, self.pwdText.frame.origin.y+self.pwdText.frame.size.height, 303.5, 40)];
    self.secondPWD.placeholder = @"确认密码";
    self.secondPWD.font = [UIFont systemFontOfSize:16];
    self.secondPWD.delegate = self;
    [view addSubview:self.secondPWD];
    UIImageView *myImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, self.secondPWD.frame.origin.y+self.secondPWD.frame.size.height, 303.5, 1)];
    myImageView3.image = [UIImage imageNamed:@"mid"];
    [view addSubview:myImageView3];
    
    self.cdkey = [[UITextField alloc]initWithFrame:CGRectMake(15, self.secondPWD.frame.origin.y+self.secondPWD.frame.size.height, 303.5, 40)];
    self.cdkey.placeholder = @"邀请码";
    self.cdkey.font = [UIFont systemFontOfSize:16];
    self.cdkey.delegate = self;
    [view addSubview:self.cdkey];
    UIImageView *myImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, self.cdkey.frame.origin.y+self.cdkey.frame.size.height, 303.5, 1)];
    myImageView4.image = [UIImage imageNamed:@"mid"];
    [view addSubview:myImageView4];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(8, myImageView4.frame.origin.y+myImageView4.frame.size.height+16.5, 304.5, 34.5);
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"Register.png"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:registerBtn];
    
    UIImageView *qqImageView = [[UIImageView alloc]initWithFrame:CGRectMake(89, registerBtn.frame.origin.y+registerBtn.frame.size.height+27, 31, 31)];
    qqImageView.image = [UIImage imageNamed:@"qq_login.png"];
    [view addSubview:qqImageView];
    
    UITapGestureRecognizer *qqTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qqTap)];
    [qqImageView addGestureRecognizer:qqTap];

    
    UIImageView *everyoneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(qqImageView.frame.origin.x+qqImageView.frame.size.width+11.5, registerBtn.frame.origin.y+registerBtn.frame.size.height+27, 56.5, 31)];
    everyoneImageView.image = [UIImage imageNamed:@"everyone_login.png"];
    [view addSubview:everyoneImageView];
    
    UIImageView *sinaImageView = [[UIImageView alloc]initWithFrame:CGRectMake(everyoneImageView.frame.origin.x+everyoneImageView.frame.size.width+10, registerBtn.frame.origin.y+registerBtn.frame.size.height+27, 31, 31)];
    sinaImageView.image = [UIImage imageNamed:@"sina_login.png"];
    [view addSubview:sinaImageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(80+45, sinaImageView.frame.origin.y+sinaImageView.frame.size.height+7, 70.5+20, 20)];
    label.text = @"使用第三方注册";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:12];
    [view addSubview:label];

}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)registerBtnPressed
{

}

-(void)qqTap
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --------------------收起键盘------------------------

//收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
//textField委托方法收起键盘，点击return收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];//发布委托的textField对象放弃第一响应者
    return YES;
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
