//
//  UIView+Ext.h
//  Lafaso
//
//  Created by wj on 14-7-9.
//  Copyright (c) 2014年 Lafaso. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIView Frame操作
 */
@interface UIView (Frame)

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void)moveBy:(CGPoint) delta;
- (void)scaleBy:(CGFloat) scaleFactor;
- (void)fitInSize:(CGSize) aSize;

@end

/**
 *  UIView 截屏
 */
@interface UIView (SCreenShot)

- (UIImage *)convertViewToImage:(UIView*)v;

@end

/**
 *  从Nib加载
 */
@interface UIView (Nib)

+ (id)classFromNib:(NSString *)className;

@end


/**
 *  UIView 动画
 */

@interface UIView (Animation)

/**
 * gradient animaiton
 * @param from 起始alpha值
 * @param to   终止alpha值
 * @param duration 动画时间
 * @param beginTime 动画延迟时间
 */
- (CAAnimation *)animationWithOpacityFrom:(CGFloat) from To:(CGFloat) to Duration:(CGFloat) duration BeginTime:(CGFloat)beginTime;

@end
