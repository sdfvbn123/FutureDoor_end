//
//  DetailViewController.m
//  Future_Door
//
//  Created by apple on 14-4-24.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 310)];
    NSArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    NSString *oldtext = [array objectAtIndex:self.index];
    self.textView.text = oldtext;
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(save)];
    UIBarButtonItem *delBtn = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStyleBordered target:self action:@selector(delete)];
    NSArray *btnArray = [NSArray arrayWithObjects:saveBtn,delBtn, nil];
    self.navigationItem.rightBarButtonItems = btnArray;
    [self.textView becomeFirstResponder];
    [self.view addSubview:self.textView];
    
}
-(void)save{
    NSArray *tempArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    NSMutableArray *mutableArray = [tempArray mutableCopy];
    NSString *textStr = [self.textView text];
    [mutableArray removeObjectAtIndex:self.index];
    [mutableArray insertObject:textStr atIndex:0];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.noteArray = mutableArray;
    [[NSUserDefaults standardUserDefaults]setObject:mutableArray forKey:@"note"];
    
    
    NSArray *tempDateArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    NSMutableArray *mutableDateArray = [tempDateArray mutableCopy];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm"];
    NSDate  *now = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:now];    [mutableDateArray removeObjectAtIndex:self.index];
    [mutableDateArray insertObject:dateStr atIndex:0];
    secondVC.dateArray = mutableDateArray;
    [[NSUserDefaults standardUserDefaults]setObject:mutableDateArray forKey:@"date"];
    
    [self.textView resignFirstResponder];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    alert.tag = 101;
    [alert show];
}
-(void)delete{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"你确定要删除吗？" delegate:self cancelButtonTitle:@"YES" otherButtonTitles: @"NO",nil];
    alert.tag = 100;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 100) {
        if (buttonIndex == 0) {
            NSArray *tempArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
            NSMutableArray *mutableArray = [tempArray mutableCopy];
            [mutableArray removeObjectAtIndex:self.index];
            SecondViewController *secondVC = [[SecondViewController alloc] init];
            secondVC.noteArray = mutableArray;
            [[NSUserDefaults standardUserDefaults]setObject:mutableArray forKey:@"note"];
            
            NSArray *tempDateArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
            NSMutableArray *mutableDateArray = [tempDateArray mutableCopy];
            [mutableDateArray removeObjectAtIndex:self.index];
            secondVC.dateArray = mutableDateArray;
            [[NSUserDefaults standardUserDefaults]setObject:mutableDateArray forKey:@"date"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else if (buttonIndex == 1){
            return;
        }
    }else{
        [self.navigationController popViewControllerAnimated:YES];
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
