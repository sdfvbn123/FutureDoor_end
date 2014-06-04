//
//  SecondViewController.m
//  Future_Door
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"日程提醒";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.noteArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    self.dateArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.noteArray = [NSMutableArray new];
    self.dateArray = [NSMutableArray new];
    [self createControl];
}
-(void)createControl{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"新建" style:UIBarButtonItemStyleBordered target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    //self.navigationItem.title = @"提醒事项";
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 44)];
    self.displayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    self.displayController.searchResultsDataSource = self;
    self.displayController.searchResultsDelegate = self;
    self.displayController.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
}
-(void)add{
    AddViewController *addVC = [[AddViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredArray count];
    }
    else{
        return [self.noteArray count];
    };
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *noteStr = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        noteStr = [self.filteredArray objectAtIndex:indexPath.row];
    }else if (tableView == self.tableView){
        noteStr = [self.noteArray objectAtIndex:indexPath.row];
    }
    NSString *dateStr = [self.dateArray objectAtIndex:indexPath.row];
    NSUInteger charnum = noteStr.length;
    if (charnum < 22) {
        cell.textLabel.text = noteStr;
    }else{
        cell.textLabel.text = [[noteStr substringToIndex:18]stringByAppendingString:@"..."];
        
    }
    cell.detailTextLabel.text = dateStr;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    // Configure the cell...
    
    return cell;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    NSUInteger row = indexPath.row;
    detailVC.index = row;
    
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self.filteredArray removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",searchString];
    NSArray *tempArray = [self.noteArray filteredArrayUsingPredicate:predicate];
    self.filteredArray  = [NSMutableArray arrayWithArray:tempArray];
    
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
