//
//  RdScrollView.m
//  Library
//
//  Created by Rondo_dada on 2018/4/11.
//  Copyright © 2018年 Chen Qi. All rights reserved.
//

#import "RdScrollView.h"
#import "Masonry.h"

@implementation RdScrollView

+ (RdScrollView *_Nonnull)rd_ScrollViewBgColor:(UIColor *_Nullable)bgColor scrollModel:(RdScrollViewScrollModel)model for:(UIView *_Nonnull)superView{
    RdScrollView *view = [[RdScrollView alloc] init];
    view.backgroundColor = bgColor ? bgColor : [UIColor clearColor];
    view.showsVerticalScrollIndicator = NO;
    view.showsHorizontalScrollIndicator = NO;
    if (@available(iOS 11.0, *)) {
        view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    [superView addSubview:view];
    
    view.rd_contentView = [[UIView alloc] init];
    view.backgroundColor = bgColor ? bgColor : [UIColor clearColor];
    [view addSubview:view.rd_contentView];
    
    [view.rd_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
        if (model == RdScrollViewScrollVertical) {
            make.width.equalTo(view);
        }
        else if (model == RdScrollViewScrollHorizontal) {
            make.height.equalTo(view);
        }
    }];
    
    return view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
