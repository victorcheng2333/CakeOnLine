//
//  VCWithImageView.m
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "VCWithImageView.h"

@interface VCWithImageView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation VCWithImageView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _titleString;
    self.imageView.image = [UIImage imageNamed:_imageName];
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
