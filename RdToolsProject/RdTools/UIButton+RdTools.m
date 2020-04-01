//
//  UIButton+RdTools.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/16.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIButton+RdTools.h"
#import "RdMacroFile.h"
#import "RdToolsManager.h"
#import <objc/runtime.h>

static char rdButtonActionBlockKey;

@interface UIButton ()

@property (nonatomic, strong) void (^rdActionBlock)(UIButton *sender);

@end

@implementation UIButton (RdTools)

+ (instancetype)rd_BtnImage:(NSString *)imgName forView:(UIView *)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonImg:imgName forView:superView];
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setRdActionBlock:block];
    
    return button;
}

+ (instancetype)rd_BtnTitle:(NSString *)title forView:(UIView *)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title forView:superView];
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setRdActionBlock:block];
    return button;
}

+ (instancetype)rd_BtnTitle:(NSString *)title image:(NSString *)imgName forView:(UIView *)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title img:imgName forView:superView];
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setRdActionBlock:block];
    return button;
}

+ (instancetype)rd_BtnImage:(NSString *)imgName responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonImg:imgName forView:nil];
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setRdActionBlock:block];
    
    return button;
}

+ (instancetype)rd_BtnTitle:(NSString *)title responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title forView:nil];
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setRdActionBlock:block];
    return button;
}

+ (instancetype)rd_BtnTitle:(NSString *)title image:(NSString *)imgName responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title img:imgName forView:nil];
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setRdActionBlock:block];
    return button;
}

+ (instancetype _Nonnull)rd_BtnBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.clipsToBounds = YES;
    [superView addSubview:button];
    return button;
}

+ (instancetype)rd_BtnBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.clipsToBounds = YES;
    [superView addSubview:button];
    
    [button addTarget:button action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setRdActionBlock:block];
    return button;
}

+ (instancetype)ButtonImg:(NSString *)imgName forView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}

+ (instancetype)ButtonTitle:(NSString *)title forView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    [button setTitle:title forState:UIControlStateNormal];
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}

+ (instancetype)ButtonTitle:(NSString *)title img:(NSString *)imgName  forView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull title))rd_setButtonTitle{
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString *_Nonnull title))rd_setButtonTitleSelected{
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(CGFloat fontSize))rd_setButtonTitleFontSize{
    return ^(CGFloat fontSize) {
        if (Rd_FontNameNormal.length == 0) {
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
        else {
            self.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:fontSize];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nullable fontName, CGFloat fontSize))rd_setButtonTitleFont{
    return ^(NSString *fontName, CGFloat fontSize) {
        if (fontName == nil) {
            if (Rd_FontNameNormal.length == 0) {
                self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
            }
            else {
                self.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:fontSize];
            }
        }
        else {
            self.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorNormal{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorSelected{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * _Nonnull))rd_setButtonTitleColorDisabled{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorHightlighted{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorNormal{
    return ^(UIColor *color) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorSelected{
    return ^(UIColor *color) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorHightlighted{
    return ^(UIColor *color) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageNormal{
    return ^(NSString *imageName) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))rd_setButtonBgImageSelected{
    return ^(NSString *imageName) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageHightlighted{
    return ^(NSString *imageName) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageNormal{
    return ^(NSString *imageName) {
        [self setImage:nil forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageSelected{
    return ^(NSString *imageName) {
        [self setImage:nil forState:UIControlStateSelected];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageDisabled{
    return ^(NSString *imageName) {
        [self setImage:nil forState:UIControlStateDisabled];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(RdButtonImageType type))rd_setButtonImageType{
    return ^(RdButtonImageType type) {
        if (type == RdButtonImageLeft) {
            return self;
        }
        else if (type == RdButtonImageRight) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.imageView.frame), 0, CGRectGetWidth(self.imageView.frame));
            self.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetWidth(self.titleLabel.frame), 0, -CGRectGetWidth(self.titleLabel.frame));
        }
        else if (type == RdButtonImageBottom) {
            self.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.imageView.frame)/2.0, -CGRectGetWidth(self.imageView.frame)/2.0, -CGRectGetHeight(self.imageView.frame)/2.0, CGRectGetWidth(self.imageView.frame)/2.0);
            self.imageEdgeInsets = UIEdgeInsetsMake(-CGRectGetHeight(self.titleLabel.frame)/2.0, CGRectGetWidth(self.titleLabel.frame)/2.0, CGRectGetHeight(self.titleLabel.frame)/2.0, -CGRectGetWidth(self.titleLabel.frame)/2.0);
        }
        return self;
    };
}




- (UIImage *)getImageWith:(UIColor *)color width:(CGFloat)width height:(CGFloat)height{
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)rdbuttonClick:(UIButton *)sender{
    if (self.rdActionBlock) {
        self.rdActionBlock(sender);
    }
}

- (void)setRdActionBlock:(void (^)(UIButton *))rdActionBlock{
    objc_setAssociatedObject(self, &rdButtonActionBlockKey, rdActionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UIButton *))rdActionBlock{
    return objc_getAssociatedObject(self, &rdButtonActionBlockKey);
}

@end

