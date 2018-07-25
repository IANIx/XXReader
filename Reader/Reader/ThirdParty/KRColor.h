//
//  KRColorMacros.h
//  TuTuDao
//
//  Created by kairu on 2017/3/13.
//  Copyright © 2017年 kaiRuTech. All rights reserved.
//



//----------------------ABOUT COLOR 颜色相关 ----------------------------

#define K_RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define K_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 随机色
#define K_RandColor K_RGBCOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
// 清除颜色
#define K_ClearColor [UIColor clearColor]
// rgb颜色转换（16进制->10进制）
#define K_UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define K_COLOR_BLUE_             K_UIColorFromRGB(0x41CEF2)
#define K_COLOR_GRAY_             K_UIColorFromRGB(0xababab) //171
#define K_COLOR_333               K_UIColorFromRGB(0x333333) //51
#define K_COLOR_666               K_UIColorFromRGB(0x666666) //102
#define K_COLOR_888               K_UIColorFromRGB(0x888888) //136
#define K_COLOR_999               K_UIColorFromRGB(0x999999) //153
#define K_COLOR_PLACEHOLD_        K_UIColorFromRGB(0xc5c5c5) //197
#define K_COLOR_RED_              K_UIColorFromRGB(0xff5400) //红色
#define K_COLOR_GREEN_            K_UIColorFromRGB(0x31d8ab)//绿色
#define K_COLOR_YELLOW_           K_UIColorFromRGB(0xffa200)//黄色
#define K_COLOR_SEPARATE_LINE     K_UIColorFromRGB(0xC8C8C8)//200
#define K_COLOR_LIGHTGRAY         K_RGBACOLOR(200, 200, 200, 0.4)//淡灰色
//----------------------ABOUT COLOR 字体相关 ----------------------------
#define K_FontSize(s) [UIFont systemFontOfSize:s]


// 控制器view背景色
#define K_VCBackGroundColor K_RGBCOLOR(247, 246, 249)
#define K_MainColor K_UIColorFromRGB(0x7F78E9)
//导航渐变层颜色
#define K_NavBarBackGroundColor K_UIColorFromRGB(0xF8F8F8)
#define K_NavBarBackGroundColor_Left K_UIColorFromRGB(0xFBCCD4)
#define K_NavBarBackGroundColor_Right K_UIColorFromRGB(0x9EB5E7)

//Tabbar文字颜色
#define K_TabBarTextColor_Nomal K_UIColorFromRGB(0x626262)
#define K_TabBarTextColor_Select K_UIColorFromRGB(0x5F57B6)
//阅读页颜色
//#define K_ReadSetingColor K_RGBCOLOR(241, 238, 233)
#define K_ReadSetingColor K_RGBCOLOR(255, 255, 255)

#define K_ReadSelectColor K_RGBCOLOR(77, 69,202)
