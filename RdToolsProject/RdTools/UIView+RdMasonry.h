//
//  UIView+RdMasonry.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/12.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RdMasonry)

/**
 *等于
 */
/// 设置宽高（ rd_widthAndHeightValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat value))rd_squareLengthValue;
- (UIView *_Nonnull(^_Nonnull)(CGFloat width, CGFloat height))rd_sizeValue;

/**
 *小于等于
 */
/// 设置宽高（ rd_widthAndHeightMaxValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat value))rd_widthAndHeightMaxValue;

/**
 *大于等于
 */
/// 设置宽高（ rd_widthAndHeightMinValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat value))rd_widthAndHeightMinValue;

/**
 *等于
 */
/// 设置宽度（ rd_widthValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthValue;
/// 设置高度（ rd_heightValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightValue;

/**
 *小于等于
 */
/// 设置最大宽度（ rd_widthMaxValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthMaxValue;
/// 设置最大高度（ rd_heightMaxValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightMaxValue;

/**
 *大于等于
 */
/// 设置最小宽度（ rd_widthMinValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthMinValue;
/// 设置最小高度（ rd_heightMinValue() ）
- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightMinValue;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(CGFloat width, CGFloat priority))rd_widthValuePriority;
- (UIView *_Nonnull(^_Nonnull)(CGFloat height, CGFloat priority))rd_heightValuePriority;

/**
 *等于
 */
/// 依赖superView  ( td_XXXEqualto(10, 10, -10, Rd_IGNORE) ※Rd_IGNORE为不设定约束 )
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeEqualTo;

/**
 *小于等于
 */
/// 依赖superView  ( td_XXXLessOrEqualto(10, 10, -10, Rd_IGNORE) ※Rd_IGNORE为不设定约束 )
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeLessOrEqualTo;

/**
 *等于
 */
/// 上边框依赖（ rd_XXXEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topEqualTo;
/// 下边框依赖（ rd_XXXEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomEqualTo;
/// 左边框依赖（ rd_XXXEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftEqualTo;
/// 右边框依赖（ rd_XXXEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightEqualTo;

/**
*小于等于
*/
/// 上边框依赖（ rd_XXXLessOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualTo;
/// 下边框依赖（ rd_XXXLessOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualTo;
/// 左边框依赖（ rd_XXXLessOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualTo;
/// 右边框依赖（ rd_XXXLessOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualTo;

/**
 *大于等于
 */
/// 上边框依赖（ rd_XXXGreaterOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualTo;
/// 下边框依赖（ rd_XXXGreaterOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualTo;
/// 左边框依赖（ rd_XXXGreaterOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualTo;
/// 右边框依赖（ rd_XXXGreaterOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualTo;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_topEqualPriorityTo;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_bottomEqualPriorityTo;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_leftEqualPriorityTo;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_rightEqualPriorityTo;

/**
 *等于
 */
/// 中心横向依赖（ rd_XXXEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXEqualTo;
/// 中心纵向依赖（ rd_XXXEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYEqualTo;

/// 中心依赖（ rd_XXXEqualTo(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView))rd_centerEqualTo;

/**
 *小于等于
 */
/// 中心横向依赖（ rd_XXXLessOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXLessOrEqualTo;
/// 中心纵向依赖（ rd_XXXLessOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYLessOrEqualTo;

/**
 *大于等于
 */
/// 中心横向依赖（ rd_XXXGreaterOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXGreaterOrEqualTo;
/// 中心纵向依赖（ rd_XXXGreaterOrEqualTo(otherView, offset) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYGreaterOrEqualTo;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_centerXEqualPriorityTo;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_centerYEqualPriorityTo;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat priority))rd_centerEqualPriorityTo;

/**
 *等于
 */
/// 宽度倍数（ rd_XXXMultipliedBy(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthMultipliedBy;
/// 高度倍数（ rd_XXXMultipliedBy(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightMultipliedBy;

/**
 *小于等于
 */
/// 宽度倍数（ rd_XXXLessOrEqualMultipliedBy(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthLessOrEqualMultipliedBy;
/// 高度倍数（ rd_XXXLessOrEqualMultipliedBy(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightLessOrEqualMultipliedBy;

/**
 *大于等于
 */
/// 宽度倍数（ rd_XXXGreaterOrEqualMultipliedBy(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthGreaterOrEqualMultipliedBy;
/// 高度倍数（ rd_XXXGreaterOrEqualMultipliedBy(otherView) ）otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightGreaterOrEqualMultipliedBy;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple, CGFloat priority))rd_widthMultipliedPriorityBy;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple, CGFloat priority))rd_heightMultipliedPriorityBy;

/**
 *等于
 */
/// 上下 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topToBottmOf;
/// 下上 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomToTopOf;
/// 左右 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftToRightOf;
/// 右左 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightToLeftOf;

/**
 *小于等于
 */
/// 上下 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualToBottmOf;
/// 下上 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualToTopOf;
/// 左右 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualToRightOf;
/// 右左 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualToLeftOf;

/**
 *大于等于
 */
/// 上下 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualToBottmOf;
/// 下上 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualToTopOf;
/// 左右 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualToRightOf;
/// 右左 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualToLeftOf;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_topToBottmPriorityOf;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_bottomToTopPriorityOf;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_leftToRightPriorityOf;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_rightToLeftPriorityOf;

/**
 *等于
 */
/// 上中 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topToCenterYOf;
/// 下中 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomToCenterYOf;
/// 左中 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftToCenterXOf;
/// 右中 依赖 （ rd_XXXToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightToCenterXOf;

/**
 *小于等于
 */
/// 上中 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualToCenterYOf;
/// 下中 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualToCenterYOf;
/// 左中 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualToCenterXOf;
/// 右中 依赖 （ rd_XXXLessOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualToCenterXOf;

/**
 *大于等于
 */
/// 上中 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualToCenterYOf;
/// 下中 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualToCenterYOf;
/// 左中 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualToCenterXOf;
/// 右中 依赖 （ rd_XXXGreaterOrEqualToXXXOf(otherView, offset) ） otherView可以为nil，此时相对于superView依赖
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualToCenterXOf;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_topToCenterYPriorityOf;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_bottomToCenterYPriorityOf;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_leftToCenterXPriorityOf;
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_rightToCenterXPriorityOf;

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.

/// 水平添加View （ rd_addHorizontalSubview(view, 10) ）
- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addHorizontalSubview;

- (void)rdAddHorizontalView:(UIView * _Nonnull)chileView interval:(CGFloat)interval;

/// 垂直添加View （ rd_addVerticalSubview(view, 10) ）
- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addVerticalSubview;

- (void)rdAddVerticalView:(UIView * _Nonnull)chileView interval:(CGFloat)interval;

/// 自动换行添加view，chileWidth是浮点数，但是布局最小只支持0.5，masonry会自动向上取0.5，不满0.5的自动取0.5。超过0.5的自动取整，所以这里要对chileView重新设定width，向下取0.5。
- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat chileWidth))rd_addCollectionView;

- (void)rdAddCollectionView:(UIView *_Nonnull)chileView width:(CGFloat)chileWidth;

- (void)rd_removeConstraint;

@end


