//
//  BasePageViewController.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "BasePageViewController.h"

@interface BasePageViewController ()

@end

@implementation BasePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBeforeViewControllers:(UIViewController *)viewController {
    if (viewController == nil) {
        return;
    }
    
    [self setViewControllers:@[viewController]
                   direction:UIPageViewControllerNavigationDirectionReverse
                    animated:(self.navigationOrientation == UIPageViewControllerNavigationOrientationVertical) ? NO : YES
                  completion:nil];
}

- (void)setAfterViewControllers:(UIViewController *)viewController {
    if (viewController == nil) {
        return;
    }
    
    [self setViewControllers:@[viewController]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:(self.navigationOrientation == UIPageViewControllerNavigationOrientationVertical) ? NO : YES
                  completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
