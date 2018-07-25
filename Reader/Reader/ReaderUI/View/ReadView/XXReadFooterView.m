//
//  XXReadFooterView.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXReadFooterView.h"

@implementation XXReadFooterView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.height = 40.f;
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.pageCountLabel];
        [self.pageCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).with.offset(-20);
        }];
    }
    
    return self;
}

- (UILabel *)pageCountLabel {
    if (!_pageCountLabel) {
        _pageCountLabel = [[UILabel alloc]init];
        _pageCountLabel.font = [UIFont systemFontOfSize:12.f];
        _pageCountLabel.textColor = K_UIColorFromRGB(0x999999);
    }
    return _pageCountLabel;
}

@end
