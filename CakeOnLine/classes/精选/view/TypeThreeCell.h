//
//  TypeThreeCell.h
//  CakeOnLine
//
//  Created by fei on 16/5/19.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TypeThreeCell;
@protocol TypeThreeCellDelegate <NSObject>
@optional
- (void)typeThreeCellDelegateLeftBtnClicked;
- (void)typeThreeCellDelegateRightBtnClicked;
@end

@interface TypeThreeCell : UITableViewCell
@property (nonatomic, weak) id<TypeThreeCellDelegate> delegate;
@end
