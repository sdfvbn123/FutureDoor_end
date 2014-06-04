//
//  ForgetPWDViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-19.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ForgetPWDViewController.h"

@interface ForgetPWDViewController ()

@end

@implementation ForgetPWDViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    kNavigationBarFit(self);
    kSET_NAV_BACKGOUND_COLOR;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(14, 22, 296.5, 37.5)];
    text.placeholder = @"请输入注册手机号";
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    text.delegate = self;
    [self.view addSubview:text];

    
    UIImageView *nextImageView = [[UIImageView alloc]initWithFrame:CGRectMake(14.5, text.frame.origin.y+text.frame.size.height+14, 295.5, 34.5)];
    nextImageView.image = [UIImage imageNamed:@"pwd_next.png"];
    UITapGestureRecognizer *nextTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(nextStep)];
    nextImageView.userInteractionEnabled = YES;
    [nextImageView addGestureRecognizer:nextTap];
    [self.view addSubview:nextImageView];
    
}

-(void)nextStep{
    NextStepViewController *nextStepVC = [[NextStepViewController alloc] init];
    [self.navigationController pushViewController:nextStepVC animated:YES];
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
