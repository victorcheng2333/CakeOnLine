//
//  RecommendVC.m
//  CakeOnLine
//
//  Created by ChengFei on 16/5/18.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "RecommendVC.h"
#import "TypeOneCell.h"
#import "TypeTwoCell.h"
#import "TypeThreeCell.h"
@interface RecommendVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonnull, strong) NSArray *typeTwoArray;
@end

@implementation RecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    _typeTwoArray = @[@{@"title":@"0元免费领",@"image":@"冬日暖心",@"alias":@"Free to Receive"},
                      @{@"title":@"每月钜惠",@"image":@"极地牛乳",@"alias":@"Preferential Storm"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TypeOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeOneCell"];
        return cell;
    }else if(indexPath.row < 3) {
        TypeTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeTwoCell"];
        NSDictionary *dict = _typeTwoArray[indexPath.row-1];
        cell.headLabel.text = dict[@"title"];
        cell.aliasLabel.text = dict[@"alias"];
        cell.imgView.image = [UIImage imageNamed:dict[@"image"]];
        return cell;
    } else {
        TypeThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeThreeCell"];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 335.0;
    } else if(indexPath.row < 3) {
       return 170.0;
    } else {
        return 369.0;
    }
}


@end
