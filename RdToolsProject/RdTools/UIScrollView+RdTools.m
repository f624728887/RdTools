//
//  UIScrollView+RdTools.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/12/29.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "UIScrollView+RdTools.h"
#import <objc/runtime.h>
#import "Masonry.h"

static char rdScrollViewContentViewKey;

@implementation UIScrollView (RdTools)

+ (instancetype _Nonnull)rd_HScrollView:(UIColor *_Nullable)bgColor forView:(UIView *)superView{
    UIScrollView *scrollView = [UIScrollView rd_ScrollView:bgColor forView:superView];
    
    [scrollView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.height.equalTo(scrollView);
    }];
    
    return scrollView;
}

+ (instancetype _Nonnull)rd_VScrollView:(UIColor *_Nullable)bgColor forView:(UIView *)superView{
    UIScrollView *scrollView = [UIScrollView rd_ScrollView:bgColor forView:superView];
    
    [scrollView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    return scrollView;
}

+ (instancetype _Nonnull)rd_ScrollView:(UIColor *_Nullable)bgColor forView:(UIView *)superView{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = bgColor? bgColor : [UIColor clearColor];
//    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.showsHorizontalScrollIndicator = NO;
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    
    [superView addSubview:scrollView];
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = bgColor? bgColor : [UIColor clearColor];
    [scrollView addSubview:contentView];
    [scrollView setContentView:contentView];
    
    return scrollView;
}

- (void)setContentView:(UIView *)contentView{
    objc_setAssociatedObject(self, &rdScrollViewContentViewKey, contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)contentView{
    UIView *content = objc_getAssociatedObject(self, &rdScrollViewContentViewKey);
    if (!content) {
        content = [[UIView alloc] init];
        
        [self addSubview:content];
        [self setContentView:content];
    }
    return content;
}

@end
