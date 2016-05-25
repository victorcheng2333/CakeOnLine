//
//  SignOutView.h
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SignOutView;

@protocol SignOutViewDelegate <NSObject>
- (void)signOutViewClose;

@end

@interface SignOutView : UIView
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;
@property (nonatomic, weak) id<SignOutViewDelegate>delegate;
@property (nonatomic, strong) UIView *backView;
@end
