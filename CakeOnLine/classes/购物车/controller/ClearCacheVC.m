//
//  ClearCacheVC.m
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "ClearCacheVC.h"
#import "MBProgressHUD.h"
@interface ClearCacheVC ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ClearCacheVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"清除缓存";
    
    NSString *str1 = @"共有缓存文件";
    NSString *str2 = @" 24M";
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", str1, str2]];
    [attributeStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(str1.length, str2.length)];
    self.label.attributedText = attributeStr;
    
    self.clearBtn.layer.cornerRadius = 4;
    self.clearBtn.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearBtnClicked:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    int64_t delayInSeconds = 2.0;
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.clearBtn.hidden = YES;
        self.label.text = @"清除完成";
        self.imageView.image = [UIImage imageNamed:@"清除缓存_完成"];
    });
}

@end
