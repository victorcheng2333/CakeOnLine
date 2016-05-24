//
//  DetailView.h
//  CakeOnLine
//
//  Created by fei on 16/5/24.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailView;

@protocol  DetailViewDelegate<NSObject>
- (void)detailViewClose;
@end

@interface DetailView : UIView
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;
@property (nonatomic, weak) id<DetailViewDelegate>delegate;
@end
