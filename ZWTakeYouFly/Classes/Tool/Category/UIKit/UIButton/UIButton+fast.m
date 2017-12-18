//
//  UIButton+fast.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/21.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "UIButton+fast.h"
#import <objc/runtime.h>

@implementation UIButton (fast)
static NSString *keyOfUseCategoryMethod;//用分类方法创建的button，关联对象的key
static NSString *keyOfBlock;

+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName action:(tapActionBlock)actionBlock
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [button addTarget:button action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *用runtime中的函数通过key关联对象
     *
     *objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
     *id object                     表示关联者，是一个对象，变量名理所当然也是object
     *const void *key               获取被关联者的索引key
     *id value                      被关联者，这里是一个block
     *objc_AssociationPolicy policy 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
     
     */
    objc_setAssociatedObject (button , &keyOfUseCategoryMethod , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
    return button;
}
- (void)tapAction:(UIButton*)sender
{
    /**
     * 通过key获取被关联对象
     *objc_getAssociatedObject(id object, const void *key)
     *
     */
    tapActionBlock block = ( tapActionBlock )objc_getAssociatedObject (sender , &keyOfUseCategoryMethod );
    
    if (block) {
        
        block(sender);
        
    }
}



- (void)setActionBlock:(tapActionBlock)actionBlock
{
    objc_setAssociatedObject (self , &keyOfBlock , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
}

- (tapActionBlock)actionBlock
{
    return objc_getAssociatedObject (self , &keyOfBlock );
}

+ (UIButton *)buttonWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor{
    UIButton *btn = [UIButton buttonWithType:0];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    if (titleColor == nil) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    [btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateDisabled];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"save_btn"] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    return btn;
}
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing
{
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = Spacing/2,
        .bottom = 0,
        .right  = -Spacing/2,
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = -Spacing/2,
        .bottom = 0,
        .right  = Spacing/2,
    };
}

- (void)setIconInRightWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + Spacing / 2),
        .bottom = 0,
        .right  =   (img_W + Spacing / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + Spacing / 2),
        .bottom = 0,
        .right  = - (tit_W + Spacing / 2),
    };
}

- (void)setIconInTopWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    =   (tit_H / 2 + Spacing / 2),
        .left   = - (img_W / 2),
        .bottom = - (tit_H / 2 + Spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = - (img_H / 2 + Spacing / 2),
        .left   =   (tit_W / 2),
        .bottom =   (img_H / 2 + Spacing / 2),
        .right  = - (tit_W / 2),
    };
}

- (void)setIconInBottomWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = - (tit_H / 2 + Spacing / 2),
        .left   = - (img_W / 2),
        .bottom =   (tit_H / 2 + Spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    =   (img_H / 2 + Spacing / 2),
        .left   =   (tit_W / 2),
        .bottom = - (img_H / 2 + Spacing / 2),
        .right  = - (tit_W / 2),
    };
}
//
//static UIButton *createResultLabel() {
//    UIButton *btn = [UIButton buttonWithType:0];
//    btn.titleLabel.font = [UIFont systemFontOfSize:14];
//    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
//    btn.layer.cornerRadius = 5;
//    btn.layer.masksToBounds = YES;
//    return btn;
//}
@end
