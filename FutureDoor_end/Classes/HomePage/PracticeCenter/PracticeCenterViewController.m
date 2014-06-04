//
//  PracticeCenterViewController.m
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "PracticeCenterViewController.h"

@interface PracticeCenterViewController ()
{
    NSArray *sortArray;
}
@end

@implementation PracticeCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"实践中心";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    kNavigationBarFit(self);
//    kSET_NAV_BACKGOUND_COLOR;
    
    sortArray = [NSArray arrayWithObjects:@"工作实践",@"创办企业",@"项目推荐",@"创业谷",@"优质团购",@"人际圈层",@"专家策划",@"商务拓展",@"医院学校", nil];
    
    [self createControl];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back1"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    leftBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    // Do any additional setup after loading the view.
}
-(void)createControl{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(320, self.view.frame.size.height+216-64-20);
    self.scrollView.showsVerticalScrollIndicator = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(MyEndEditing)];
    [self.scrollView addGestureRecognizer:tap];
    [view addSubview:self.scrollView];
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(7, 4.5f, 305, 30)];
    textfield.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textfield.layer.cornerRadius =  textfield.frame.size.height/2;
    textfield.layer.borderWidth = 0.5f;
    textfield.placeholder = @"     搜索文章、项目、新闻";
    textfield.font = [UIFont systemFontOfSize:14];
    textfield.textColor = [UIColor blackColor];
    textfield.delegate = self;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:textfield];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame = CGRectMake(270, 0, 21, 29.5);
    searchBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"search1.png"]];
    [searchBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [textfield addSubview:searchBtn];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, textfield.frame.origin.y+textfield.frame.size.height+3.5, kW_PracticeBtnWidth, kW_PracticeBtnHeight);
    [button1 setImage:[UIImage imageNamed:@"practice-Work.png"] forState:UIControlStateNormal];
    [button1 setTintColor:[UIColor lightGrayColor]];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(button1.frame.origin.x+button1.frame.size.width, textfield.frame.origin.y+textfield.frame.size.height+3.5, kW_PracticeBtnWidth, kW_PracticeBtnHeight);
    [button2 setImage:[UIImage imageNamed:@"practice-business.png"] forState:UIControlStateNormal];
    [button2 setTintColor:[UIColor lightGrayColor]];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(button2.frame.origin.x+button2.frame.size.width, textfield.frame.origin.y+textfield.frame.size.height+3.5, kW_PracticeBtnWidth, kW_PracticeBtnHeight);
    [button3 setImage:[UIImage imageNamed:@"practice-project.png"] forState:UIControlStateNormal];
    [button3 setTintColor:[UIColor lightGrayColor]];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(button3.frame.origin.x+button3.frame.size.width, textfield.frame.origin.y+textfield.frame.size.height+3.5, kW_PracticeBtnWidth, kW_PracticeBtnHeight);
    [button4 setImage:[UIImage imageNamed:@"practice-chuangye.png"] forState:UIControlStateNormal];
    [button4 setTintColor:[UIColor lightGrayColor]];
    button4.tag = 4;
    [button4 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(button4.frame.origin.x+button4.frame.size.width, textfield.frame.origin.y+textfield.frame.size.height+3.5, kW_PracticeBtnWidth, kW_PracticeBtnHeight);
    [button5 setImage:[UIImage imageNamed:@"practice-quality.png"] forState:UIControlStateNormal];
    [button5 setTintColor:[UIColor lightGrayColor]];
    button5.tag = 5;
    [button5 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(0, button1.frame.origin.y+button1.frame.size.height, kW_PracticeBtnWidth, kW_PracticeBtnHeight-4);
    [button6 setImage:[UIImage imageNamed:@"practice-circle.png"] forState:UIControlStateNormal];
    [button6 setTintColor:[UIColor lightGrayColor]];
    button6.tag = 6;
    [button6 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(button6.frame.origin.x+button6.frame.size.width, button2.frame.origin.y+button2.frame.size.height, kW_PracticeBtnWidth, kW_PracticeBtnHeight-4);
    [button7 setImage:[UIImage imageNamed:@"practice-experts.png"] forState:UIControlStateNormal];
    [button7 setTintColor:[UIColor lightGrayColor]];
    button7.tag = 7;
    [button7 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button7];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(button7.frame.origin.x+button7.frame.size.width, button3.frame.origin.y+button3.frame.size.height, kW_PracticeBtnWidth, kW_PracticeBtnHeight-4);
    [button8 setImage:[UIImage imageNamed:@"practice-BD.png"] forState:UIControlStateNormal];
    [button8 setTintColor:[UIColor lightGrayColor]];
    button8.tag = 8;
    [button8 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button8];
    
    UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    button9.frame = CGRectMake(button8.frame.origin.x+button8.frame.size.width, button4.frame.origin.y+button4.frame.size.height, kW_PracticeBtnWidth, kW_PracticeBtnHeight-4);
    [button9 setImage:[UIImage imageNamed:@"practice-xuexiao.png"] forState:UIControlStateNormal];
    [button9 setTintColor:[UIColor lightGrayColor]];
    button9.tag = 9;
    [button9 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button9];
    
//    UIButton *button10 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button10.frame = CGRectMake(button9.frame.origin.x+button9.frame.size.width, button5.frame.origin.y+button5.frame.size.height, kW_PracticeBtnWidth, kW_PracticeBtnHeight-4);
//    [button10 setImage:[UIImage imageNamed:@"blank.png"] forState:UIControlStateNormal];
//    [button10 setTintColor:[UIColor lightGrayColor]];
//    button10.tag = 10;
//    [button10 addTarget:nil action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:button10];
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, button6.frame.origin.y+button6.frame.size.height, 320, 10.5)];
    myImageView.image = [UIImage imageNamed:@"gray.png"];
    [self.scrollView addSubview:myImageView];
    
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, button6.frame.origin.y+button6.frame.size.height+10.5+11.5, 298.5, 112)];
    myImageView1.layer.cornerRadius = 3.0f;
    myImageView1.layer.masksToBounds = YES;
    myImageView1.image = [UIImage imageNamed:@"video"];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageLine)];
    myImageView1.userInteractionEnabled = YES;
    [myImageView1 addGestureRecognizer:tap1];
    [self.scrollView addSubview:myImageView1];
    
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, myImageView1.frame.origin.y+myImageView1.frame.size.height+5, 178.5, 75.5)];
    myImageView2.layer.cornerRadius = 3.0f;
    myImageView2.layer.masksToBounds = YES;
    myImageView2.image = [UIImage imageNamed:@"video1"];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageLine)];
    myImageView2.userInteractionEnabled = YES;
    [myImageView2 addGestureRecognizer:tap2];
    [self.scrollView addSubview:myImageView2];
    
    UIImageView *myImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(myImageView2.frame.origin.x+myImageView2.frame.size.width+6, myImageView1.frame.origin.y+myImageView1.frame.size.height+5, 114, 75.5)];
    myImageView3.layer.cornerRadius = 3.0f;
    myImageView3.layer.masksToBounds = YES;
    myImageView3.image = [UIImage imageNamed:@"video2"];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageLine)];
    myImageView3.userInteractionEnabled = YES;
    [myImageView3 addGestureRecognizer:tap3];
    [self.scrollView addSubview:myImageView3];

    
    UIImageView *myImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(10.5, myImageView3.frame.origin.y+myImageView2.frame.size.height+5, 298.5, 112-30)];
    myImageView5.layer.cornerRadius = 3.0f;
    myImageView5.layer.masksToBounds = YES;
    myImageView5.image = [UIImage imageNamed:@"video"];
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageLine)];
    myImageView5.userInteractionEnabled = YES;
    [myImageView5 addGestureRecognizer:tap5];
    [self.scrollView addSubview:myImageView5];
    
    
}
#pragma mark --------------------收起键盘------------------------
//点击屏幕收起键盘
- (void)MyEndEditing {
    [self.scrollView endEditing:YES];
    
    //此方法指定点击屏幕时,放下视图抬起的部分高度 (放下的高度要与抬起的高度相等)
    [UIView animateWithDuration:0.3 animations:^{
        self.scrollView.contentOffset = CGPointMake(0, -24);
    }];
    
    
}
//点击屏幕收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
//textField委托方法收起键盘，点击return收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];//发布委托的textField对象放弃第一响应者
    return YES;
}

#pragma mark --------------------图片连接------------------------
-(void)imageLine{
    
}
#pragma mark --------------------搜索------------------------
-(void)search{
    ThirdViewController *searchView = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:searchView animated:YES];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)buttonPressed:(UIButton*)button{
    if (button.tag % 3 == 1) {
        QualityViewController *qualityVC = [[QualityViewController alloc] init];
        qualityVC.title = [sortArray objectAtIndex:button.tag-1];
        [self.navigationController pushViewController:qualityVC animated:YES];
    }else if (button.tag % 3 == 2) {
        ExpertsViewController *expertsVC = [[ExpertsViewController alloc] init];
        expertsVC.title = [sortArray objectAtIndex:button.tag-1];
        [self.navigationController pushViewController:expertsVC animated:YES];
    }else if (button.tag % 3 == 0) {
        ProjectViewController *projectVC = [[ProjectViewController alloc] init];
        projectVC.title = [sortArray objectAtIndex:button.tag-1];
        [self.navigationController pushViewController:projectVC animated:YES];
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
