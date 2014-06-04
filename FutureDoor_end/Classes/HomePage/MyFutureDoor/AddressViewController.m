//
//  AddressViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

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
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(13, 5, 265.5, 34.5)];
    label.text = @"我的居住地址";
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(12.5, label.frame.origin.y+label.frame.size.height, 265.5, 38)];
    textField.placeholder = @"点击修改";
    textField.font = [UIFont systemFontOfSize:12];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.cornerRadius = 3;
    [view addSubview:textField];
    
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(isOK)];
    rightBtn.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}
-(void)isOK{
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
