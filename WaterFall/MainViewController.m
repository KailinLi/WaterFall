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
#import "Data.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MainViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.DataArray = [NSMutableArray arrayWithCapacity:10];
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"];
    NSMutableDictionary *plistData = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    for (NSString *key in plistData) {
        Data *newData = [Data new];
        NSDictionary *index = [plistData objectForKey:key];
        [newData setTitle:[index objectForKey:@"title"]];
        [newData setDetail:[index objectForKey:@"detail"]];
        [newData setPrice:[index objectForKey:@"price"]];
        [newData setHadSaled:[index objectForKey:@"hadSaled"]];
        [newData setDistance:[index objectForKey:@"distance"]];
        [newData setImageName:[index objectForKey:@"imageName"]];
        [self.DataArray addObject:newData];
    }

    
    CGSize size = [self.view bounds].size;
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, size.width, size.height - 20) style:UITableViewStylePlain];
    [self.view addSubview:self.table];
    self.table.tag = 1;
    self.table.dataSource = self;
    self.table.delegate = self;
    //self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cellIdentify";
    static NSString *showIdentify = @"show";
    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    DemoTableViewCell *cellDemo = [tableView dequeueReusableCellWithIdentifier:showIdentify];
    
    if (indexPath.row % 2 == 0) {
        if (cell == nil) {
            cell = [[ShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        }
        
        cell.data = [Data new];
        [cell.data setTitle:[[self.DataArray objectAtIndex:indexPath.row] title]];
        [cell.data setDetail:[[self.DataArray objectAtIndex:indexPath.row] detail]];
        [cell.data setPrice:[[self.DataArray objectAtIndex:indexPath.row] price]];
        [cell.data setHadSaled:[[self.DataArray objectAtIndex:indexPath.row] hadSaled]];
        [cell.data setDistance:[[self.DataArray objectAtIndex:indexPath.row] distance]];
        [cell.data setImageName:[[self.DataArray objectAtIndex:indexPath.row] imageName]];
        
        return cell;
    }

    else {
        if (cellDemo == nil) {
            cellDemo = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showIdentify];
        }
        
        cellDemo.data = [Data new];
        [cellDemo.data setTitle:[[self.DataArray objectAtIndex:indexPath.row] title]];
        [cellDemo.data setDetail:[[self.DataArray objectAtIndex:indexPath.row] detail]];
        [cellDemo.data setPrice:[[self.DataArray objectAtIndex:indexPath.row] price]];
        [cellDemo.data setHadSaled:[[self.DataArray objectAtIndex:indexPath.row] hadSaled]];
        [cellDemo.data setDistance:[[self.DataArray objectAtIndex:indexPath.row] distance]];
        [cellDemo.data setImageName:[[self.DataArray objectAtIndex:indexPath.row] imageName]];
        
        return cellDemo;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        return 120;
    }
    return 60;
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
