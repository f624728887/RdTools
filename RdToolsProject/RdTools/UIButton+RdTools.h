//
//  UIButton+RdTools.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/16.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (RdTools)

typedef NS_ENUM(NSUInteger, RdButtonImageType) {
    RdButtonImageLeft,
    RdButtonImageRight,
    RdButtonImageBottom,
};

/// color为 nil 时背景色为clearColor
+ (UIButton *_Nonnull)rd_ButtonBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView;

+ (UIButton *_Nonnull)rd_ButtonBGColor:(UIColor *_Nullable)bgColor target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView;

+ (UIButton *_Nonnull)rd_ButtonJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView;

+ (UIButton *_Nonnull)rd_ButtonJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView;

+ (UIButton *_Nonnull)rd_ButtonTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel superView:(UIView *_Nonnull)superView;

+ (UIButton *_Nonnull)rd_ButtonJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel;

+ (UIButton *_Nonnull)rd_ButtonJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel;

+ (UIButton *_Nonnull)rd_ButtonTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel;

/// 设置button title （ rd_setXXX(title) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull title))rd_setButtonTitle;

/// 设置button 选中 title （ rd_setXXX(title) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString *_Nonnull title))rd_setButtonTitleSelected;

/// 设置button title 字号 （ rd_setXXX(fontSize) ）
- (UIButton *_Nonnull(^_Nonnull)(CGFloat fontSize))rd_setButtonTitleFontSize;

/// 设置button title 字体和字号 （ rd_setXXX(fontName, fontSize) ） fontName为 nil 时为默认
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nullable fontName, CGFloat fontSize))rd_setButtonTitleFont;

/// 设置button title颜色 （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorNormal;

/// 设置button title颜色 （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorSelected;

/// 设置button 高亮 title颜色 （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorHightlighted;

/// 设置button normal 背景颜色（颜色转图片） （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorNormal;

/// 设置button selected 背景颜色（颜色转图片） （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorSelected;

/// 设置button hightlighted 背景颜色（颜色转图片） （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorHightlighted;

/// 设置button normal 背景图片（ rd_setXXX(image) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageNormal;

/// 设置button hightlighted 背景图片（ rd_setXXX(image) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageHightlighted;

/// 设置button normal 图片 （ rd_setXXX(imageName) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageNormal;

/// 设置button Selected 图片 （ rd_setXXX(imageName) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageSelected;

/// 设置button Disabled 图片 （ rd_setXXX(imageName) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageDisabled;

/// 设置button 图片位置 （ rd_setXXX(UIButtonImageRight) ）****（用在布局方法之后）
- (UIButton *_Nonnull(^_Nonnull)(RdButtonImageType type))rd_setButtonImageType;

@end

