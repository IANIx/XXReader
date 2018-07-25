//
//  KRSizeMacros.h
//  TuTuDao
//
//  Created by kairu on 2017/3/13.
//  Copyright © 2017年 kaiRuTech. All rights reserved.
//

//----------------------ABOUT SCREEN & SIZE 屏幕&尺寸 ----------------------------
/**
 iPad Air {{0, 0}, {768, 1024}}
 iphone4s {{0, 0}, {320, 480}}     960*640
 iphone5 5s {{0, 0}, {320, 568}}      1136*640
 iphone6 6s {{0, 0}, {375, 667}}     1334*750
 iphone6Plus 6sPlus {{0, 0}, {414, 736}}  1920*1080
 Apple Watch 1.65inches(英寸) 320*640
 */

#define K_TabBarH        49.0f
#define K_StatusBarH     20.0f
#define K_NavigationBarH 44.0f
#define K_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define K_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define K_SCREEN_POINT (float)K_SCREEN_WIDTH/320.f
#define K_SCREEN_H_POINT (float)K_SCREEN_HEIGHT/480.f
//顶部导航栏高度 iPhone X 高度为88 ,其余为 64
#define SafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64)
//底部iPhone X 适配
#define SafeAreaBottomHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 34 : 0)
//StatusBar高度 iPhone X 为44,其余为20
#define SafeAreaStatusBarHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 44 : 20)


//判断是否 Retina屏、设备是否iPhone 5、是否是iPad
#define K_isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 判断是否为iPhone */
#define K_isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 判断是否是iPad */
#define K_isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是否为iPod */
#define K_isiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define K_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define K_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 分辨率375x667，像素750x1334，@2x */
#define K_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define K_iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define K_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) : NO)
