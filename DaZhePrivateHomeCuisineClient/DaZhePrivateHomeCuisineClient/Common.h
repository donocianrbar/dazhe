//
//  Common.h
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-28.
//  Copyright (c) 2014年 WQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject
+ (void)showLoadingAnimationForView:(UIView *)view message:(NSString *)message;
+ (void)showLoadingAnimationForView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration;

/*
 * 在当前可见页面上显示加载动画
 */
+ (void)showLoadingAnimationForView:(UIView *)view;

/*
 * 在当前可见页面上显示加载提示toast，两秒钟后消失
 */
+ (void)showToastViewForCurrentVisibleViewForTwoSecondsWithMessage:(NSString *)message;

/*
 * 在指定页面上显示加载提示toast，指定秒数后消失
 */
+ (void)showToastViewWithMessage:(NSString *)message ForView:(UIView *)view forTimeInterval:(NSTimeInterval)timeInterval;


/*
 * 让指定页面的加载动画消失掉
 */
+ (void)hideLoadingAnimationForView:(UIView *)view;

/*
 * 让指定页面的所有加载动画消失掉
 */
+ (void)hideAllLoadingAnimationForView:(UIView *)view;

@end
