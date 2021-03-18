//
//  UIScrollView+RdTools.h
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/12/29.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (RdTools)

@property (nonatomic, strong, readonly) UIView *contentView;

/// 水平滑动scrollView， 子View应该添加在contentView上，水平滑动时候需要设置contentView的宽度（高度已经设定好了，等于scrollView的高度）。
+ (instancetype _Nonnull)rd_HScrollView:(UIColor *_Nullable)bgColor forView:(UIView *_Nonnull)superView;

/// 垂直滑动scollView， 子View应该添加在contentView上，垂直滑动时候需要设置contentView的高度（宽度已经设定好了，等于scrollView的宽度）。
+ (instancetype _Nonnull)rd_VScrollView:(UIColor *_Nullable)bgColor forView:(UIView *_Nonnull)superView;

/// 子View应该添加在contentView上，需要设置contentView的宽度和高度。
+ (instancetype _Nonnull)rd_ScrollView:(UIColor *_Nullable)bgColor forView:(UIView *_Nonnull)superView;

@end

NS_ASSUME_NONNULL_END
