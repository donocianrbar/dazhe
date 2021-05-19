//
//  MALTabBar.h
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MALTabBarItem.h"

#define MainScreenBoundsSize [UIScreen mainScreen].bounds.size
#define tabBarHeight 49 //tabBar的高度
@protocol MALTabBarDelegate <NSObject>

-(BOOL)willSelectItem:(MALTabBarItemModel *)selectedItemModel;
- (void)selectedItem:(MALTabBarItemModel *)selectedItemModel;
-(void)didNotSelectItem;
-(void)presentPublishView;

@end

@interface MALTabBar : UIView
{
    NSMutableArray *_items;
}
@property (nonatomic, strong) NSArray *itemArray;
@property (nonatomic, assign) id<MALTabBarDelegate> delegate;
@property (nonatomic, assign, readonly) NSInteger currentSelectedIndex;
@property (nonatomic, assign, readonly) NSInteger lastSelectedIndex;
@property (nonatomic, assign, readonly)NSInteger   willGotoIndex;
@property (nonatomic, readonly) NSMutableArray *items;

+ (MALTabBar *)getMALTabBarWithItemModels:(NSArray *)itemModels defaultSelectedIndex:(NSInteger)defaultSelectedIndex;
- (void)selectedItemAtIndex:(NSInteger)itemIndex;
- (void)setItemBadgeNumberWithIndex:(NSInteger)itemIndex badgeNumber:(NSInteger)badgeNumber;

@end
