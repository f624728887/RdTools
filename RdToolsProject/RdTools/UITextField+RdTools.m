//
//  UITextField+RdTools.m
//  Library
//
//  Created by Rondo_dada on 2018/12/10.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "UITextField+RdTools.h"
#import "RdMacroFile.h"

@implementation UITextField (RdTools)

+ (instancetype _Nonnull)rd_FieldBgColor:(UIColor *_Nullable)bgColor fontName:(NSString *_Nullable)fontName fontSize:(CGFloat)size textColor:(UIColor *)textColor placeholder:(NSString *_Nullable)placeholder returnType:(UIReturnKeyType)returnType borderStyle:(UITextBorderStyle)borderStyle keyboardType:(UIKeyboardType)keyboardType superView:(UIView *)superView{
    UITextField *field = [[UITextField alloc] init];
    if (fontName == nil) {
        if (Rd_FontNameNormal.length != 0) {
            field.font = [UIFont fontWithName:Rd_FontNameNormal size:size];
        }
        else {
            field.font = [UIFont systemFontOfSize:size];
        }
    }
    else {
        field.font = [UIFont fontWithName:fontName size:size];
    }
    if (placeholder != nil) {
        field.placeholder = placeholder;
    }
    field.textColor = textColor;
    field.backgroundColor = bgColor == nil ? [UIColor clearColor] : bgColor;
    field.borderStyle = borderStyle;
    field.returnKeyType = returnType;
    field.keyboardType = keyboardType;
    [superView addSubview:field];
    
    return field;
}

@end
