//
//  UIView+RdTools.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIView+RdTools.h"
#import "Masonry.h"
#import "RdMacroFile.h"
#import <objc/runtime.h>

static char rdViewActionBlockKey;
static char rdViewLongPressBeganKey;
static char rdViewLongPressEndKey;

@interface UIView ()

@property (nonatomic, copy) void (^rdActionBlock)(UITapGestureRecognizer *sender);
@property (nonatomic, copy) void (^rdBeganLongPressBlock)(UILongPressGestureRecognizer *sender);
@property (nonatomic, copy) void (^rdEndLongPressBlock)(UILongPressGestureRecognizer *sender);

@end

@implementation UIView (RdTools)

- (CGFloat)rd_MinX{
    return CGRectGetMinX([self rd_getFrame]);
}

- (CGFloat)rd_MidX{
    return CGRectGetMidX([self rd_getFrame]);
}

- (CGFloat)rd_MaxX{
    return CGRectGetMaxX([self rd_getFrame]);
}

- (CGFloat)rd_MinY{
    return CGRectGetMinY([self rd_getFrame]);
}

- (CGFloat)rd_MidY{
    return CGRectGetMidY([self rd_getFrame]);
}

- (CGFloat)rd_MaxY{
    return CGRectGetMaxY([self rd_getFrame]);
}

- (CGFloat)rd_Width{
    return CGRectGetWidth([self rd_getFrame]);
}

- (CGFloat)rd_Height{
    return CGRectGetHeight([self rd_getFrame]);
}

- (CGRect)rd_Frame{
    [self.superview layoutIfNeeded];
    return self.frame;
}

+ (instancetype _Nonnull)rd_ViewBGColor:(UIColor *_Nullable)bgColor{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    view.clipsToBounds = YES;
    
    return view;
}

+ (instancetype _Nonnull)rd_ViewBGColor:(UIColor *_Nullable)bgColor for:(UIView *_Nonnull)superView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    [superView addSubview:view];
    
    view.clipsToBounds = YES;
    
    return view;
}

+ (instancetype _Nonnull)rd_LineColor:(UIColor *_Nonnull)color widthOrHeight:(CGFloat)widHei topMargin:(CGFloat)top leftMargin:(CGFloat)left bottomMargin:(CGFloat)bottom rightMargin:(CGFloat)right for:(UIView *_Nonnull)superView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    [superView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (top != CGFLOAT_MAX) {
            make.top.equalTo(superView).offset(top);
        }
        else {
            make.height.equalTo(@(widHei));
        }
        if (left != CGFLOAT_MAX) {
            make.left.equalTo(superView).offset(left);
        }
        else {
            make.width.equalTo(@(widHei));
        }
        if (bottom != CGFLOAT_MAX) {
            make.bottom.equalTo(superView).offset(bottom);
        }
        else {
            make.height.equalTo(@(widHei));
        }
        if (right != CGFLOAT_MAX) {
            make.right.equalTo(superView).offset(right);
        }
        else {
            make.width.equalTo(@(widHei));
        }
    }];
    
    return view;
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat radius))rd_setLayerCornerRadius{
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setLayerBorderColor{
    return ^(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_setLayerBorderWidth{
    return ^(CGFloat width) {
        self.layer.borderWidth = width;
        return self;
    };
}

/// 设置边框宽度 （ rd_borderWidthColor(1, colot) ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat width, UIColor *_Nonnull color))rd_setLayerBorderWidthColor{
    return ^(CGFloat width, UIColor *color) {
        self.layer.borderWidth = width;
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(BOOL isClips))rd_setViewIsClipsToBounds{
    return  ^(BOOL isClips) {
        self.clipsToBounds = isClips;
        return self;
    };
}

- (void)rd_removeAllSubViews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)rd_animation{
    [self.superview layoutIfNeeded];
}

- (CGRect)rd_getFrame{
    [self.superview layoutIfNeeded];
    return self.frame;
}

- (void)rd_setSingleTap:(void (^)(UITapGestureRecognizer *sender))block{
    //单击的手势
    UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapRecognize.numberOfTapsRequired = 1;
//    tapRecognize.delegate = self;
    [tapRecognize setEnabled :YES];
//    [tapRecognize delaysTouchesBegan];
//    [tapRecognize cancelsTouchesInView];
    
    [self addGestureRecognizer:tapRecognize];
    
    if ([self isKindOfClass:[UILabel class]]) {
        self.userInteractionEnabled = YES;
    }
    
    [self setRdActionBlock:block];
}

- (void)handleTap:(UITapGestureRecognizer *)sender{
    if (self.rdActionBlock) {
        self.rdActionBlock(sender);
    }
}

- (void)setRdActionBlock:(void (^)(UITapGestureRecognizer *))rdActionBlock{
    objc_setAssociatedObject(self, &rdViewActionBlockKey, rdActionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UITapGestureRecognizer *))rdActionBlock{
    return objc_getAssociatedObject(self, &rdViewActionBlockKey);
}

- (void)rd_setLongPressBegan:(void (^_Nullable)(UILongPressGestureRecognizer * _Nonnull sender))beganPressBlock end:(void (^_Nullable)(UILongPressGestureRecognizer * _Nonnull sender))endPressBlock{
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    longPress.allowableMovement = 20;
//    longPress.cancelsTouchesInView = NO;
    [self addGestureRecognizer:longPress];
    
    if (beganPressBlock) {
        [self setRdBeganLongPressBlock:beganPressBlock];
    }
    if (endPressBlock) {
        [self setRdEndLongPressBlock:endPressBlock];
    }
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        if (self.rdBeganLongPressBlock) {
            Rd_Tapic
            self.rdBeganLongPressBlock(sender);
        }
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.rdEndLongPressBlock) {
            Rd_Tapic
            self.rdEndLongPressBlock(sender);
        }
    }
}

- (void)setRdBeganLongPressBlock:(void (^)(UILongPressGestureRecognizer *))rdBeganLongPressBlock{
    objc_setAssociatedObject(self, &rdViewLongPressBeganKey, rdBeganLongPressBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UILongPressGestureRecognizer *))rdBeganLongPressBlock{
    return objc_getAssociatedObject(self, &rdViewLongPressBeganKey);
}

- (void)setRdEndLongPressBlock:(void (^)(UILongPressGestureRecognizer *))rdEndLongPressBlock{
    objc_setAssociatedObject(self, &rdViewLongPressEndKey, rdEndLongPressBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UILongPressGestureRecognizer *))rdEndLongPressBlock{
    return objc_getAssociatedObject(self, &rdViewLongPressEndKey);
}

@end

