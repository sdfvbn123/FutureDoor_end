//
//  ModifyViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ModifyViewController.h"

@interface ModifyViewController ()

@end

@implementation ModifyViewController

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
    [self createCortoller];
    self.navigationController.navigationBarHidden = NO;
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}
-(void)createCortoller{

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64)];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.textField1 = [[UITextField alloc]initWithFrame:CGRectMake(15, 19.5, 296.5, 37.5)];
    self.textField1.borderStyle = UITextBorderStyleRoundedRect;
    self.textField1.layer.borderWidth = 0.5;
    self.textField1.layer.cornerRadius = 3;
    self.textField1.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField1.placeholder = @"账号：";
    self.textField1.tag = 1;
    self.textField1.delegate = self;
    self.textField1.font = [UIFont systemFontOfSize:15];
    [self.textField1 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField1];
    
    self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(15, self.textField1.frame.origin.y+self.textField1.frame.size.height+8.5, 296.5, 37.5)];
    self.textField2.borderStyle = UITextBorderStyleRoundedRect;
    self.textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField2.placeholder = @"姓名：";
    self.textField2.layer.borderWidth = 0.5;
    self.textField2.layer.cornerRadius = 3;
    self.textField2.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField2.tag = 2;
    self.textField2.delegate = self;
    [self.textField2 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField2];
    
    self.textField3 = [[UITextField alloc]initWithFrame:CGRectMake(15, self.textField2.frame.origin.y+self.textField2.frame.size.height-1, 296.5, 37.5)];
    self.textField3.borderStyle = UITextBorderStyleRoundedRect;
    self.textField3.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField3.placeholder = @"性别：";
    self.textField3.layer.borderWidth = 0.5;
    self.textField3.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField3.tag = 3;
    self.textField3.delegate = self;
    [self.textField3 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField3];
    
    self.textField4 = [[UITextField alloc]initWithFrame:CGRectMake(15, self.textField3.frame.origin.y+self.textField3.frame.size.height-1, 296.5, 37.5)];
    self.textField4.borderStyle = UITextBorderStyleRoundedRect;
    self.textField4.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField4.placeholder = @"生日：";
    self.textField4.layer.borderWidth = 0.5;
    self.textField4.layer.cornerRadius = 3;
    self.textField4.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField4.tag = 4;
    self.textField4.delegate = self;
    [self.textField4 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField4];
    
    self.textField5 = [[UITextField alloc]initWithFrame:CGRectMake(15, self.textField4.frame.origin.y+self.textField4.frame.size.height+8.5, 296.5, 37.5)];
    self.textField5.borderStyle = UITextBorderStyleRoundedRect;
    self.textField5.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField5.placeholder = @"手机：";
    self.textField5.layer.borderWidth = 0.5;
    self.textField5.layer.cornerRadius = 3;
    self.textField5.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField5.tag = 5;
    self.textField5.delegate = self;
    [self.textField5 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField5];
    
    self.textField6 = [[UITextField alloc]initWithFrame:CGRectMake(15, self.textField5.frame.origin.y+self.textField5.frame.size.height-1, 296.5, 37.5)];
    self.textField6.borderStyle = UITextBorderStyleRoundedRect;
    self.textField6.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField6.placeholder = @"QQ：";
    self.textField6.layer.borderWidth = 0.5;
    self.textField6.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField6.tag = 6;
    self.textField6.delegate = self;
    [self.textField6 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField6];
    
    self.textField7 = [[UITextField alloc]initWithFrame:CGRectMake(15, self.textField6.frame.origin.y+self.textField6.frame.size.height-1, 296.5, 37.5)];
    self.textField7.borderStyle = UITextBorderStyleRoundedRect;
    self.textField7.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField7.placeholder = @"邮箱：";
    self.textField7.layer.borderWidth = 0.5;
    self.textField7.layer.cornerRadius = 3;
    self.textField7.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField7.tag = 7;
    self.textField7.delegate = self;
    [self.textField7 addTarget:self action:@selector(textFieldEditingBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.scrollView addSubview:self.textField7];
    
}
-(void)back{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.navigationController.navigationBarHidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.scrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height);
    self.scrollView.contentSize = CGSizeMake(Screen_width, Screen_height+150);
}

-(void)textFieldEditingBegin:(UITextField*)tf
{
    [UIView animateWithDuration:0.5f animations:^{
        if (tf.tag == 1) {
            self.scrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height);
        }else if(tf.tag == 2) {
            self.scrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height);
        }else if(tf.tag == 3) {
            self.scrollView.frame = CGRectMake(0, -37.5, Screen_width, Screen_height);
        }else if(tf.tag == 4){
            self.scrollView.frame = CGRectMake(0, -37.5*2, Screen_width, Screen_height);
        }else if(tf.tag == 5){
            self.scrollView.frame = CGRectMake(0, -37.5*3, Screen_width, Screen_height);
        }else if(tf.tag == 6){
            self.scrollView.frame = CGRectMake(0, -37.5*4, Screen_width, Screen_height);
        }else if(tf.tag == 7){
            self.scrollView.frame = CGRectMake(0, -37.5*4, Screen_width, Screen_height);
        }
        self.scrollView.contentSize = CGSizeMake(Screen_width, Screen_height+10);

    } completion:^(BOOL finished) {
        
    }];
}

//收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.5f animations:^{
        self.scrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height-64);
    } completion:^(BOOL finished) {
        
    }];
    [self.view endEditing:YES];
}
//textField委托方法收起键盘，点击return收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [UIView animateWithDuration:0.5f animations:^{
        self.scrollView.frame = CGRectMake(0, 0, Screen_width, Screen_height-64);
    } completion:^(BOOL finished) {
        
    }];
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
