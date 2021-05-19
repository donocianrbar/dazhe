//
//  Common.m
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-28.
//  Copyright (c) 2014年 WQ. All rights reserved.
//

#import "Common.h"
#import "MBProgressHUD.h"
@implementation Common
#pragma mark -
#pragma mark LoadingAnimation
+ (void)showLoadingAnimationForView:(UIView *)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    
    hud.labelText = @"正在加载数据...请稍候";
    
    [hud show:YES];
}

+ (void)showLoadingAnimationForView:(UIView *)view message:(NSString *)message
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    
    hud.labelText = message;
    
    [hud show:YES];
}

+ (void)showLoadingAnimationForView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    
    hud.labelText = message;
    [hud show:YES];
    
    [hud hide:YES afterDelay:duration];
}

+ (void)showToastViewForCurrentVisibleViewForTwoSecondsWithMessage:(NSString *)message
{
    [self showToastViewWithMessage:message ForView:[[[[UIApplication sharedApplication] keyWindow] rootViewController] view] forTimeInterval:2];
}

+ (void)showToastViewWithMessage:(NSString *)message ForView:(UIView *)view forTimeInterval:(NSTimeInterval)timeInterval
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
	hud.mode = MBProgressHUDModeText;
	hud.labelText = message;
	hud.margin = 10.f;
	hud.yOffset = 150.f;
	hud.removeFromSuperViewOnHide = YES;
	
	[hud hide:YES afterDelay:timeInterval];
}

+ (void)hideLoadingAnimationForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];

}

+ (void)hideAllLoadingAnimationForView:(UIView *)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];

}
@end
