//
//  CustomTableViewCell.m
//  SelfSizingTest
//
//  Created by 亚珂王 on 16/7/25.
//  Copyright © 2016年 亚珂王. All rights reserved.
//

#import "CustomTableViewCell.h"
#import <Masonry.h>

@interface CustomTableViewCell()


@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UILabel * contentLabel = [UILabel new];
        [self.contentView addSubview:contentLabel];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:15.0];
        contentLabel.numberOfLines = 0;

        self.contentLabel = contentLabel;
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
    }
    
    return self;
}

@end
