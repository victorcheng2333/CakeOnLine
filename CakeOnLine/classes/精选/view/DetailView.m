//
//  DetailView.m
//  CakeOnLine
//
//  Created by fei on 16/5/24.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "DetailView.h"

@interface DetailView()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *closeBtn;
@end

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    if (self = [super initWithFrame:frame]) {
        //添加背景
        _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backView.userInteractionEnabled = YES;
        _backView.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_backView addGestureRecognizer:tap];
        [self addSubview:_backView];
        
        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imageBtn.frame = CGRectMake(10, (frame.size.height-64-432)/2, frame.size.width-20, 432);
        [imageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [imageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        [_backView addSubview:imageBtn];
        
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeBtn.frame = CGRectMake(imageBtn.frame.size.width-40, 0, 40, 40);
        [_closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_closeBtn setSelected:NO];
        [_closeBtn setImage:[UIImage imageNamed:@"closeIcon"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [imageBtn addSubview:_closeBtn];
    }
    return self;
}

- (void)close {
    if ([self.delegate respondsToSelector:@selector(detailViewClose)]) {
        [self.delegate detailViewClose];
    }
}

@end
