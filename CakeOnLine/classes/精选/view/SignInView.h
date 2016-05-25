//
//  SignInView.h
//  CakeOnLine
//
//  Created by fei on 16/5/25.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SignInView;
@protocol SignInViewDelegate <NSObject>
- (void)signInViewDelegateClose;
@end

@interface SignInView : UIView
@property (nonatomic, weak) id<SignInViewDelegate>delegate;
@end
