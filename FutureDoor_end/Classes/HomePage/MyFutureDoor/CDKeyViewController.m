//
//  CDKeyViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-19.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "CDKeyViewController.h"

@interface CDKeyViewController ()

@end

@implementation CDKeyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"修改密码";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    kNavigationBarFit(self);
    kSET_NAV_BACKGOUND_COLOR;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    [self createControl];
}
-(void)createControl{
    
    UITextField *text1 = [[UITextField alloc]initWithFrame:CGRectMake(14, 22, 296.5, 37.5)];
    text1.placeholder = @"请输入已收到的验证码";
    text1.borderStyle = UITextBorderStyleRoundedRect;
    text1.clearButtonMode = UITextFieldViewModeWhileEditing;
    text1.delegate = self;
    [self.view addSubview:text1];
    
    UITextField *text2 = [[UITextField alloc]initWithFrame:CGRectMake(14, text1.frame.origin.y+text1.frame.size.height+12.5, 296.5, 37.5)];
    text2.placeholder = @"请输入新密码";
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.clearButtonMode = UITextFieldViewModeWhileEditing;
    text2.delegate = self;
    [self.view addSubview:text2];
    
    UITextField *text3 = [[UITextField alloc]initWithFrame:CGRectMake(14, text2.frame.origin.y+text2.frame.size.height+12.5, 296.5, 37.5)];
    text3.placeholder = @"确认新密码";
    text3.borderStyle = UITextBorderStyleRoundedRect;
    text3.clearButtonMode = UITextFieldViewModeWhileEditing;
    text3.delegate = self;
    [self.view addSubview:text3];
    
    UIImageView *submitImageView = [[UIImageView alloc]initWithFrame:CGRectMake(14, text3.frame.origin.y+text3.frame.size.height+12.5, 295.5, 34.5)];
    submitImageView.image = [UIImage imageNamed:@"commit.png"];
    UITapGestureRecognizer *submitTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(submit)];
    submitImageView.userInteractionEnabled = YES;
    [submitImageView addGestureRecognizer:submitTap];
    [self.view addSubview:submitImageView];
    
}
-(void)submit{
//    CDKeyViewController *CDKeyVC = [[CDKeyViewController alloc] init];
//    [self.navigationController pushViewController:CDKeyVC animated:YES];
}
-(void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
//textField委托方法收起键盘，点击return收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];//发布委托的textField对象放弃第一响应者
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
