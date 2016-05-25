//
//  SignOutView.m
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "SignOutView.h"

@implementation SignOutView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    if (self = [super initWithFrame:frame]) {
        //添加背景
        _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backView.userInteractionEnabled = YES;
        _backView.alpha = 0.4;
        _backView.backgroundColor = [UIColor blackColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_backView addGestureRecognizer:tap];
        [self addSubview:_backView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
    }
    return self;
}

- (void)close {
    if ([self.delegate respondsToSelector:@selector(signOutViewClose)]) {
        [self.delegate signOutViewClose];
    }
}


@end
