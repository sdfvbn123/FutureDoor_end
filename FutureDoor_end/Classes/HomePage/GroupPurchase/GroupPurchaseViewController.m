//
//  GroupPurchaseViewController.m
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "GroupPurchaseViewController.h"

@interface GroupPurchaseViewController ()

@end

@implementation GroupPurchaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"团购";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //解析数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];
    NSString *string = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [string objectFromJSONString];
    NSMutableArray *arrayImage = [[NSMutableArray alloc]init];
    
    for (int i=0; i<[array count]; i++) {
        NSDictionary *dataD = [array objectAtIndex:i];
        if (dataD) {
            ImageInfo *imageInfo = [[ImageInfo alloc]initWithDictionary:dataD];
            [arrayImage addObject:imageInfo];
        }
    }
    NSLog(@"%@",arrayImage);
    
    self.waterView = [[ImageWaterView alloc]initWithDataArray:arrayImage withFrame:CGRectMake(0, 0, 320, Screen_height-64-49)];
    
    //添加上拉加载更多
    __weak GroupPurchaseViewController *blockSelf = self;
    [self.waterView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"上拉刷新");
        //使用GCD开启一个线程，使圈圈转2秒
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [blockSelf.waterView loadNextPage:arrayImage];
            [blockSelf.waterView.infiniteScrollingView stopAnimating];
        });
    }];
    //添加下拉刷新
    [self.waterView addPullToRefreshWithActionHandler:^{
        NSLog(@"下拉更新");
        //使用GCD开启一个线程，使圈圈转2秒
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [blockSelf.waterView refreshView:arrayImage];
            [blockSelf.waterView.pullToRefreshView stopAnimating];
        });
    }];
    [self.view addSubview:self.waterView];
    
	// Do any additional setup after loading the view, typically from a nib.
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
