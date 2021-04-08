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

#pragma mark - 初始化
+ (instancetype _Nonnull)rd_BtnImage:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_BtnImage:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton * _Nonnull sender))block;



+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title forView:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block;



+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title image:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title image:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block;


+ (instancetype _Nonnull)rd_BtnBgColor:(UIColor *_Nonnull)color forView:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_BtnBgColor:(UIColor *_Nonnull)color forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block;


+ (instancetype _Nonnull)rd_BtnBgImg:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_BtnBgImg:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block;


#pragma mark - 方法
/// 设置按钮点击事件
- (void)rd_setButtonAction:(void (^_Nullable)(UIButton * _Nullable sender))block;

/// 设置按钮文字
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull title, UIControlState state))rd_setTitleWithState;

/// 设置按钮文字fontSize
- (UIButton *_Nonnull(^_Nonnull)(CGFloat fontSize))rd_setTitleFontSize;

/// 设置按钮文字font
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nullable fontName, CGFloat fontSize))rd_setTitleFont;

/// 设置按钮文字颜色
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color, UIControlState state))rd_setTitleColorWithState;

/// 设置按钮图片
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName, UIControlState state))rd_setImageWithState;

/// 设置按钮背景色（颜色转图片）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color, UIControlState state))rd_setBgColorWithState;

/// 设置按钮背景图片
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName, UIControlState state))rd_setBgImageWithState;

/// 设置button 图片位置 （ rd_setXXX(UIButtonImageRight) ）****（用在布局方法之后）
- (UIButton *_Nonnull(^_Nonnull)(RdButtonImageType type))rd_setButtonImageType;






#pragma mark - 以下方法废弃使用

+ (instancetype _Nonnull)rd_BtnImage:(NSString *_Nonnull)imgName DEPRECATED_MSG_ATTRIBUTE("废弃方法");

+ (instancetype _Nonnull)rd_BtnImage:(NSString *_Nonnull)imgName responder:(void (^_Nullable)(UIButton *_Nonnull sender))block DEPRECATED_MSG_ATTRIBUTE("废弃方法");

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title DEPRECATED_MSG_ATTRIBUTE("废弃方法");

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title responder:(void (^_Nullable)(UIButton *_Nonnull sender))block DEPRECATED_MSG_ATTRIBUTE("废弃方法");

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title image:(NSString *_Nonnull)imgName DEPRECATED_MSG_ATTRIBUTE("废弃方法");

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *_Nonnull)title image:(NSString *_Nonnull)imgName responder:(void (^_Nullable)(UIButton *_Nonnull sender))block DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// color为 nil 时背景色为clearColor
+ (instancetype _Nonnull)rd_BtnBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView DEPRECATED_MSG_ATTRIBUTE("废弃方法");

+ (instancetype _Nonnull)rd_BtnBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button title （ rd_setXXX(title) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull title))rd_setButtonTitle DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button 选中 title （ rd_setXXX(title) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString *_Nonnull title))rd_setButtonTitleSelected DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button title 字号 （ rd_setXXX(fontSize) ）
- (UIButton *_Nonnull(^_Nonnull)(CGFloat fontSize))rd_setButtonTitleFontSize DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button title 字体和字号 （ rd_setXXX(fontName, fontSize) ） fontName为 nil 时为默认
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nullable fontName, CGFloat fontSize))rd_setButtonTitleFont DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button title颜色 （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorNormal DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button title颜色 （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorSelected DEPRECATED_MSG_ATTRIBUTE("废弃方法");

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorDisabled DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button 高亮 title颜色 （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorHightlighted DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button normal 背景颜色（颜色转图片） （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorNormal DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button selected 背景颜色（颜色转图片） （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorSelected DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button hightlighted 背景颜色（颜色转图片） （ rd_setXXX(color) ）
- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorHightlighted DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button normal 背景图片（ rd_setXXX(image) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageNormal DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button Selected 背景图片（ rd_setXXX(image) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageSelected DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button hightlighted 背景图片（ rd_setXXX(image) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageHightlighted DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button normal 图片 （ rd_setXXX(imageName) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageNormal DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button Selected 图片 （ rd_setXXX(imageName) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageSelected DEPRECATED_MSG_ATTRIBUTE("废弃方法");

/// 设置button Disabled 图片 （ rd_setXXX(imageName) ）
- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageDisabled DEPRECATED_MSG_ATTRIBUTE("废弃方法");

@end

