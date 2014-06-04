//
//  FifthViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"更多";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    kNavigationBarFit(self);
    kSET_NAV_BACKGOUND_COLOR;

   self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 5.5, Screen_width, Screen_height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    MoreCellObject *object1 = [[MoreCellObject alloc]initWithMyimage:[UIImage imageNamed:@"more_1"] andNextImage:[UIImage imageNamed:@"more_7"] andSeparatorImage:[UIImage imageNamed:@"more_mid"] andText:@"一键分享"];
     MoreCellObject *object2 = [[MoreCellObject alloc]initWithMyimage:[UIImage imageNamed:@"more_2"] andNextImage:[UIImage imageNamed:@"more_7"] andSeparatorImage:[UIImage imageNamed:@"more_mid"] andText:@"检查更新"];
     MoreCellObject *object3 = [[MoreCellObject alloc]initWithMyimage:[UIImage imageNamed:@"more_3"] andNextImage:[UIImage imageNamed:@"more_7"] andSeparatorImage:[UIImage imageNamed:@"more_mid"] andText:@"帮助中心"];
    MoreCellObject *object4 = [[MoreCellObject alloc]initWithMidImage:[UIImage imageNamed:@"more_mid"]];
     MoreCellObject *object5 = [[MoreCellObject alloc]initWithMyimage:[UIImage imageNamed:@"more_4"] andNextImage:[UIImage imageNamed:@"more_7"] andSeparatorImage:[UIImage imageNamed:@"more_mid"] andText:@"投诉反馈"];
     MoreCellObject *object6 = [[MoreCellObject alloc]initWithMyimage:[UIImage imageNamed:@"more_5"] andNextImage:[UIImage imageNamed:@"more_7"] andSeparatorImage:[UIImage imageNamed:@"more_mid"] andText:@"亲，请评价，我们做的更好"];
     MoreCellObject *object7 = [[MoreCellObject alloc]initWithMyimage:[UIImage imageNamed:@"more_6"] andNextImage:[UIImage imageNamed:@"more_7"] andSeparatorImage:[UIImage imageNamed:@"more_mid"] andText:@"关于"];
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 178, 320, 22)];
    myImageView.image = [UIImage imageNamed:@"more_gray"];
    [self.tableView addSubview:myImageView];
    
    
    self.array1 = [NSArray arrayWithObjects:object1,object2,object3,object4,object5,object6, object7,nil];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return self.array1.count;
    //行就是数组的数据的个数
//    NSInteger count = 0;
//    switch (count) {
//        case 0:
//            count = self.array1.count;
//            break;
//        case 1:
//            count = self.array3.count;
//            break;
//        case 2:
//            count = self.array2.count;
//            break;
//        default:
//            break;
//    }
//    return count;
//
    return self.array1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //可重用标示符
    static NSString *CellIdentifier = @"Cell";
    //首先从出列可重用队列中获取单元格
     MoreCellTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //如果没有则创建
    if (!cell) {
        cell = [[MoreCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }

    MoreCellObject *moreCell1 = self.array1[indexPath.row];
    [cell bind:moreCell1];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 6) {
        
        FirstDetailViewController *detailVC = [[FirstDetailViewController alloc] init];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.navigationController pushViewController:detailVC animated:YES];

    }else if (indexPath.row == 4) {
        
        TouSuViewController *tousuVC = [[TouSuViewController alloc] init];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.navigationController pushViewController:tousuVC animated:YES];
        
    }else if (indexPath.row == 0) {
        
        ShareViewController *shareVC = [[ShareViewController alloc] init];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.navigationController pushViewController:shareVC animated:YES];
        
    }
}
-(void)didReceiveMemoryWarning
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
