//
//  ShareViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

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
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(9, 10.5, 298, 50);
    button1.layer.borderColor = [UIColor grayColor].CGColor;
    button1.layer.borderWidth = 0.5;
    button1.layer.cornerRadius = 4;
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, 8.5, 37, 37)];
    myImageView1.image = [UIImage imageNamed:@"share_1"];
    [button1 addSubview:myImageView1];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(myImageView1.frame.origin.x+myImageView1.frame.size.width+8, 8.5, 80, 37)];
    label1.text = @"腾讯微博";
    [button1 addSubview:label1];
    [button1 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(9, button1.frame.origin.y+button1.frame.size.height-0.5, 298, 50);
    button2.layer.borderColor = [UIColor grayColor].CGColor;
    button2.layer.borderWidth = 0.5;
    button2.layer.cornerRadius = 4;
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, 8.5, 37, 36.5)];
    myImageView2.image = [UIImage imageNamed:@"share_2"];
    [button2 addSubview:myImageView2];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(myImageView2.frame.origin.x+myImageView2.frame.size.width+8, 8.5, 80, 37)];
    label2.text = @"QQ空间";
    [button2 addSubview:label2];
    [button2 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(9, button2.frame.origin.y+button2.frame.size.height-0.5, 298, 50);
    button3.layer.borderColor = [UIColor grayColor].CGColor;
    button3.layer.borderWidth = 0.5;
    button3.layer.cornerRadius = 4;
    UIImageView *myImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, 8.5, 43, 37)];
    myImageView3.image = [UIImage imageNamed:@"share_3"];
    [button3 addSubview:myImageView3];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(myImageView3.frame.origin.x+myImageView3.frame.size.width+8, 8.5, 80, 37)];
    label3.text = @"人人网";
    [button3 addSubview:label3];
    [button3 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(9, button3.frame.origin.y+button3.frame.size.height-0.5, 298, 50);
    button4.layer.borderColor = [UIColor grayColor].CGColor;
    button4.layer.borderWidth = 0.5;
    button4.layer.cornerRadius = 4;
    UIImageView *myImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, 8.5, 37, 35)];
    myImageView4.image = [UIImage imageNamed:@"share_4"];
    [button4 addSubview:myImageView4];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(myImageView4.frame.origin.x+myImageView4.frame.size.width+8, 8.5, 80, 37)];
    label4.text = @"新浪微博";
    [button4 addSubview:label4];
    [button4 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button4];
    
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
