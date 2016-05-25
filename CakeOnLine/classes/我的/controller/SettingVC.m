//
//  SettingVC.m
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "SettingVC.h"
#import "VCWithImageView.h"
#import "ClearCacheVC.h"
@interface SettingVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    _titleArray = @[@"清除缓存", @"意见反馈", @"分享贝思客"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"];
    if (indexPath.section == 0) {
        cell.textLabel.text = _titleArray[indexPath.row];
    } else {
        cell.textLabel.text = _titleArray[2];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 5.0;
    } else {
        return 0.1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        ClearCacheVC *clearCacheVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ClearCacheVC"];
        [self.navigationController pushViewController:clearCacheVC animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        VCWithImageView *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"VCWithImageView"];
            vc.titleString = @"意见反馈";
            vc.imageName = @"意见反馈";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        VCWithImageView *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"VCWithImageView"];
        vc.titleString = @"分享贝思客";
        vc.imageName = @"分享贝思客";
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
