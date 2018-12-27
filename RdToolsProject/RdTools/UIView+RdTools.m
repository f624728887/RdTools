//
//  UIView+RdTools.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIView+RdTools.h"
#import "Masonry.h"

@implementation UIView (RdTools)

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
        if (top != -1) {
            make.top.equalTo(superView).offset(top);
        }
        else {
            make.height.equalTo(@(widHei));
        }
        if (left != -1) {
            make.left.equalTo(superView).offset(left);
        }
        else {
            make.width.equalTo(@(widHei));
        }
        if (bottom != -1) {
            make.bottom.equalTo(superView).offset(bottom);
        }
        else {
            make.height.equalTo(@(widHei));
        }
        if (right != -1) {
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

@end

