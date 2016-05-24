//
//  CakeMallVC.m
//  CakeOnLine
//
//  Created by ChengFei on 16/5/18.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "CakeMallVC.h"
#import "MallTwoCell.h"
#import "MallThreeCell.h"
#import "CakeDetailVC.h"
#import "CakeTableVC.h"
@interface CakeMallVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CakeMallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MallOne"];
        return cell;
    } else if (indexPath.row == 1){
        MallTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MallTwo"];
        return cell;
    } else {
        MallThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MallThree"];
        NSString *imageName = @"";
        switch (indexPath.row) {
            case 2:
                imageName = @"列表-2";
                break;
            case 3:
                imageName = @"列表-3";
                break;
            case 4:
                imageName = @"列表-4";
                break;
            default:
                break;
        }
        cell.imgView.image = [UIImage imageNamed:imageName];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"不莱梅漫想曲";
            break;
        case 2:
            identifier = @"金牌拿破仑";
            break;
        case 3:
            identifier = @"和风抹茶栗子";
            break;
        case 4:
            identifier = @"极地牛乳";
            break;
        default:
            break;
    }
    if (identifier.length > 0) {
        CakeDetailVC *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CakeDetailVC"];
        detailVC.identifier = identifier;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
   
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 230;
    } else if (indexPath.row == 2) {
        return 183;
    } else {
        return 170;
    }
}

#pragma mark 点击事件
- (IBAction)chocolateBtnClicked:(id)sender {
    NSString *type = @"舞动巧克力";
    NSArray *cakesArray = @[@"慕尼黑巧克力", @"巧克力石板街", @"松露巧克力"];
    [self goToTableVCWithIype:type cakesArray:cakesArray];
}
- (IBAction)cheeseBtnClicked:(id)sender {
    NSString *type = @"浓情芝士";
    NSArray *cakesArray = @[@"莱茵河莓妖精", @"极地牛乳", @"奥利奥雪域"];
    [self goToTableVCWithIype:type cakesArray:cakesArray];
}
- (IBAction)fruitBtnClicked:(id)sender {
    NSString *type = @"果味缤纷";
    NSArray *cakesArray = @[@"么么哒香芒", @"蓝妃儿"];
    [self goToTableVCWithIype:type cakesArray:cakesArray];
}
- (IBAction)milkBtnClicked:(id)sender {
    NSString *type = @"醇香奶油";
    NSArray *cakesArray = @[@"情定爱情海"];
    [self goToTableVCWithIype:type cakesArray:cakesArray];
}

- (void)goToTableVCWithIype:(NSString *)cakeType cakesArray:(NSArray *)cakesArray {
    CakeTableVC *tableVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CakeTableVC"];
    tableVC.cakeType = cakeType;
    tableVC.cakesArray = cakesArray;
    [self.navigationController pushViewController:tableVC animated:YES];
    
}


@end
