//
//  XXMenuView.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXMenuView.h"
#import "XXReadConfig.h"
@interface XXMenuView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *taskView;
@property (nonatomic, strong) UIView *menuBottomView;

@end

@implementation XXMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTap];
    }
    return self;
}

#define MENU_BOTTOM_HEIGHT (130.f + SafeAreaBottomHeight)

- (void)setupTap {
    
    [self addSubview:self.taskView];
    [self.taskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    
    [self addSubview:self.menuBottomView];
    [self setupSubviews];
    
    self.hidden = YES;
}

- (void)setupSubviews {
    CGFloat padding = 16.f;
    CGFloat spacing = 30.f;
    
    CGFloat item_width = (K_SCREEN_WIDTH - (padding * 2) - spacing)/2.f;
    NSArray *buttonTitleArray = @[@[@"字号 +",@"字号 -"],@[@"间距 +",@"间距 -"]];
    NSArray *buttonTagArray = @[@[@11,@12],@[@13,@14]];
    for (int i = 0 ; i < 2; i++) {
        for (int j = 0 ; j < 2; j++) {
            CGFloat item_top = (20 + 50) * i;
            CGFloat item_left = padding + ((spacing + item_width) * j);
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitle:buttonTitleArray[i][j] forState:UIControlStateNormal];
            NSNumber *tagNumber = buttonTagArray[i][j];
            button.tag = [tagNumber integerValue];
            [button addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.menuBottomView addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.menuBottomView).with.offset(item_top);
                make.size.mas_equalTo(CGSizeMake(item_width, 50));
                make.left.equalTo(self.menuBottomView).with.offset(item_left);
            }];
        }
    }
    
}

#pragma mark - Event

- (void)taskTapClick {
        
    [self hiddenMenu];
    
}

- (void)showMenu {
    if (self.hidden == NO) {
        return;
    }
    self.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.menuBottomView.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - MENU_BOTTOM_HEIGHT, [[UIScreen mainScreen] bounds].size.width, MENU_BOTTOM_HEIGHT);
        self.taskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2f];
    } completion:^(BOOL finished) {
    }];
}

- (void)hiddenMenu {
    [UIView animateWithDuration:0.2 animations:^{
        self.menuBottomView.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, MENU_BOTTOM_HEIGHT);
        self.taskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.f];
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

#define MINFONTSIZE 10.f
#define MAXFONTSIZE 20.f
#define MINLINESPACE 5.f
#define MAXLINESPACE 15.f
- (void)btnDidClick:(UIButton *)sender {
    if (sender.tag == 11) {
        if ([XXReadConfig shareInstance].fontSize < MAXFONTSIZE) {
            [XXReadConfig shareInstance].fontSize ++;
        }
    } else if (sender.tag == 12) {
        if ([XXReadConfig shareInstance].fontSize > MINFONTSIZE) {
            [XXReadConfig shareInstance].fontSize --;
        }
    } else if (sender.tag == 13) {
        if ([XXReadConfig shareInstance].lineSpace < MAXLINESPACE) {
            [XXReadConfig shareInstance].lineSpace ++;
        }
    } else if (sender.tag == 14) {
        if ([XXReadConfig shareInstance].lineSpace > MINLINESPACE) {
            [XXReadConfig shareInstance].lineSpace --;
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeFontNotification" object:nil];
    
}

#pragma mark - Lazy

- (UIView *)taskView {
    if (!_taskView) {
        _taskView = [[UIView alloc]init];
        _taskView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taskTapClick)];
        [_taskView addGestureRecognizer:tap];
    }
    return _taskView;
}

- (UIView *)menuBottomView {
    if (!_menuBottomView) {
        _menuBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, K_SCREEN_HEIGHT, K_SCREEN_WIDTH, MENU_BOTTOM_HEIGHT)];
        _menuBottomView.backgroundColor = [UIColor whiteColor];
    }
    return _menuBottomView;
}
@end
