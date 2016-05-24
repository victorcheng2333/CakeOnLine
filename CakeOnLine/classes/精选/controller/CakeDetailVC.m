//
//  CakeDetailVC.m
//  CakeOnLine
//
//  Created by fei on 16/5/20.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "CakeDetailVC.h"
#import "DetailView.h"
@interface CakeDetailVC ()<DetailViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) DetailView *detailView;
@end

@implementation CakeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    NSArray  *cakesArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"cakesArray"];
    for (NSDictionary *dict in cakesArray) {
        NSString *identifier =dict[@"identifier"];
        if ([identifier isEqualToString:_identifier]) {
            self.titleImageName = dict[@"titleImageName"];
            self.detailImageName = dict[@"detailImageName"];
            self.descriptionImageName = dict[@"descriptionImageName"];
        }
    }
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.titleImageName]];
    self.navigationItem.titleView = titleImageView;
    
    UIImage *detailImage = [UIImage imageNamed:self.detailImageName];
    CGFloat height = detailImage.size.height;
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, height);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, height)];
    imageView.image = detailImage;
    
    [self.scrollView addSubview:imageView];

}


- (IBAction)detailBtnClicked:(id)sender {
    _detailView= [[DetailView alloc] initWithFrame:[UIScreen mainScreen].bounds imageName:_descriptionImageName];
    _detailView.hidden = NO;
    _detailView.delegate = self;
    [self.view addSubview:_detailView];
    _detailView.alpha = 0;
    
    [UIView animateWithDuration:0.6 animations:^{
        _detailView.alpha = 1;
    }];
}

- (void)detailViewClose {
    
    [UIView animateWithDuration:0.6 animations:^{
        _detailView.alpha = 0;
    } completion:^(BOOL finished) {
        _detailView.hidden = YES;
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
