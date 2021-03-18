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

- (instancetype _Nonnull)initWithSize:(CGSize)size edgeInset:(UIEdgeInsets)edgeInset;

@property (nonatomic) CGSize itemSize;

@property (nonatomic) UIEdgeInsets itemInset;

@end

@interface RdCollectionView : UIScrollView

@property (nonatomic, strong, readonly) UIView *contentView;

- (instancetype _Nonnull)initColor:(UIColor *_Nullable)bgColor withLayout:(RdCollectionViewLayout *_Nonnull)layout forView:(UIView *_Nonnull)superView;

- (void)addItemView:(UIView *_Nonnull)view;

@end

NS_ASSUME_NONNULL_END
