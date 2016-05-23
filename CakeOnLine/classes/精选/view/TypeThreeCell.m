//
//  TypeThreeCell.m
//  CakeOnLine
//
//  Created by fei on 16/5/19.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "TypeThreeCell.h"

@implementation TypeThreeCell

- (IBAction)leftBtnClicked:(id)sender {
}

- (IBAction)rightBtnClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(typeThreeCellDelegateRightBtnClicked)]) {
        [self.delegate typeThreeCellDelegateRightBtnClicked];
    }
}

@end
