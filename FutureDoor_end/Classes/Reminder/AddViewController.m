//
//  AddViewController.m
//  Future_Door
//
//  Created by apple on 14-4-24.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

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
    [self.view addSubview:self.textView];
    [self.textView becomeFirstResponder];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(addNote)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)addNote{
    NSMutableArray *initNoteArray = [NSMutableArray new];
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"note"] == nil) {
        [[NSUserDefaults standardUserDefaults]setObject:initNoteArray forKey:@"note"];
    }
    NSArray *tempNoteArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    NSMutableArray *mutableArray = [tempNoteArray mutableCopy];
    NSString *textStr = [self.textView text];
    [mutableArray insertObject:textStr atIndex:0];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.noteArray = mutableArray;
    [[NSUserDefaults standardUserDefaults]setObject:mutableArray forKey:@"note"];
    //--------------------------------------------------
    NSMutableArray *initDateArray = [NSMutableArray new];
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"date"] == nil) {
        [[NSUserDefaults standardUserDefaults]setObject:initDateArray forKey:@"date"];
    }
    NSArray *tempDateArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    NSMutableArray *mutableDateArray = [tempDateArray mutableCopy];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm"];
    NSDate *now = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:now];
    [mutableDateArray insertObject:dateStr atIndex:0];
    
    secondVC.dateArray = mutableDateArray;
    [[NSUserDefaults standardUserDefaults]setObject:mutableDateArray forKey:@"date"];
    
    
    [self.textView resignFirstResponder];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
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
