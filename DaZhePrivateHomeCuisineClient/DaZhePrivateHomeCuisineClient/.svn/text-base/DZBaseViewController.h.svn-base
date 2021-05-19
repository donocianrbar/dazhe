//
//  DZBaseViewController.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZBaseViewController : UIViewController<MBProgressHUDDelegate>{
     MBProgressHUD *HUD;
}
@property (nonatomic,strong)UIView *navView;
-(void)addTitle:(NSString *)title;
-(void)backAction:(UIButton*)bt;
-(void)show:(NSString *)text DetailText:(NSString *)detailtext;
-(void)showSuccesInfor:(NSString *)succesInfor;
-(void)hideHud;
-(void)showTip:(NSString *)tip hideDelay:(NSTimeInterval)delay;
@end
