//
//  UIControl+RdTools.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/12/28.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "UIControl+RdTools.h"
#import <objc/runtime.h>

static char rdControlActionKey;

@interface UIControl ()

@property (nonatomic, copy, readonly) void (^rd_ActionBlock)(UIControl *sender);

@end

@implementation UIControl (RdTools)

+ (instancetype)rd_ControlBgColor:(UIColor *_Nullable)bgColor forView:(UIView *)superView setTapResponder:(void (^)(UIControl *sender))block{
    UIControl *control = [UIControl rd_ControlBgColor:bgColor forView:superView];
    [control addTarget:control action:@selector(rd_ControlClick:) forControlEvents:UIControlEventTouchUpInside];
    [control setRd_ActionBlock:block];
    return control;
}

+ (instancetype)rd_ControlBgColor:(UIColor *_Nullable)bgColor forView:(UIView *)superView{
    UIControl *control = [[UIControl alloc] init];
    control.backgroundColor = bgColor? bgColor : [UIColor clearColor];
    [superView addSubview:control];
    
    return control;
}

- (void)rd_setTapResponder:(void (^)(UIControl *sender))block{
    [self setRd_ActionBlock:block];
}

- (void)setRd_ActionBlock:(void (^)(UIControl *))rd_ActionBlock{
    objc_setAssociatedObject(self, &rdControlActionKey, rd_ActionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UIControl *))rd_ActionBlock{
    return objc_getAssociatedObject(self, &rdControlActionKey);
}

- (void)rd_ControlClick:(UIControl *)sender{
    if (self.rd_ActionBlock) {
        self.rd_ActionBlock(sender);
    }
}

@end
