//
//  RdCollectionView.h
//  RdToolsProject
//
//  Created by Rondo on 2020/4/8.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RdCollectionViewLayout : NSObject

- (instancetype)initWithSize:(CGSize)size edgeInset:(UIEdgeInsets)edgeInset;

@property (nonatomic) CGSize itemSize;

@property (nonatomic) UIEdgeInsets itemInset;

@end

@interface RdCollectionView : UIScrollView

@property (nonatomic, strong, readonly) UIView *contentView;

- (instancetype)initColor:(UIColor *)bgColor withLayout:(RdCollectionViewLayout *)layout forView:(UIView *)superView;

- (void)addItemView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
