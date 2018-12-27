//
//  RdScrollView.h
//  Library
//
//  Created by Rondo_dada on 2018/4/11.
//  Copyright © 2018年 Chen Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RdScrollViewScrollModel) {
    RdScrollViewScrollHorizontal,
    RdScrollViewScrollVertical,
    RdScrollViewScrollNormal,
};

@interface RdScrollView : UIScrollView

@property (nonatomic, strong)UIView *rd_contentView;

+ (instancetype _Nonnull)rd_verticalScrollViewBgColor:(UIColor *_Nullable)bgColor for:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_horizontalScrollViewBgColor:(UIColor *_Nullable)bgColor for:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_ScrollViewBgColor:(UIColor *_Nullable)bgColor scrollModel:(RdScrollViewScrollModel)model for:(UIView *_Nonnull)superView;

@end
