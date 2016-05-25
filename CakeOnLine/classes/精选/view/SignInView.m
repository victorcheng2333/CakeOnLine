//
//  SignInView.m
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "SignInView.h"

@interface SignInView()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, assign) BOOL haveSigned;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation SignInView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _haveSigned = NO;
        //添加背景
        _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backView.userInteractionEnabled = YES;
        _backView.alpha = 0.4;
        _backView.backgroundColor = [UIColor blackColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_backView addGestureRecognizer:tap];
        [self addSubview:_backView];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (frame.size.height-573)/2, frame.size.width-20, 573)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:@"签到_1"];
        [self addSubview:_imageView];
        
    }
    return self;
}

- (void)close {
    if (_haveSigned) {
        if ([self.delegate respondsToSelector:@selector(signInViewDelegateClose)]) {
            [self.delegate signInViewDelegateClose];
        }
    }
    
    if (_haveSigned == NO) {
        _haveSigned = YES;
        _imageView.image = [UIImage imageNamed:@"签到_2"];
    }
}

@end
