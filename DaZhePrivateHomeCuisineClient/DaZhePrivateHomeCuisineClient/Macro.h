//
//  Macro.h
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-23.
//  Copyright (c) 2014年 WQ. All rights reserved.
//
#ifndef WoQuClient_Macro_h
#define WoQuClient_Macro_h

#ifdef DEBUG
#define WQLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else

#define WQLog(xx, ...)  ((void)0)

#endif
#import "UIView+Ext.h"
#import "NSDate+Helper.h"
#import "UIColor+Ext.h"
#import "MBProgressHUD.h"
#import "ApiConstraint.h"
#import "Common.h"
#import "BaseService+DZBaseService.h"
#import "BaseService.h"
#import "Jastor.h"
#import "SDWebImage/UIImageView+WebCache.h"
#define SharedAppDelegate ((DZAppDelegate *)[[UIApplication sharedApplication] delegate])
//获取系统版本
#define SYSTEM_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
//屏幕宽高
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define IPHONE5_HEIGHT 568
#define IMG(name)    [UIImage imageNamed:(name)]

//常用函数
//====================================================
// 用途: color
//====================================================
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define MyPROFILE_COLOR     [UIColor colorWithHexString:@"#37D961"]


//====================================================
// 用途: 判断字符串是否为空
//====================================================
#define IS_NOT_EMPTY(string) (string !=nil && ![string isKindOfClass:[NSNull class]] && ![@"" isEqualToString:string] && ![@"NULL" isEqualToString:string])

// View 坐标(x,y)和宽高(width,height)
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#endif
