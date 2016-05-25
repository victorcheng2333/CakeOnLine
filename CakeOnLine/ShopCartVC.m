//
//  ShopCartVC.m
//  CakeOnLine
//
//  Created by ChengFei on 16/5/18.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "ShopCartVC.h"

@interface ShopCartVC ()
@property (weak, nonatomic) IBOutlet UILabel *addLabel;

@end

@implementation ShopCartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的购物车";
    self.addLabel.layer.cornerRadius = 4;
    self.addLabel.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
