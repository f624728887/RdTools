//
//  UIButton+RdTools.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/16.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIButton+RdTools.h"
#import "RdMacroFile.h"

@implementation UIButton (RdTools)

+ (UIButton *_Nonnull)rd_ButtonBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView{
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

+ (UIButton *_Nonnull)rd_ButtonBGColor:(UIColor *_Nullable)bgColor target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.clipsToBounds = YES;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

+ (UIButton *_Nonnull)rd_ButtonJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView{
    
    UIButton *button = [UIButton rd_ButtonJustTitle:title target:target action:sel];
    [superView addSubview:button];
    
    return button;
}

+ (UIButton *_Nonnull)rd_ButtonJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView{
    
    UIButton *button = [UIButton rd_ButtonJustImg:imgName target:target action:sel];
    [superView addSubview:button];
    
    return button;
}

+ (UIButton *_Nonnull)rd_ButtonTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView{
    
    UIButton *button = [UIButton rd_ButtonTitle:title img:imgName target:target action:sel];
    [superView addSubview:button];
    
    return button;
}

+ (UIButton *_Nonnull)rd_ButtonJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    return button;
}

+ (UIButton *_Nonnull)rd_ButtonJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
    return button;
}

+ (UIButton *_Nonnull)rd_ButtonTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    if (Rd_FontNameNormal.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:Rd_FontNameNormal size:button.titleLabel.font.pointSize];
    }
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


@end

