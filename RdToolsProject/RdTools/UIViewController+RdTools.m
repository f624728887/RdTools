//
//  UIViewController+RdTools.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/19.
//  Copyright © 2018年 王佳兴. All rights reserved.
//

#import "UIViewController+RdTools.h"
#import "UIButton+RdTools.h"
#import "UILabel+RdTools.h"
#import "RdMacroFile.h"

@implementation UIViewController (RdTools)

typedef NS_ENUM(NSUInteger, RdBarButtonType) {
    RdBarButtonTypeLeft,
    RdBarButtonTypeRight,
    
    RdBarButtonTypeJustTitle,
    RdBarButtonTypeJustImg,
    RdBarButtonTypeTitleImg,
};

- (void)rd_ClearBarRightBtn{
    self.navigationItem.rightBarButtonItems = nil;
}

- (void)rd_ClearBarLeftBtn{
    self.navigationItem.leftBarButtonItems = nil;
}

- (UIButton *_Nonnull)rd_SetDefaultTitleBackBtn{
    [self rd_ClearBarLeftBtn];
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustTitle content:@"返回" target:self action:@selector(rd_backqweClick)];
}

- (UIButton *_Nonnull)rd_SetDefaultImgBackBtn{
    [self rd_ClearBarLeftBtn];
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustImg content:@"chargeBlack" target:self action:@selector(rd_backqweClick)];
}

- (UIButton *_Nonnull)rd_SetLeftBtnJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustTitle content:title target:target action:sel];
}

- (UIButton *_Nonnull)rd_SetLeftBtnJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustImg content:imgName target:target action:sel];
}

- (UIButton *_Nonnull)rd_SetLeftBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    return [self rd_SetBtnPos:RdBarButtonTypeLeft title:title imgName:imgName target:target action:sel];
}

- (UIButton *_Nonnull)rd_SetRightBtnJustTitle:(NSString *_Nonnull)title target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    return [self rd_SetBtnPos:RdBarButtonTypeRight type:RdBarButtonTypeJustTitle content:title target:target action:sel];
}

- (UIButton *_Nonnull)rd_SetRightBtnJustImg:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    return [self rd_SetBtnPos:RdBarButtonTypeRight type:RdBarButtonTypeJustImg content:imgName target:target action:sel];
    
}

- (UIButton *_Nonnull)rd_SetRightBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName target:(id _Nonnull)target action:(SEL _Nonnull)sel{
    return [self rd_SetBtnPos:RdBarButtonTypeRight title:title imgName:imgName target:target action:sel];
}

// 私有方法
- (UIButton *)rd_SetBtnPos:(RdBarButtonType)pos type:(RdBarButtonType)type content:(NSString *)content target:(id)target action:(SEL)action{
    UIButton *btn;
    CGFloat width = 0.0;
    if (type == RdBarButtonTypeJustTitle) {
        btn = [UIButton rd_ButtonJustTitle:content target:target action:action];
        btn.rd_setButtonTitleFontSize(Rd_FontSizeM).rd_setButtonTitleColorNormal(Rd_ColorWith(blackColor));
        width = [self rd_getBtnWidth:[btn.titleLabel rd_getLabelStringWidth]];
    }
    else if (type == RdBarButtonTypeJustImg) {
        btn = [UIButton rd_ButtonJustImg:content target:target action:action];
        width = [self rd_getBtnWidth:btn.imageView.image.size.width];
    }
    btn.frame = CGRectMake(0, 0, width, 44);
    if (pos == RdBarButtonTypeLeft && type == RdBarButtonTypeJustImg) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -(btn.frame.size.width - btn.imageView.image.size.width)/2.0, 0, (btn.frame.size.width - btn.imageView.image.size.width)/2.0);
    }
    else if (pos == RdBarButtonTypeRight && type == RdBarButtonTypeJustImg) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, (btn.frame.size.width - btn.imageView.image.size.width)/2.0, 0, -(btn.frame.size.width - btn.imageView.image.size.width)/2.0);
    }
    
    if (pos == RdBarButtonTypeLeft) {
        [self rd_BarBtnItemsAddLeftBtn:btn];
    }
    else {
        [self rd_BarBtnItemsAddRightBtn:btn];
    }
    return btn;
}

- (UIButton *)rd_SetBtnPos:(RdBarButtonType)pos title:(NSString *)title imgName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton rd_ButtonTitle:title img:imageName target:target action:action];
    CGFloat width = [self rd_getBtnWidth:(btn.imageView.image.size.width + [btn.titleLabel rd_getLabelStringWidth])];
    btn.frame = CGRectMake(0, 0, width, 44);
    btn.rd_setButtonTitleFontSize(Rd_FontSizeM).rd_setButtonTitleColorNormal(Rd_ColorWith(blackColor));
    if (pos == RdBarButtonTypeRight) {
        [self rd_BarBtnItemsAddRightBtn:btn];
    }
    else {
        [self rd_BarBtnItemsAddRightBtn:btn];
    }
    return btn;
}

- (void)rd_BarBtnItemsAddLeftBtn:(UIButton *_Nonnull)btn{
    UIBarButtonItem *tmp = [[UIBarButtonItem alloc] initWithCustomView:btn];
    NSMutableArray *array = [self.navigationItem.leftBarButtonItems mutableCopy];
    if (!array) {
        array = [NSMutableArray arrayWithCapacity:0];
    }
    [array addObject:tmp];
    self.navigationItem.leftBarButtonItems = array;
}

- (void)rd_BarBtnItemsAddRightBtn:(UIButton *_Nonnull)btn{
    UIBarButtonItem *tmp = [[UIBarButtonItem alloc] initWithCustomView:btn];
    NSMutableArray *array = [self.navigationItem.rightBarButtonItems mutableCopy];
    if (!array) {
        array = [NSMutableArray arrayWithCapacity:0];
    }
    [array addObject:tmp];
    self.navigationItem.rightBarButtonItems = array;
}

- (CGFloat)rd_getBtnWidth:(CGFloat)width{
    if (width < 44) {
        width = 44;
    }
    return width;
}

- (void)rd_backqweClick{
    NSLog(@"返回点击了");
    [self.navigationController popViewControllerAnimated:YES];
}

@end
