//
//  UILabel+RdTools.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (RdTools)

+ (instancetype _Nonnull)rd_sharedLabel;

/// 该方法内部使用单例实现，所以在Appdelegate设置一次即可全局使用。
+ (void)rd_setLabelDefaulFontName:(NSString *_Nonnull)name;

+ (NSString *_Nonnull)rd_getLabelDefaulFontName;

+ (instancetype _Nonnull)rd_LabelString:(NSString *_Nullable)string fontName:(NSString *_Nullable)name fontSize:(CGFloat)size lineNumber:(NSInteger)number textColor:(UIColor *_Nullable)color superView:(UIView *_Nonnull)superView;

- (void)rd_setTextAlignmentRight;
- (void)rd_setTextAlignmentCenter;

/// 该方法只适用于一行不定宽的label
- (void)rd_setTextWidthFit:(NSString *_Nonnull)text;

- (void)rd_labelWidthApading;

/// 根据label的宽度计算行数
- (NSInteger)rd_getLabelNumberOfLineWithWidth:(CGFloat)width;

///计算多行label的height
- (CGFloat)rd_getLabelStringHeightWithWidth:(CGFloat)width;

/// 计算单行label的rect
- (CGSize)rd_getLabelStringRect;

/// 计算单行label的Width
- (CGFloat)rd_getLabelStringWidth;

/// 根据字号计算单行高度label
+ (CGFloat)rd_getLabelHeightWithSize:(CGFloat)size;

/// 根据字型、字号计算单行高度label
+ (CGFloat)rd_getLabelHeightWithFontName:(NSString *_Nonnull)name size:(CGFloat)size;

/// 根据内容，字型，字号计算
+ (CGFloat)rd_getLabelWidth:(NSString *_Nonnull)content fontName:(NSString *_Nullable)name fontSize:(CGFloat)size;

@end
