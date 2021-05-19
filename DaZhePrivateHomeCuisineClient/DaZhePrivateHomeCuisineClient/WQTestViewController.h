//
//  WQTestViewController.h
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-23.
//  Copyright (c) 2014年 WQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MALTabBarChinldVIewControllerDelegate.h"
#import "DZBaseViewController.h"
@interface WQClassfiyNav : UINavigationController
@end

@interface WQTestViewController : DZBaseViewController<MALTabBarChinldVIewControllerDelegate>
@property (nonatomic, assign) id<MALTabBarChinldVIewControllerDelegate>delegate;
- (IBAction)testAction:(id)sender;

@end
