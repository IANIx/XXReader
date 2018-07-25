//
//  XXPagingModule.h
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 排版计算类
 */
@interface XXPagingModule : NSObject

@property (nonatomic, copy)               NSString   *contentText;
@property (nonatomic, unsafe_unretained)  NSInteger  contentFont;
@property (nonatomic, unsafe_unretained)  CGSize     textRenderSize;

/**
 *  分页
 */
- (void)paginate;



/**
 *  一共分了多少页
 *
 *  @return 一章所分的页数
 */
- (NSUInteger)pageCount;



/**
 *  获得page页的文字内容
 *
 *  @param page 页
 *
 *  @return 内容
 */
- (NSString *)stringOfPage:(NSUInteger)page;

/**
 *  根据当前的页码计算范围 - 目的是为了变字号的时候内容偏移不要太多
 *
 *  @param page 当前页码
 *
 *  @return 范围
 */
- (NSRange)rangeOfPage:(NSUInteger)page;

/**
 *  根据范围计算页码 - 目的是为了变字号的时候内容偏移不要太多
 *
 *  @param range 内容范围
 *
 *  @return 页码
 */
- (NSUInteger)pageOfRange:(NSRange)range;
@end
