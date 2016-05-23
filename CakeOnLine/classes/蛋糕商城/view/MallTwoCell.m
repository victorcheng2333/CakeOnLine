//
//  MallTwoCell.m
//  CakeOnLine
//
//  Created by fei on 16/5/23.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import "MallTwoCell.h"

@implementation MallTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.categotyBackView.layer.cornerRadius = 5;
    self.categotyBackView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
