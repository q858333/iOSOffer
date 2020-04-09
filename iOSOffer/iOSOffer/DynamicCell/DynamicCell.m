//
//  DynamicCell.m
//  iOSOffer
//
//  Created by dengbinOld on 2020/4/9.
//  Copyright © 2020 dengsir. All rights reserved.
//

#import "DynamicCell.h"
@interface DynamicCell ()
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *label;

@end

@implementation DynamicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //取消cell点击的效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, MinCellHeight)];
        [self.contentView addSubview:self.imageV];

        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,MinCellHeight)];
        self.label.numberOfLines = 0;
        self.label.font = [UIFont systemFontOfSize:FontSize];
        self.label.textAlignment =  NSTextAlignmentCenter;
        [self.contentView addSubview:self.label];
        self.label.text = @"改变字体大小";
        
        //添加点击方法
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.imageV addGestureRecognizer:tapG];
        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)cellImageName:(NSString *)name text:(NSString *)text
{
    self.imageV.image = [UIImage imageNamed:name];
    self.label.text = text;
}

- (void)cellOffsetOnTabelView:(UIScrollView *)tabelView{
    CGFloat offsetY = self.frame.origin.y- tabelView.contentOffset.y;

    if(self.frame.origin.y > tabelView.contentOffset.y && offsetY < 50){
        //cell距离屏幕距离
        CGFloat sca = 50 - offsetY;
        
        self.imageV.frame = CGRectMake(0, -sca, CGRectGetWidth(self.frame), MinCellHeight+sca);
        [[self superview] bringSubviewToFront:self];

//        self.label.frame = CGRectMake(0, CGRectGetMinY(self.imageV.frame)-offsetY, CGRectGetWidth(self.frame), MinCellHeight+offsetY);
        self.label.font = [UIFont systemFontOfSize:FontSize * (1-sca/50)];
        

    }else if (self.frame.origin.y < tabelView.contentOffset.y && offsetY < 50){
        //cell超出屏幕
        
    }else{
        
    }
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
