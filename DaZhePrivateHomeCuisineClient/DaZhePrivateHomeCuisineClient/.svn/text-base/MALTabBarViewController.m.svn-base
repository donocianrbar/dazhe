//
//  MALTabBarViewController.m
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "MALTabBarViewController.h"

@interface MALTabBarViewController ()<MALTabBarDelegate,MALTabBarChinldVIewControllerDelegate>
{
    NSInteger _defauletSelectedIndex;
    NSString *_tabBarBgImageName;
}
@end

@implementation MALTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithItemModels:(NSArray *)itemModelArray
{
    if (self = [super init]) {
        
        self.itemsArray = itemModelArray;
    
    }
    return self;
}

- (id)initWithItemModels:(NSArray *)itemModelArray defaultSelectedIndex:(NSInteger)defaultSelectedIndex
{
    self = [self initWithItemModels:itemModelArray];
    if (self) {
        
        _defauletSelectedIndex = defaultSelectedIndex;
    }
    return self;
}

- (UIView *)contentView
{
    if (_contentView == nil) {
       _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenBoundsSize.width,SYSTEM_VERSION>=7.0?MainScreenBoundsSize.height - tabBarHeight:MainScreenBoundsSize.height - tabBarHeight-20)];
        [self.view addSubview:_contentView];
    }
    return  _contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }

    [self setUpViewsWithDefauletSelectedIndex:_defauletSelectedIndex];
    // Do any additional setup after loading the view.
}


- (void)setUpViewsWithDefauletSelectedIndex:(NSInteger)defauletSelectedIndex
{
    if (self.itemsArray.count == 0) {
        
        return;
    }
    self.tabBar = [MALTabBar getMALTabBarWithItemModels:self.itemsArray defaultSelectedIndex:defauletSelectedIndex];
    if (_tabBarBgImageName) {
        
        [self.tabBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:_tabBarBgImageName]]];
    }else{
        [self.tabBar setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
    }

    self.tabBar.delegate = self;
    [self.view addSubview:self.tabBar];
    for(int i = 0; i< self.itemsArray.count; i++){
    
        MALTabBarItemModel *itemModel = [self.itemsArray objectAtIndex:i];
        id childViewController = [[NSClassFromString(itemModel.controllerName) alloc] init];
        [childViewController setDelegate:self];
       [self addChildViewController:childViewController];
        if (i == defauletSelectedIndex) {
            
            [[childViewController view] setFrame:self.contentView.bounds];
            [self.contentView addSubview:[childViewController view]];
            _currentViewController = childViewController;
        }
    }
}
-(void)setTabBarIsHiden:(BOOL)tabBarIsHiden{
    _tabBarIsHiden=tabBarIsHiden;
    if (tabBarIsHiden) {
        _contentView.frame=CGRectMake(0, 0, MainScreenBoundsSize.width,SYSTEM_VERSION>=7.0?MainScreenBoundsSize.height:MainScreenBoundsSize.height -20);
    }else{
        _contentView.frame=CGRectMake(0, 0, MainScreenBoundsSize.width,SYSTEM_VERSION>=7.0?MainScreenBoundsSize.height - tabBarHeight:MainScreenBoundsSize.height - tabBarHeight-20);
    }
    _currentViewController.view.frame=_contentView.frame;
//    for(UIViewController *viewController in self.childViewControllers){
//        viewController.view.frame=CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width,tabBarIsHiden? self.contentView.frame.size.height+49:self.contentView.frame.size.height);
//    }
    
    
}
-(void)setTabBarHidden:(BOOL)hidden{
    self.tabBarIsHiden=hidden;
    if (hidden) {
        [UIView animateWithDuration:0.5 animations:^{
            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x,SCREEN_HEIGHT+44, 320, tabBarHeight);
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
//        [UIView animateWithDuration:0.5 animations:^{
//            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x,SYSTEM_VERSION>=7.0? MainScreenBoundsSize.height - 49:MainScreenBoundsSize.height - 49-20, 320, tabBarHeight);
//        } completion:^(BOOL finished) {
//            
//        }];
         self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x,SYSTEM_VERSION>=7.0? MainScreenBoundsSize.height - 49:MainScreenBoundsSize.height - 49-20, 320, tabBarHeight);
    }
}
#pragma mark -设置tabBar背景图片
- (void)setTabBarBgImage:(NSString *)imageName
{
    _tabBarBgImageName = imageName;
}

#pragma mark - 点击item触发代理方法
- (void)selectedItem:(MALTabBarItemModel *)selectedItemModel
{
    UIViewController *childViewController = [self.childViewControllers objectAtIndex:selectedItemModel.itemIndex];
    [childViewController.view setFrame:self.contentView.bounds];
    [_currentViewController.view removeFromSuperview];
    [self.contentView addSubview:childViewController.view];
    _currentViewController = childViewController;
    
}

-(BOOL)willSelectItem:(MALTabBarItemModel *)selectedItemModel{
     return YES;
 }

-(void)LoginDidOK{
    [self.tabBar selectedItemAtIndex:self.tabBar.willGotoIndex];
    
}
#pragma mark-弹出发布页面
-(void)presentPublishView
{
   
}
-(void)didNotSelectItem{

}

#pragma mark -设置item  badge红圈
- (void)setBadgeNumber:(NSInteger)number index:(NSInteger)index
{
    [self.tabBar setItemBadgeNumberWithIndex:index badgeNumber:number];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
