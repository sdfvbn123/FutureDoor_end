//
//  TouSuViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "TouSuViewController.h"

@interface TouSuViewController ()

@end

@implementation TouSuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(13, 10, 304, 34)];
    label1.text = @"感谢您对未来门的支持";
    label1.font = [UIFont systemFontOfSize:16];
    [view addSubview:label1];
    
    UITextView *textView1 = [[UITextView alloc]initWithFrame:CGRectMake(12.5, label1.frame.origin.y+label1.frame.size.height+5, 295.5, 78)];
    textView1.layer.borderColor = [UIColor grayColor].CGColor;
    textView1.layer.borderWidth = 0.5;
    textView1.layer.cornerRadius = 5;
    [view addSubview:textView1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(13, textView1.frame.origin.y+textView1.frame.size.height+5, 304, 34)];
    label2.text = @"您的联系方式";
    label2.font = [UIFont systemFontOfSize:16];
    [view addSubview:label2];
    
//    UITextView *textView2 = [[UITextView alloc]initWithFrame:CGRectMake(12.5, label2.frame.origin.y+label2.frame.size.height+5, 295.5, 38)];
//    textView2.text = @"请留下您的手机号码 或者邮箱";
//    textView2.layer.borderColor = [UIColor grayColor].CGColor;
//    textView2.layer.borderWidth = 0.5;
//    textView2.layer.cornerRadius = 5;
//    [view addSubview:textView2];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(12.5, label2.frame.origin.y+label2.frame.size.height+5, 295.5, 38)];
    textField.placeholder = @"   请留下您的手机号码 或者邮箱";
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 0.5;
    textField.layer.cornerRadius = 5;
    textField.font = [UIFont systemFontOfSize:13];
    [view addSubview:textField];

    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
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
