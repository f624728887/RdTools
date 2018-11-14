//
//  UIViewController+RdTools.h
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/19.
//  Copyright © 2018年 王佳兴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RdTools)

- (void)rd_ClearBarRightBtn;
- (void)rd_ClearBarLeftBtn;

/// 返回
- (UIButton *_Nonnull)rd_SetDefaultTitleBackBtn;
- (UIButton *_Nonnull)rd_SetDefaultImgBackBtn;

// 左
- (UIButton *_Nonnull)rd_SetLeftBtnJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel;

- (UIButton *_Nonnull)rd_SetLeftBtnJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel;

- (UIButton *_Nonnull)rd_SetLeftBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel;

// 右
- (UIButton *_Nonnull)rd_SetRightBtnJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel;

- (UIButton *_Nonnull)rd_SetRightBtnJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel;

- (UIButton *_Nonnull)rd_SetRightBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel;

@end
