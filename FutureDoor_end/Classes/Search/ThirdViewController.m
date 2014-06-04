//
//  ThirdViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
{
    UITextField *searchTextField;
}
@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"搜索";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.mainView.hidden = YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    kNavigationBarFit(self);
    kSET_NAV_BACKGOUND_COLOR;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.list = [NSMutableArray arrayWithObjects:@"前阵子在学校突然想去网吧了，于是...", @"一熊孩子称爹洗澡的时候偷了100块钱",@"大致内容如下：儿子没钱跟老爹说...",@"去恶评完全",@"前阵子在学校突然想去网吧了，于是...", @"一熊孩子称爹洗澡的时候偷了100块钱",@"大致内容如下：儿子没钱跟老爹说...",nil];

    [self createControl];
}
-(void)createControl{
    searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(19, 15.5, 272, 32)];
    searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchTextField.placeholder = @"输入搜索内容...";
    searchTextField.keyboardType = UIKeyboardTypeASCIICapable;
    searchTextField.font = [UIFont systemFontOfSize:15];
    searchTextField.delegate = self;
    [self.view addSubview:searchTextField];
    
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(244, 3, 24, 24)];
    myImageView.image = [UIImage imageNamed:@"search_search"];
    UITapGestureRecognizer *searchTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchGesture)];
    myImageView.userInteractionEnabled = YES;
    [myImageView addGestureRecognizer:searchTap];
    [searchTextField addSubview:myImageView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(15, 60, 40, 30);
    [button1 setTitle:@"搜索" forState:UIControlStateNormal];
    button1.tintColor = [UIColor lightGrayColor];
    [button1 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(button1.frame.origin.x+button1.frame.size.width+5, 60, 50, 30);
    [button2 setTitle:@"关键词" forState:UIControlStateNormal];
    button2.tintColor = [UIColor lightGrayColor];
    [button2 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(button2.frame.origin.x+button2.frame.size.width+5, 60, 40, 30);
    [button3 setTitle:@"位置" forState:UIControlStateNormal];
    button3.tintColor = [UIColor lightGrayColor];
    [button3 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(button3.frame.origin.x+button3.frame.size.width+5, 60, 40, 30);
    [button4 setTitle:@"房产" forState:UIControlStateNormal];
    button4.tintColor = [UIColor lightGrayColor];
    [button4 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button5.frame = CGRectMake(button4.frame.origin.x+button4.frame.size.width+5, 60, 70, 30);
    [button5 setTitle:@"海滨小城" forState:UIControlStateNormal];
    button5.tintColor = [UIColor lightGrayColor];
    [button5 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button6.frame = CGRectMake(15, button1.frame.origin.y+button1.frame.size.height+7, 70, 30);
    [button6 setTitle:@"海滨小城" forState:UIControlStateNormal];
    button6.tintColor = [UIColor lightGrayColor];
    [button6 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button7.frame = CGRectMake(button6.frame.origin.x+button6.frame.size.width+5, button1.frame.origin.y+button1.frame.size.height+7, 70, 30);
    [button7 setTitle:@"海滨小城" forState:UIControlStateNormal];
    button7.tintColor = [UIColor lightGrayColor];
    [button7 addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    
    self.mainView = [[UIView alloc]initWithFrame:CGRectMake(19, button7.frame.origin.y+button7.frame.size.height+15, 272, 320)];
    [self.view addSubview:self.mainView];
    
    UIImageView *searchImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    searchImage.image = [UIImage imageNamed:@"search_11"];
    [self.mainView addSubview:searchImage];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(searchImage.frame.origin.x+searchImage.frame.size.width+5, 0, 80, 18)];
    label.text = @"搜索结果";
    label.font = [UIFont systemFontOfSize:13];
    [self.mainView addSubview:label];
    
    CGRect lRect;
    if (24*self.list.count >= 210) {
        lRect = CGRectMake(9, searchImage.frame.origin.y+searchImage.frame.size.height, 1.5, 210);
    }else{
        lRect = CGRectMake(9, searchImage.frame.origin.y+searchImage.frame.size.height, 1.5, 24*self.list.count+7);
    }
    UIImageView *lineImage = [[UIImageView alloc]initWithFrame:lRect];
    lineImage.image = [UIImage imageNamed:@"search_line"];
    [self.mainView addSubview:lineImage];
    
    CGRect tRect;
    if (24*self.list.count >= 200) {
        tRect = CGRectMake(lineImage.frame.origin.x+lineImage.frame.size.width, searchImage.frame.origin.y+searchImage.frame.size.height, 263, 200);
    }else{
        tRect = CGRectMake(lineImage.frame.origin.x+lineImage.frame.size.width, searchImage.frame.origin.y+searchImage.frame.size.height, 263, 24*self.list.count+7);
    }
    self.tableView = [[UITableView alloc]initWithFrame:tRect];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.mainView addSubview:self.tableView];
}
-(void)search:(UIButton*)button{
    searchTextField.text = button.currentTitle;
    self.mainView.hidden = NO;
}
-(void)searchGesture{
    self.mainView.hidden = NO;
}

#pragma mark - 表视图委托，方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //    return self.mutArray.count;
    return self.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //单元格风格
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    cell.textLabel.text = self.list[indexPath.section];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    //显示图片
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(276-29, 7.75, 9.5, 8.5)];
    myImageView.image = [UIImage imageNamed:@"search_right.png"];
    [cell addSubview:myImageView];

    CGSize itmeSize = CGSizeMake(0, 0);
    UIGraphicsBeginImageContext(itmeSize);
    CGRect imageRect = CGRectMake(0, 0, itmeSize.width, itmeSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//****
    UIGraphicsEndImageContext();
    
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 24;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//点击某一行进入下一页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
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
