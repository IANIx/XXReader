//
//  XXReadHeaderView.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXReadHeaderView.h"

@implementation XXReadHeaderView

- (instancetype)init {
    self = [super init];
    self.height = SafeAreaStatusBarHeight + 25.f + 5.f;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.chaterLabel];
    [self.chaterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(self).with.offset(SafeAreaStatusBarHeight + 5);
    }];
    
    self.chaterLabel.text = @"章节标题";
    return self;
}


- (UILabel *)chaterLabel {
    if (!_chaterLabel) {
        _chaterLabel = [[UILabel alloc]init];
        _chaterLabel.font = [UIFont systemFontOfSize:12.f];
        _chaterLabel.textColor = K_UIColorFromRGB(0x999999);
    }
    return _chaterLabel;
}

@end
