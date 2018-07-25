//
//  XXPageControlFactory.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXPageControlFactory.h"
#import "BasePageViewController.h"

@implementation XXPageControlFactory

- (UIViewController<XXPageControlProtocol> *)getPageControllerWithPageType:(XXPageTurnType)pageType
                                                                  callback:(nonnull id<UIPageViewControllerDelegate,UIPageViewControllerDataSource,DZMCoverControllerDelegate>)callback {
    if (pageType == XXPageTurnTypeEmulation || pageType == XXPageTurnTypeCover) {
        BasePageViewController *pageViewController = [[BasePageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                                                   navigationOrientation:pageType == XXPageTurnTypeEmulation ? \
                                                    UIPageViewControllerNavigationOrientationHorizontal : \
                                                    UIPageViewControllerNavigationOrientationVertical
                                                                                                 options:nil];
        pageViewController.dataSource = callback;
        pageViewController.delegate = callback;
        
        return pageViewController;
    } else {
        DZMCoverController *coverVC = [[DZMCoverController alloc] init];
        if (pageType == XXPageTurnTypeUpDown) {
            coverVC.gestureRecognizerEnabled = NO;
            coverVC.tapGestureRecognizerEnabled = NO;
        }
        coverVC.delegate = callback;
        return coverVC;
    }
}

@end
