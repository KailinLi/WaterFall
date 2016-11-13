//
//  MainViewController.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/10.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "MainViewController.h"
#import "ShowTableViewCell.h"
#import "DemoTableViewCell.h"
#import "ADTableViewCell.h"
#import "ChooseTableViewCell.h"
#import "Data.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end

@implementation MainViewController {
    
    NSMutableArray *iconTitle;
    NSMutableArray *iconImage;
    
    NSMutableArray *ADTitle;
    NSMutableArray *ADDetail;
    
    NSMutableArray *ChooseTitle;
    NSMutableArray *ChooseDetail;
    NSMutableArray *ChooseImage;
    NSMutableArray *searchData;
    UISearchBar *searchBar;
    
    BOOL isSearch;
    
}

- (void) setSearchBar {
    
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:0/255 green:201/255 blue:177/255 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 30)];
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    
    [titleView setBackgroundColor:color];
    
    searchBar = [[UISearchBar alloc] init];
    
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, 240, 30);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 15;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    searchBar.placeholder = @"搜索商家、品类或商圈";
    searchBar.showsCancelButton = NO;
    searchBar.delegate = self;
    [titleView addSubview:searchBar];
    
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc] initWithTitle:@"武汉" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = locationButton;
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = searchButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.navigationItem.titleView
    [self arrayInit];
    
    [self loadPlist];
    
    [self setSearchBar];
    
    
    
    CGSize size = [self.view bounds].size;
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, size.width, size.height - 20) style:UITableViewStylePlain];
    [self.view addSubview:self.table];
    self.table.tag = 1;
    self.table.dataSource = self;
    self.table.delegate = self;
    
    self.table.refreshControl = [[UIRefreshControl alloc]init];
    self.table.tintColor = [UIColor grayColor];
    self.table.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉加载更多"];
    [self.table.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    //self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count + 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cellIdentify";
    static NSString *showIdentify = @"show";
    static NSString *ADIdentify = @"AD";
    static NSString *chooseIdentify = @"Choose";
    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    DemoTableViewCell *cellDemo = [tableView dequeueReusableCellWithIdentifier:showIdentify];
    ADTableViewCell *cellAD = [tableView dequeueReusableCellWithIdentifier:ADIdentify];
    ChooseTableViewCell *cellChoose = [tableView dequeueReusableCellWithIdentifier:chooseIdentify];
    
    if (indexPath.row > 2) {
        if (cell == nil) {
            cell = [[ShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        }
        
        cell.data = [Data new];
        [cell.data setTitle:[[self.DataArray objectAtIndex:indexPath.row - 3] title]];
        [cell.data setDetail:[[self.DataArray objectAtIndex:indexPath.row - 3] detail]];
        [cell.data setPrice:[[self.DataArray objectAtIndex:indexPath.row - 3] price]];
        [cell.data setHadSaled:[[self.DataArray objectAtIndex:indexPath.row - 3] hadSaled]];
        [cell.data setDistance:[[self.DataArray objectAtIndex:indexPath.row - 3] distance]];
        [cell.data setImageName:[[self.DataArray objectAtIndex:indexPath.row - 3] imageName]];
        
        return cell;
    }

    else if (indexPath.row == 0) {
        if (cellDemo == nil) {
            cellDemo = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showIdentify];
        }
        
        for (NSUInteger index = 0; index < iconTitle.count; index++) {
            cellDemo.titleData = iconTitle;
            cellDemo.imageData = iconImage;
        }
        
        return cellDemo;
    }
    
    else if (indexPath.row == 1) {
        
        if (cellAD == nil) {
            cellAD = [[ADTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ADIdentify];
        }
        
        for (NSUInteger index = 0; index < ADTitle.count; index++) {
            cellAD.titleData = ADTitle;
            cellAD.detailData = ADDetail;
        }
        
        return cellAD;
        
    }
    else if (indexPath.row == 2) {
        
        if (cellChoose == nil) {
            cellChoose = [[ChooseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chooseIdentify];
        }
        
        for (NSUInteger index = 0; index < ChooseTitle.count; index++) {
            cellChoose.titleData = ChooseTitle;
            cellChoose.detailData = ChooseDetail;
            cellChoose.imageData = ChooseImage;
        }
        
        return cellChoose;
        
    }
    return cellChoose;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 120;
    }
    else if (indexPath.row == 1) {
        return 40;
    }
    else if (indexPath.row == 2) {
        return 140;
    }
    return 70;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 3) {
        return nil;
    }
    else
        return indexPath;
}
//- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path

- (void) arrayInit {
    self.DataArray = [NSMutableArray arrayWithCapacity:10];
    iconTitle = [NSMutableArray arrayWithCapacity:10];
    iconImage = [NSMutableArray arrayWithCapacity:10];
    ADDetail = [NSMutableArray arrayWithCapacity:10];
    ADTitle = [NSMutableArray arrayWithCapacity:10];
    ChooseTitle = [NSMutableArray arrayWithCapacity:10];
    ChooseDetail = [NSMutableArray arrayWithCapacity:10];
    ChooseImage = [NSMutableArray arrayWithCapacity:10];
}


- (void) loadPlist {
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"];
    NSMutableDictionary *plistData = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    for (NSString *key in plistData) {
        if ([key  isEqual: @"Demo"]) {
            NSDictionary *data = [plistData objectForKey:key];
            for (NSString *index in data) {
                NSDictionary *iconData = [data objectForKey:index];
                [iconTitle addObject:[iconData objectForKey:@"title"]];
                [iconImage addObject:[iconData objectForKey:@"image"]];
            }
        }
        if ([key isEqual: @"Show"]) {
            NSDictionary *data = [plistData objectForKey:key];
            for (NSString *search in data) {
                Data *newData = [Data new];
                NSDictionary *index = [data objectForKey:search];
                [newData setTitle:[index objectForKey:@"title"]];
                [newData setDetail:[index objectForKey:@"detail"]];
                [newData setPrice:[index objectForKey:@"price"]];
                [newData setHadSaled:[index objectForKey:@"hadSaled"]];
                [newData setDistance:[index objectForKey:@"distance"]];
                [newData setImageName:[index objectForKey:@"imageName"]];
                [self.DataArray addObject:newData];
            }
        }
        if ([key  isEqual: @"AD"]) {
            NSDictionary *data = [plistData objectForKey:key];
            for (NSString *index in data) {
                NSDictionary *ADData = [data objectForKey:index];
                [ADTitle addObject:[ADData objectForKey:@"title"]];
                [ADDetail addObject:[ADData objectForKey:@"detail"]];
            }
        }
        if ([key  isEqual: @"Choose"]) {
            NSDictionary *data = [plistData objectForKey:key];
            for (NSString *index in data) {
                NSDictionary *AddData = [data objectForKey:index];
                [ChooseTitle addObject:[AddData objectForKey:@"title"]];
                [ChooseDetail addObject:[AddData objectForKey:@"detail"]];
                [ChooseImage addObject:[AddData objectForKey:@"image"]];
            }
        }
    }
}


//- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    isSearch = NO;
//    [self->searchBar resignFirstResponder];
//    [self.table reloadData];
//}
//
//-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    [self filterBySubstring: searchText];
//}
//
//- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    [self filterBySubstring: self->searchBar.text];
//    [self->searchBar resignFirstResponder];
//}
//- (void) searchBarTextDidEndEditing:(UISearchBar *)searchBar {
//    [self->searchBar resignFirstResponder];
//}
//
//- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    if (![self.view isExclusiveTouch]) {
//        [self->searchBar resignFirstResponder];
//    }
//}
//- (void) filterBySubstring: (NSString*) subStr {
//    isSearch = YES;
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", subStr];
//    searchData = [iconTitle filteredArrayUsingPredicate:pred];
//    [self.table reloadData];
//}

- (void) cancel {
    [self->searchBar resignFirstResponder];
}

- (void) refreshData {
    [self performSelector:@selector(addMoreData) withObject:nil afterDelay:2];
}

- (void)addMoreData {
    self.table.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新..."];
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"];
    NSMutableDictionary *plistData = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    for (NSString *key in plistData) {
        if ([key isEqual: @"Show"]) {
            NSDictionary *data = [plistData objectForKey:key];
            for (NSString *search in data) {
                Data *newData = [Data new];
                NSDictionary *index = [data objectForKey:search];
                [newData setTitle:[index objectForKey:@"title"]];
                [newData setDetail:[index objectForKey:@"detail"]];
                [newData setPrice:[index objectForKey:@"price"]];
                [newData setHadSaled:[index objectForKey:@"hadSaled"]];
                [newData setDistance:[index objectForKey:@"distance"]];
                [newData setImageName:[index objectForKey:@"imageName"]];
                [self.DataArray addObject:newData];
            }
        }
    }
    self.table.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新..."];
    [self.table.refreshControl endRefreshing];
    [self.table reloadData];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
