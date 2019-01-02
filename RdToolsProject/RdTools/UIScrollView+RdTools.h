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

+ (instancetype)rd_HScrollView:(UIColor *_Nullable)bgColor forView:(UIView *)superView;

+ (instancetype)rd_VScrollView:(UIColor *_Nullable)bgColor forView:(UIView *)superView;

+ (instancetype)rd_ScrollView:(UIColor *_Nullable)bgColor forView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
