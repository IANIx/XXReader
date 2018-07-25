//
//  ReadViewController.h
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXPagingModule.h"

typedef void (^ReadChangePageBlock)(NSInteger page);
/**
 内容视图控制器
 */
@interface ReadViewController : UIViewController

@property (nonatomic, copy  ) NSString *content;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) BOOL isUpDown;

@property (nonatomic, strong) XXPagingModule *module;
@property (nonatomic, copy  ) ReadChangePageBlock pageBlock;
@end
