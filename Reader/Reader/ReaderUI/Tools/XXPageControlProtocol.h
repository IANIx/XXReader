//
//  XXPageControlProtocol.h
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XXPageControlProtocol <NSObject>

- (void)setBeforeViewControllers:(nullable UIViewController *)viewController;

- (void)setAfterViewControllers:(nullable UIViewController *)viewController;

- (void)setViewControllers:(nullable NSArray<UIViewController *> *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion;

@end
