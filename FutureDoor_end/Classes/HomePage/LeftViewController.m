//
//  LeftViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

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
    // Do any additional setup after loading the view.
    
}
-(void)createControl{
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 196)];
    myImageView.image = [UIImage imageNamed:@"huanghun1"];
    [self.view addSubview:myImageView];
    
    UIImageView *settingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(183+30, 9.5, 17, 17)];
    settingImageView.image = [UIImage imageNamed:@"left_7"];
    [myImageView addSubview:settingImageView];
    
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(9+5, 88, 71.5, 71.5)];
    self.headImageView.image = [UIImage imageNamed:@"avatar"];
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width/2;
    self.headImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.headImageView.layer.borderWidth = 2.0f;
    self.headImageView.layer.masksToBounds = YES;
    [myImageView addSubview:self.headImageView];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.headImageView.frame.origin.x+self.headImageView.frame.size.width+16, 88+36, 60, 14)];
    self.nameLabel.text = @"Aleny";
    [myImageView addSubview:self.nameLabel];
    
    self.sexImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.nameLabel.frame.origin.x+self.nameLabel.frame.size.width+12, 88+36, 14, 14)];
    self.sexImage.image = [UIImage imageNamed:@"girl"];
    [myImageView addSubview:self.sexImage];
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y+self.nameLabel.frame.size.height+10, 110, 10)];
    self.dateLabel.text = @"1977-05-01";
    [myImageView addSubview:self.dateLabel];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, myImageView.frame.origin.y+myImageView.frame.size.height, 320, Screen_height- myImageView.frame.size.height)];
    [self.view addSubview:view];
    
    UIImageView *myImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(12, 15, 49, 49)];
    myImage1.image = [UIImage imageNamed:@"left_1"];
    myImage1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1)];
    [myImage1 addGestureRecognizer:tap1];
    [view addSubview:myImage1];
    
    UIImageView *myImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(myImage1.frame.origin.x+myImage1.frame.size.width+10, 15, 49, 49)];
    myImage2.image = [UIImage imageNamed:@"left_2"];
    myImage2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2)];
    [myImage2 addGestureRecognizer:tap2];
    [view addSubview:myImage2];
    
    UIImageView *myImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(myImage2.frame.origin.x+myImage2.frame.size.width+10, 15, 49, 49)];
    myImage3.image = [UIImage imageNamed:@"left_3"];
    myImage3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap3)];
    [myImage3 addGestureRecognizer:tap3];
    [view addSubview:myImage3];
    
    UIImageView *myImage4 = [[UIImageView alloc]initWithFrame:CGRectMake(myImage3.frame.origin.x+myImage3.frame.size.width+10, 15, 49, 49)];
    myImage4.image = [UIImage imageNamed:@"left_4"];
    myImage4.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap4)];
    [myImage4 addGestureRecognizer:tap4];
    [view addSubview:myImage4];
    
    UIImageView *myImage5 = [[UIImageView alloc]initWithFrame:CGRectMake(myImage1.frame.origin.x, myImage1.frame.origin.y+myImage1.frame.size.height+15, 49, 49)];
    myImage5.image = [UIImage imageNamed:@"left_5"];
    myImage5.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap5)];
    [myImage5 addGestureRecognizer:tap5];
    [view addSubview:myImage5];
    
    UIImageView *myImage6 = [[UIImageView alloc]initWithFrame:CGRectMake(myImage5.frame.origin.x+myImage5.frame.size.width+10, myImage2.frame.origin.y+myImage2.frame.size.height+15, 49, 49)];
    myImage6.image = [UIImage imageNamed:@"left_6"];
    myImage6.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap6)];
    [myImage6 addGestureRecognizer:tap6];
    [view addSubview:myImage6];
    
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, myImage5.frame.origin.y+myImage5.frame.size.height+49, 303.5, 1)];
    myImageView2.image = [UIImage imageNamed:@"mid"];
    [view addSubview:myImageView2];
    
    UIImageView *myImageQQ = [[UIImageView alloc]initWithFrame:CGRectMake(45, myImageView2.frame.origin.y+myImageView2.frame.size.height+20, 31, 31)];
    myImageQQ.image = [UIImage imageNamed:@"qq.png"];
    [view addSubview:myImageQQ];
    
    UIImageView *myImageEveryone = [[UIImageView alloc]initWithFrame:CGRectMake(myImageQQ.frame.origin.x+myImageQQ.frame.size.width+20, myImageView2.frame.origin.y+myImageView2.frame.size.height+20, 56.5, 31)];
    myImageEveryone.image = [UIImage imageNamed:@"everyone.png"];
    [view addSubview:myImageEveryone];
    
    UIImageView *myImageSina = [[UIImageView alloc]initWithFrame:CGRectMake(myImageEveryone.frame.origin.x+myImageEveryone.frame.size.width+20, myImageView2.frame.origin.y+myImageView2.frame.size.height+20, 31, 31)];
    myImageSina.image = [UIImage imageNamed:@"sina.png"];
    [view addSubview:myImageSina];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(80, myImageEveryone.frame.origin.y+myImageEveryone.frame.size.height+7, 70.5+20, 20)];
    label.text = @"使用第三方快捷登陆";
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];

    
    
    
    
    
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
