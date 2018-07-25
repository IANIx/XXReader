//
//  XXReadTableViewCell.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXReadTableViewCell.h"

@implementation XXReadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.readView];
        [self.readView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).with.offset(20);
            make.right.equalTo(self.contentView).with.offset(-20);
        }];
    }
    return self;
}

- (XXReadView *)readView {
    if (!_readView) {
        _readView = [[XXReadView alloc]initWithFrame:CGRectZero];
    }
    return _readView;
}
@end
