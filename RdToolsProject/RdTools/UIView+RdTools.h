//
//  UIView+RdTools.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RdTools)

@property (nonatomic, assign, readonly) CGFloat rd_MinX;
@property (nonatomic, assign, readonly) CGFloat rd_MidX;
@property (nonatomic, assign, readonly) CGFloat rd_MaxX;

@property (nonatomic, assign, readonly) CGFloat rd_MinY;
@property (nonatomic, assign, readonly) CGFloat rd_MidY;
@property (nonatomic, assign, readonly) CGFloat rd_MaxY;

@property (nonatomic, assign, readonly) CGFloat rd_Width;
@property (nonatomic, assign, readonly) CGFloat rd_Height;

+ (instancetype _Nonnull)rd_ViewBGColor:(UIColor *_Nullable)bgColor for:(UIView *_Nonnull)superView;


+ (instancetype _Nonnull)rd_LineColor:(UIColor *_Nonnull)color widthOrHeight:(CGFloat)widHei topMargin:(CGFloat)top leftMargin:(CGFloat)left bottomMargin:(CGFloat)bottom rightMargin:(CGFloat)right for:(UIView *_Nonnull)superView;

/// 设置圆角 （ rd_cornerRadius(5) ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat radius))rd_setLayerCornerRadius;

/// 设置边框颜色 （ rd_borderColor(color) ）
- (UIView *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setLayerBorderColor;

/// 设置边框宽度 （ rd_borderWidth(1) ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_setLayerBorderWidth;

/// 设置边框宽度 （ rd_borderWidthColor(1, colot) ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat width, UIColor *_Nonnull color))rd_setLayerBorderWidthColor;

/// 设置超出部分剪切
- (UIView *_Nonnull(^_Nonnull)(BOOL isClips))rd_setViewIsClipsToBounds;

- (void)rd_removeAllSubViews;

- (void)rd_animation;

- (void)rd_setSingleTap:(void (^)(UITapGestureRecognizer *sender))block;

- (CGRect)rd_getFrame;

@end

