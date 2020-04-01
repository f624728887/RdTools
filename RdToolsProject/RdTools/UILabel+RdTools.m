//
//  UILabel+RdTools.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UILabel+RdTools.h"
#import "RdMacroFile.h"
#import "Masonry.h"
#import "RdToolsManager.h"
#import <objc/runtime.h>

static UILabel *onceLabel = nil;
static char rdLabelDefaultFontNameKey;

@interface UILabel ()

@property (nonatomic, strong) NSString *rd_fontName;

@end

@implementation UILabel (RdTools)

+ (instancetype _Nonnull)rd_sharedLabel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        onceLabel = [[UILabel allocWithZone:NULL] init];
    });
    return onceLabel;
}


+ (void)rd_setLabelDefaulFontName:(NSString *)name{
    UILabel *label = [UILabel rd_sharedLabel];
    [label setRd_fontName:name];
}

+ (NSString *)rd_getLabelDefaulFontName{
    UILabel *label = [UILabel rd_sharedLabel];
    return (label.rd_fontName == nil ? @"" : label.rd_fontName);
}

- (void)setRd_fontName:(NSString *)rd_fontName{
    objc_setAssociatedObject(self, &rdLabelDefaultFontNameKey, rd_fontName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)rd_fontName{
    return objc_getAssociatedObject(self, &rdLabelDefaultFontNameKey);
}


+ (instancetype _Nonnull)rd_LabelString:(NSString *_Nullable)string fontName:(NSString *_Nullable)name fontSize:(CGFloat)size lineNumber:(NSInteger)number textColor:(UIColor *_Nullable)color superView:(UIView *_Nonnull)superView{
    UILabel *label = [[UILabel alloc] init];
    label.text = string == nil ? @"" : string;
    
    if (name == nil) {
        if (Rd_FontNameNormal.length != 0) {
            label.font = [UIFont fontWithName:Rd_FontNameNormal size:size];
        }
        else {
            label.font = [UIFont systemFontOfSize:size];
        }
    }
    else {
        label.font = [UIFont fontWithName:name size:size];
    }
    label.numberOfLines = number;
    label.textColor = color == nil ? [UIColor blackColor] : color;
    [superView addSubview:label];
    
    if (number == 1) {
        UILabel *temp = [[UILabel alloc] init];
        temp.text = label.text;
        temp.font = label.font;
        temp.numberOfLines = label.numberOfLines;
        if (temp.text.length == 0) {
            temp.text = @"123";
        }
        [label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@([temp rd_getLabelStringRect].height));
        }];
    }
    
    return label;
}

- (void)rd_setTextAlignmentRight{
    self.textAlignment = NSTextAlignmentRight;
}
- (void)rd_setTextAlignmentCenter{
    self.textAlignment = NSTextAlignmentCenter;
}

- (void)rd_setTextWidthFit:(NSString *)text{
    self.text = text;
    [self rd_labelWidthApading];
}

- (void)rd_labelWidthApading{
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@([self rd_getLabelStringRect].width));
    }];
}

/// 根据label的宽度计算行数
- (NSInteger)rd_getLabelNumberOfLineWithWidth:(CGFloat)width{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 100000)];
    label.text = self.text;
    label.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize];
    label.numberOfLines = 0;
    [label sizeToFit];
    
    
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:self.font.fontName size:self.font.pointSize]} context:nil];
    CGSize textSize = [label.text sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:self.font.fontName size:self.font.pointSize]}];
    NSUInteger textRow = (NSUInteger)(rect.size.height / textSize.height);
    
    return textRow;
}

- (CGFloat)rd_getLabelStringHeightWithWidth:(CGFloat)width{
    CGSize strSize = [self sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    return strSize.height;
}

- (CGSize)rd_getLabelStringRect{
    CGSize strSize = [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    return strSize;
}

- (CGFloat)rd_getLabelStringWidth{
    return [self rd_getLabelStringRect].width;
}

+ (CGFloat)rd_getLabelHeightWithSize:(CGFloat)size{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"123";
    label.font = [UIFont fontWithName:Rd_FontNameNormal size:size];
    label.numberOfLines = 1;
    return [label rd_getLabelStringRect].height;
}

+ (CGFloat)rd_getLabelHeightWithFontName:(NSString *)name size:(CGFloat)size{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"123";
    label.font = [UIFont fontWithName:name size:size];
    label.numberOfLines = 1;
    return [label rd_getLabelStringRect].height;
}

+ (CGFloat)rd_getLabelWidth:(NSString *)content fontName:(NSString *)name fontSize:(CGFloat)size{
    UILabel *label = [[UILabel alloc] init];
    label.text = content;
    if (name == nil) {
        label.font = [UIFont systemFontOfSize:size];
    }
    else {
        label.font = [UIFont fontWithName:name size:size];
    }
    
    return [label sizeThatFits:CGSizeMake(100000000, 100000000)].width;
}


@end

