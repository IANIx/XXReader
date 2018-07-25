//
//  XXPageControlFactory.h
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZMCoverController.h"
#import "XXPageControlProtocol.h"

typedef NS_ENUM(NSUInteger, XXPageTurnType){
    XXPageTurnTypeSlide = 0,        //滑动
    XXPageTurnTypeEmulation = 1,    //仿真
    XXPageTurnTypeUpDown = 2,       //上下
    XXPageTurnTypeCover = 3,        //覆盖
};

@interface XXPageControlFactory : NSObject

/**
 根据翻页类型返回翻页控制器
 
 @param pageType 翻页类型
 @return 翻页控制器
 */
- (UIViewController <XXPageControlProtocol>*)getPageControllerWithPageType:(XXPageTurnType)pageType
                                                                  callback:(nonnull id<UIPageViewControllerDelegate,UIPageViewControllerDataSource,DZMCoverControllerDelegate>)callback;

@end

