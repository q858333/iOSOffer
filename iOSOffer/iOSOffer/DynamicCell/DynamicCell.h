//
//  DynamicCell.h
//  iOSOffer
//
//  Created by dengbinOld on 2020/4/9.
//  Copyright © 2020 dengsir. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MaxCellHeight 230

#define MinCellHeight 150

#define FontSize 16

NS_ASSUME_NONNULL_BEGIN

@interface DynamicCell : UITableViewCell
- (void)cellImageName:(NSString *)name text:(NSString *)text;
- (void)cellOffsetOnTabelView:(UIScrollView *)tabelView;

@end

NS_ASSUME_NONNULL_END
