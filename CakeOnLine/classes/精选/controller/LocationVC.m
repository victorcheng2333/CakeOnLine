//
//  LocationVC.m
//  CakeOnLine
//
//  Created by fei on 16/5/24.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "LocationVC.h"

@interface LocationVC ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LocationVC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[@"当前GPS定位城市", @"上海", @"其他可选城市", @""@"上海", @"苏州", @"杭州", @"宁波", @"无锡", @"南京", @"北京", @"天津"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    if (indexPath.row == 0 || indexPath.row == 2) {
        cell.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
    } else {
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 2) {
        return 45.0;
    } else {
        return 38;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > 2 ) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
