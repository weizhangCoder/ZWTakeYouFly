//
//  UIButton+fast.h
//  TakeYouFly
//
//  Created by zhangwei on 17/6/21.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^tapActionBlock)(UIButton *button);
@interface UIButton (fast)

@property(nonatomic,copy)tapActionBlock actionBlock;

/**
 通过block对button的点击事件封装
 
 @param frame       frame
 @param title       标题
 @param bgImageName 背景图片
 @param actionBlock 点击事件回调block
 
 @return button
 */
+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName action:(tapActionBlock)actionBlock;

+ (UIButton *)buttonWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor;

//** 可以自定义图片和标题间的间隔 */
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;

@end
