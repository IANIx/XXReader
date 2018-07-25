//
//  BookReadViewController.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "BookReadViewController.h"
#import "ReadViewController.h"
#import "XXPageControlFactory.h"
#import "XXMenuView.h"

@interface BookReadViewController ()<UIPageViewControllerDataSource,
                                    UIPageViewControllerDelegate,
                                    DZMCoverControllerDelegate,
                                    UIGestureRecognizerDelegate>

@property (nonatomic, assign) XXPageTurnType pageType;
@property (nonatomic, strong) UIViewController <XXPageControlProtocol>*pageViewController;

@property (nonatomic, strong) XXMenuView *menuView;
@end

@implementation BookReadViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupSubviews];
    
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    self.pageViewController = [[XXPageControlFactory alloc]getPageControllerWithPageType:self.pageType
                                                                                callback:self];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    [self.pageViewController
     setViewControllers:@[[self viewControllerAtIndex:self.pageIndex]]
     direction:UIPageViewControllerNavigationDirectionReverse
     animated:NO
     completion:nil];

    [self setupGestureRecognizer];

    [self.view addSubview:self.menuView];
}

- (void)setupData {
    //设置翻页方式
    self.pageType = XXPageTurnTypeEmulation;
}

- (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

- (void)setupGestureRecognizer {
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesClick:)];
    tapGes.numberOfTouchesRequired = 1;
    tapGes.numberOfTapsRequired = 1;
    tapGes.delegate = self;
    [self.view addGestureRecognizer:tapGes];
}


#pragma mark - Ges
- (void)tapGesClick:(UITapGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture locationInView:self.view];
    CGFloat leftInterval = self.view.frame.size.width/3;
    CGFloat topInterval = self.view.frame.size.height/3;
    if (touchPoint.x > leftInterval && touchPoint.x < 2 * leftInterval  && touchPoint.y > topInterval && touchPoint.y < topInterval * 2) {
        //显示菜单栏
        [self.menuView showMenu];
    } else if((touchPoint.x < leftInterval *2 && touchPoint.y < topInterval) || (touchPoint.x < leftInterval)) {
        if (self.pageIndex == 0) {
            return ;
        };
        if (self.pageType == XXPageTurnTypeEmulation || self.pageType == XXPageTurnTypeUpDown) {
            return;
        }
        self.pageIndex--;
        [self.pageViewController setBeforeViewControllers:[self viewControllerAtIndex:self.pageIndex]];
        
    } else{
        if (self.pageType == XXPageTurnTypeEmulation || self.pageType == XXPageTurnTypeUpDown) {
            return;
        }
        self.pageIndex++;
        [self.pageViewController setAfterViewControllers:[self viewControllerAtIndex:self.pageIndex]];
        
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"XXReadView"]) {
        return YES;
    }
    return  NO;
}

#pragma mark - UIPageViewController

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    self.pageIndex--;
    return [self viewControllerAtIndex:self.pageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    self.pageIndex++;
    return [self viewControllerAtIndex:self.pageIndex];
}
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    pageViewController.view.userInteractionEnabled = NO;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    pageViewController.view.userInteractionEnabled = YES;
}

#pragma mark - DZMCoverControllerDelegate

// 切换结果
- (void)coverController:(DZMCoverController *)coverController currentController:(UIViewController *)currentController finish:(BOOL)isFinish {
    if (!isFinish) { // 切换失败
        
    }
}

// 上一个控制器
- (UIViewController *)coverController:(DZMCoverController *)coverController getAboveControllerWithCurrentController:(UIViewController *)currentController {
    self.pageIndex--;
    return [self viewControllerAtIndex:self.pageIndex];
}

// 下一个控制器
- (UIViewController *)coverController:(DZMCoverController *)coverController getBelowControllerWithCurrentController:(UIViewController *)currentController {
    self.pageIndex++;
    return [self viewControllerAtIndex:self.pageIndex];
}

#pragma mark - 根据index得到对应的UIViewController

- (ReadViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    if (self.pageIndex < 0) {
        self.pageIndex = 0;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    ReadViewController *initialViewController = [[ReadViewController alloc]init];
    initialViewController.content = self.content;
    initialViewController.pageIndex = self.pageIndex;
    initialViewController.isUpDown = (self.pageType == XXPageTurnTypeUpDown);
    
    __weak typeof(self) weakSelf = self;
    initialViewController.pageBlock = ^(NSInteger page) {
        weakSelf.pageIndex = page;
    };
    
    return initialViewController;
}

#pragma mark - lazy

- (XXMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[XXMenuView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        _menuView.backgroundColor = [UIColor clearColor];
    }
    return _menuView;
}
@end
