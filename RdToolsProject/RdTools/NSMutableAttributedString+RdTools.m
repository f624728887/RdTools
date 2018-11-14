//
//  NSMutableAttributedString+RdTools.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/4/3.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "NSMutableAttributedString+RdTools.h"
#import "RdMacroFile.h"

@implementation NSMutableAttributedString (RdTools)

+ (NSMutableAttributedString *_Nonnull)rd_AttributeString:(NSString *_Nonnull)string fontName:(NSString *_Nullable)name fontSize:(CGFloat)size strColor:(UIColor *_Nullable)color{
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (name == nil) {
        if (Rd_FontNameNormal.length != 0) {
            [attStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:Rd_FontNameNormal size:size] range:NSMakeRange(0, attStr.length)];
        }
        else {
            [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:NSMakeRange(0, attStr.length)];
        }
    }
    else {
        [attStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:name size:size] range:NSMakeRange(0, attStr.length)];
    }
    
    if (color != nil) {
        [attStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attStr.length)];
    }
    
    return attStr;
}

+ (NSMutableAttributedString *_Nonnull)rd_HtmlAttributeString:(NSString *_Nonnull)string fontName:(NSString *_Nullable)name fontSize:(CGFloat)size textColor:(UIColor *_Nullable)color{
    
    NSString *content = [NSString stringWithFormat:@"<html><body style=\"font-family:%@; font-size:%fpx\">%@</body></html>", (name ? name : @"PingFangSC-Light"), size, string];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithData:[content dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    attrStr.rd_setAttributeStringColor(color, 0, attrStr.length);
    
    return attrStr;
}

- (NSMutableAttributedString *_Nonnull (^_Nonnull)(UIColor * _Nonnull color, NSInteger startIdx, NSInteger leagth))rd_setAttributeStringColor{
    return ^(UIColor * _Nonnull color, NSInteger startIdx, NSInteger leagth) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startIdx, leagth)];
        return self;
    };
}

/// 设置粗体 rd_setAttributeStringStrong（strongFontName, startIdx, leagth） 从0开始数
- (NSMutableAttributedString *_Nonnull (^_Nonnull)(NSString * _Nonnull strongFontName, CGFloat fontSize, NSInteger startIdx, NSInteger leagth))rd_setAttributeStringStrong{
    return ^(NSString * _Nonnull strongFontName, CGFloat fontSize, NSInteger startIdx, NSInteger leagth) {
        [self addAttribute:NSFontAttributeName value:[UIFont fontWithName:Rd_FontNameNormal size:fontSize] range:NSMakeRange(startIdx, leagth)];
        return self;
    };
}

/// 设置斜体 rd_setAttributeStringEm（startIdx, leagth） 从0开始数
- (NSMutableAttributedString *_Nonnull (^_Nonnull)(CGFloat value, NSInteger startIdx, NSInteger leagth))rd_setAttributeStringEm{
    return ^(CGFloat value, NSInteger startIdx, NSInteger leagth) {
        // NSObliquenessAttributeName  value为一个浮点数，0为不倾斜，正值右倾斜，负值左倾斜。
        [self addAttribute:NSObliquenessAttributeName value:@(value) range:NSMakeRange(startIdx, leagth)];
        return self;
    };
}

@end
