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
#import "CakeDetailVC.h"
#import "CakeModel.h"
@interface RecommendVC () <UITableViewDelegate, UITableViewDataSource, TypeThreeCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *typeTwoArray;
@property (nonatomic, strong) NSArray *cakesArray;
@property (nonatomic, strong) NSMutableArray *cakesModelArray;
@end

@implementation RecommendVC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self initCakesArray];
    _typeTwoArray = @[@{@"title":@"0元免费领",@"image":@"冬日暖心",@"alias":@"Free to Receive"},
                      @{@"title":@"每月钜惠",@"image":@"极地牛乳",@"alias":@"Preferential Storm"}];
    
}


- (void)initCakesArray {
    _cakesArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"cakesArray"];
    if (_cakesArray == nil) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        NSArray *identifierArray = @[@"松露巧克力", @"莱茵河莓妖精", @"不莱梅漫想曲", @"香草泡芙",@"么么哒香芒",@"和风抹茶栗子",@"奥利奥雪域",@"巧克力石板街",@"情定爱情海",@"慕尼黑巧克力",@"极地牛乳",@"蓝妃儿",@"金牌拿破仑"];
        for (NSString *identifier in identifierArray) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:identifier forKey:@"identifier"];
            [dict setValue:[NSString stringWithFormat:@"产品详情-%@-3",identifier] forKey:@"titleImageName"];
            [dict setValue:[NSString stringWithFormat:@"产品详情-%@-2",identifier] forKey:@"detailImageName"];
            [dict setValue:[NSString stringWithFormat:@"产品详情-%@-1",identifier] forKey:@"descriptionImageName"];
            [mutableArray addObject:dict];
        }
        _cakesArray = [mutableArray copy];
        [[NSUserDefaults standardUserDefaults] setObject:_cakesArray forKey:@"cakesArray"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    _cakesModelArray = [NSMutableArray array];
    for (NSDictionary *dict in _cakesArray) {
        CakeModel *model = [[CakeModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
    }
    
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
        cell.delegate = self;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 335.0;
    } else if(indexPath.row < 3) {
       return 170.0;
    } else {
        return 265.0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 3) {
        NSString *identifier = @"";
        switch (indexPath.row) {
            case 0:
                identifier = @"奥利奥雪域";
                break;
            case 1:
                identifier = @"香草泡芙";
                break;
            case 2:
                identifier = @"极地牛乳";
                break;
            default:
                break;
        }
        CakeDetailVC *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CakeDetailVC"];
        detailVC.identifier = identifier;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

#pragma mark ---view代理
- (void)typeThreeCellDelegateRightBtnClicked {
    NSString *identifier = @"金牌拿破仑";
    CakeDetailVC *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CakeDetailVC"];
    detailVC.identifier = identifier;
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
