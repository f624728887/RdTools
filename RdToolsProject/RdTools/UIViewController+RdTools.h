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
- (UIButton *_Nonnull)rd_SetLeftBtnJustTitle:(NSString *_Nonnull)title responder:(void (^)(UIButton *sender))block;

- (UIButton *_Nonnull)rd_SetLeftBtnJustImg:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block;

- (UIButton *_Nonnull)rd_SetLeftBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block;

// 右
- (UIButton *_Nonnull)rd_SetRightBtnJustTitle:(NSString *_Nonnull)title responder:(void (^)(UIButton *sender))block;

- (UIButton *_Nonnull)rd_SetRightBtnJustImg:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block;

- (UIButton *_Nonnull)rd_SetRightBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block;

@end
