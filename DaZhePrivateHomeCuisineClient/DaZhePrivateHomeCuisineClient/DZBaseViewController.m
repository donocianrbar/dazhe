//
//  DZBaseViewController.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZBaseViewController ()

@end

@implementation DZBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    if (SYSTEM_VERSION>=7.0) {
        self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:@"FF9326"];
    }else{
        if ([UIDevice currentDevice].systemVersion.floatValue < 7.0){
            UIView *aview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
            aview.backgroundColor=[UIColor colorWithHexString:@"FF9326"];
            [self.navigationController.navigationBar addSubview:aview];
//            self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
//            [self.navigationController.navigationBar setBackgroundImage:image                                                      forBarMetrics:UIBarMetricsDefault];
           // [self.navigationController.navigationBar.layer setMasksToBounds:YES];
        }

    }
    UIButton *backBt=[UIButton buttonWithType:UIButtonTypeCustom];
    backBt.frame=CGRectMake(5,SYSTEM_VERSION>=7.0?20+(44-41/2)/2:(44-41/2)/2, 40, 41/2);
    [backBt setImage:IMG(@"btn_backarrow_def") forState:UIControlStateNormal];
    [backBt addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [backBt setImageEdgeInsets:UIEdgeInsetsMake(0.0, 15,0.0,10)];
    [self.navView addSubview:backBt];
    
    // Do any additional setup after loading the view.
}
#pragma mark-getter
-(UIView*)navView
{
    if (!_navView) {
        _navView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SYSTEM_VERSION>=7.0?44+20:44)];
        _navView.backgroundColor=[UIColor colorWithHexString:@"FF9326"];
        [self.view addSubview:_navView];
    }
    return _navView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)show:(NSString *)text DetailText:(NSString *)detailtext{
    HUD= [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:HUD];
	HUD.delegate = self;
	HUD.labelText = text;
    HUD.alpha=0.8;
	HUD.detailsLabelText =detailtext;
	HUD.square = YES;
	[HUD show:YES];
    
}
-(void)showSuccesInfor:(NSString *)succesInfor{
	HUD.mode = MBProgressHUDModeCustomView;
    
	HUD.labelText =succesInfor;
	[HUD hide:YES afterDelay:2];
    
}
-(void)hideHud{
    [HUD hide:YES];
}
- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidded
	[HUD removeFromSuperview];
	HUD = nil;
}
-(void)showTip:(NSString *)tip hideDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	
	// Configure for text only and offset down
	hud.mode = MBProgressHUDModeText;
	hud.labelText = tip;
    hud.alpha=0.8;
	hud.removeFromSuperViewOnHide = YES;
	[hud hide:YES afterDelay:delay];
}
-(void)addTitle:(NSString *)title
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2,SYSTEM_VERSION>=7.0?20+(44-21)/2:(44-21)/2, 100, 21)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = title;
    [self.navView addSubview:label];
}
#pragma mark-返回action
-(void)backAction:(UIButton*)bt
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
