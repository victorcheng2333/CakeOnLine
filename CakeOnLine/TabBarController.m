//
//  TabBarController.m
//  CakeOnLine
//
//  Created by fei on 16/5/18.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "TabBarController.h"
#import "Config.h"
#import "RecommendVC.h"
#import "CakeMallVC.h"
#import "ShopCartVC.h"
#import "UserInfoVC.h"
@interface TabBarController ()

@end

@implementation TabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    RecommendVC *recommendVC = [sb instantiateViewControllerWithIdentifier:@"RecommendVC"];
    [self setupChildVc:recommendVC title:@"精选" image:@"recommend_unselect" selectedImage:@"recommend_select"];
    
    CakeMallVC *mallVC = [sb instantiateViewControllerWithIdentifier:@"CakeMallVC"];
    [self setupChildVc:mallVC title:@"蛋糕商城" image:@"mall_unselect" selectedImage:@"mall_select"];
    
    UserInfoVC *userVC = [sb instantiateViewControllerWithIdentifier:@"UserInfoVC"];
    [self setupChildVc:userVC title:@"我的" image:@"mine_unselect" selectedImage:@"mine_select"];
    
    ShopCartVC *cartVC = [sb instantiateViewControllerWithIdentifier:@"ShopCartVC"];
    [self setupChildVc:cartVC title:@"购物车" image:@"shopCart_unselect" selectedImage:@"shopCart_select"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
//    vc.navigationItem.title = @"全媒体采访系统";
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式 (选中以及未选中时的颜色)
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = COLOR_8b5f25;
    [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = COLOR_282119;
    [vc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


@end
