//
//  RdCollectionView.m
//  RdToolsProject
//
//  Created by Rondo on 2020/4/8.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import "RdCollectionView.h"
#import "UIScrollView+RdTools.h"
#import "RdToolsHeader.h"

@implementation RdCollectionViewLayout

- (instancetype _Nonnull)initWithSize:(CGSize)size edgeInset:(UIEdgeInsets)edgeInset{
    self = [super init];
    if (self) {
        self.itemSize = size;
        self.itemInset = edgeInset;
    }
    return self;
}

@end

@interface RdCollectionView ()

@property (nonatomic, strong) RdCollectionViewLayout *layout;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

@end

@implementation RdCollectionView

- (instancetype _Nonnull)initColor:(UIColor *)bgColor withLayout:(RdCollectionViewLayout *)layout forView:(UIView *)superView{
    self = [super init];
    if (self) {
        self.backgroundColor = bgColor ? bgColor : [UIColor clearColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        }
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = bgColor? bgColor : [UIColor clearColor];
        [self addSubview:_contentView];
        _contentView.rd_edgeEqualTo(0, 0, 0, 0).rd_widthMultipliedBy(nil, 1);
        
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.layout = layout;
    }
    [superView addSubview:self];
    return self;
}

- (void)addItemView:(UIView *)view{
    CGFloat superWidth = [self.contentView rd_getFrame].size.width;
    NSArray *subviews = [self.contentView subviews];
    
    CGFloat leftPoint = self.layout.itemInset.left, topPoint = self.layout.itemInset.top;
    
    if (subviews.count) {
        UIView *lastView = subviews.lastObject;
        
//        CGFloat lastTop = lastView.rd_MaxY + self.layout.itemInset.bottom + self.layout.itemInset.top;
        
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            CGFloat futureLeft = lastView.rd_MaxX + self.layout.itemInset.right + self.layout.itemInset.left;
            // 不换行
            if ((futureLeft + self.layout.itemSize.width + self.layout.itemInset.right) <= superWidth) {
                leftPoint = futureLeft;
                topPoint = lastView.rd_MinY;
            }
            // 换行
            else {
                topPoint = lastView.rd_MaxY + self.layout.itemInset.bottom + self.layout.itemInset.top;
                leftPoint = self.layout.itemInset.left;
            }
        }
    }
    
    [self.contentView addSubview:view];
    view.rd_edgeEqualTo(topPoint, leftPoint, Rd_IGNORE, Rd_IGNORE).rd_sizeValue(self.layout.itemSize.width, self.layout.itemSize.height).rd_bottomLessOrEqualTo(nil, -self.layout.itemInset.bottom);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
