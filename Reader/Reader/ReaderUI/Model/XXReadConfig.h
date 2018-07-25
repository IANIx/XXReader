//
//  XXReadConfig.h
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXReadConfig : NSObject <NSCoding>

+ (instancetype)shareInstance;

@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, strong) UIColor *fontColor;
@property (nonatomic, strong) UIColor *theme;


@end
