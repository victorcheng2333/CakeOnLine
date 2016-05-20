//
//  CakeDetailVC.m
//  CakeOnLine
//
//  Created by fei on 16/5/20.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "CakeDetailVC.h"

@interface CakeDetailVC ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation CakeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.titleImageName = @"产品详情-奥利奥雪域牛乳芝士-3";
    self.detailImageName = @"产品详情-奥利奥雪域牛乳芝士-2";
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.titleImageName]];
    self.navigationItem.titleView = titleImageView;
    
    
    UIImage *detailImage = [UIImage imageNamed:self.detailImageName];
    CGFloat height = detailImage.size.height;
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, height);
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, height)];
    imageView.image = detailImage;
    
    [self.scrollView addSubview:imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
