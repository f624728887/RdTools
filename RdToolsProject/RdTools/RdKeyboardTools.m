//
//  RdKeyboardTools.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/26.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "RdKeyboardTools.h"
#import "RdMacroFile.h"

@interface RdKeyboardTools ()

@property (nonatomic, copy)void (^keyboardShow)(CGFloat time, CGFloat keyboardHei);
@property (nonatomic, copy)void (^keyboardHidden)(CGFloat time, CGFloat keyboardHei);

@end

@implementation RdKeyboardTools

- (instancetype _Nonnull)init{
    self = [super init];
    if (self) {
        [self addObsever];
    }
    return self;
}

- (void)addObsever{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

#pragma mark - 键盘方法
- (void)keyboardWillShow:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSString *str = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat keyBoardHei = keyboardRect.size.height;
    
    [self resetEditViewWith:[str doubleValue] KeyBoardHei:keyBoardHei Type:YES];
}

- (void)keyboardWillHide:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSString *str = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat keyBoardHei = keyboardRect.size.height;
    
    [self resetEditViewWith:[str doubleValue] KeyBoardHei:keyBoardHei Type:NO];
}

- (void)resetEditViewWith:(CGFloat)tim KeyBoardHei:(CGFloat)keyBoardHei Type:(BOOL)show{
    if (show) {
        if (self.keyboardShow) {
            self.keyboardShow(tim, keyBoardHei);
        }
    }
    else {
        if (self.keyboardHidden) {
            self.keyboardHidden(tim, Rd_SafeAreaBottom);
        }
    }
}

- (void)rd_setShow:(void (^)(CGFloat time, CGFloat kbHeight))block{
    self.keyboardShow = block;
}
- (void)rd_setHidden:(void (^)(CGFloat time, CGFloat kbHeight))block{
    self.keyboardHidden = block;
}

- (void)rd_KeyboardRemoveObserver{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
