//
//  CustomCollectionViewCell.m
//  SelfSizingTest
//
//  Created by 亚珂王 on 16/7/25.
//  Copyright © 2016年 亚珂王. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import <Masonry.h>

@interface CustomCollectionViewCell()

@property (nonatomic, copy) NSString * contentText;

@end
@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews
{
    UILabel * contentLabel = [UILabel new];
    [self.contentView addSubview:contentLabel];
    
    UILabel * titleLabel = [UILabel new];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    self.titleLabel = titleLabel;

    self.contentView.backgroundColor = [UIColor redColor];
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.font = [UIFont systemFontOfSize:15.0];
    contentLabel.numberOfLines = 0;
    contentLabel.backgroundColor = [UIColor greenColor];
    
    //ios8中可以给定宽度为CGRectGetWidth([UIScreen mainScreen].bounds) - 21
    self.contentLabel = contentLabel;
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_baseline).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.equalTo(@(CGRectGetWidth([UIScreen mainScreen].bounds)));
    }];
    
}

@end
