//
//  UITextField+RdTools.h
//  Library
//
//  Created by Rondo_dada on 2018/12/10.
//  Copyright © 2018 Chen Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (RdTools)

+ (instancetype _Nonnull)rd_FieldBgColor:(UIColor *_Nullable)bgColor fontName:(NSString *_Nullable)fontName fontSize:(CGFloat)size textColor:(UIColor *)textColor placeholder:(NSString *_Nullable)placeholder returnType:(UIReturnKeyType)returnType borderStyle:(UITextBorderStyle)borderStyle keyboardType:(UIKeyboardType)keyboardType superView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
