//
//  NSMutableAttributedString+RdTools.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/4/3.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (RdTools)

+ (NSMutableAttributedString *_Nonnull)rd_AttributeString:(NSString *_Nonnull)string fontName:(NSString *_Nullable)name fontSize:(CGFloat)size strColor:(UIColor *_Nullable)color;

+ (NSMutableAttributedString *_Nonnull)rd_HtmlAttributeString:(NSString *_Nonnull)string fontName:(NSString *_Nullable)name fontSize:(CGFloat)size textColor:(UIColor *_Nullable)color;

/// 设置颜色 rd_setAttributeStringColor（color, startIdx, leagth） 从0开始数
- (NSMutableAttributedString *_Nonnull (^_Nonnull)(UIColor * _Nonnull color, NSInteger startIdx, NSInteger leagth))rd_setAttributeStringColor;

/// 设置粗体 rd_setAttributeStringStrong（strongFontName, fontSize, startIdx, leagth） 从0开始数
- (NSMutableAttributedString *_Nonnull (^_Nonnull)(NSString * _Nonnull strongFontName, CGFloat fontSize, NSInteger startIdx, NSInteger leagth))rd_setAttributeStringStrong;

/// 设置斜体 rd_setAttributeStringEm（startIdx, leagth） 从0开始数
- (NSMutableAttributedString *_Nonnull (^_Nonnull)(CGFloat value, NSInteger startIdx, NSInteger leagth))rd_setAttributeStringEm;

@end
