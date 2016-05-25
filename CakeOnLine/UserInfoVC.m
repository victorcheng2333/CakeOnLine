//
//  UserInfoVC.m
//  CakeOnLine
//
//  Created by ChengFei on 16/5/18.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "UserInfoVC.h"
#import "SettingVC.h"
#import "VCWithImageView.h"
@interface UserInfoVC ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@end

@implementation UserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI {
    self.title = @"我的账户";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"setting"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(gotoSettingVC)];
    self.navigationItem.rightBarButtonItem = rightItem;
    _button1.titleLabel.numberOfLines = 2;
    [_button1 setTitle:@" 0个 \n积分" forState:UIControlStateNormal];
    _button2.titleLabel.numberOfLines = 2;
    [_button2 setTitle:@"  3张 \n兑换券" forState:UIControlStateNormal];
    _button3.titleLabel.numberOfLines = 2;
    [_button3 setTitle:@"  1个 \n优惠券" forState:UIControlStateNormal];
}

- (void)gotoSettingVC {
    SettingVC *settingVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingVC"];
    [self.navigationController pushViewController:settingVC animated:YES];
}
- (IBAction)couponBtnClicked:(id)sender {
    VCWithImageView *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"VCWithImageView"];
    vc.titleString = @"我的兑换券";
    vc.imageName = @"我的兑换券";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
