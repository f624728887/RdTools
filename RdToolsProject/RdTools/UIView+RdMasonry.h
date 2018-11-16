//
//  UIView+RdMasonry.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/12.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RdViewHorizontalWidthType) {
    RdViewHorizontalWidthFixed,
    RdViewHorizontalWidthAdapting,
};

typedef NS_ENUM(NSUInteger, RdViewVerticalHeightType) {
    RdViewVerticalHeightFixed,
    RdViewVerticalHeightAdapting,// 适应
};

typedef NS_ENUM(NSUInteger, RdConstraint) {
    RdConstraintTop,
    RdConstraintLeft,
    RdConstraintBottom,
    RdConstraintRight,
    RdConstraintWidth,
    RdConstraintHeight,
};

typedef NS_ENUM(NSUInteger, RdRelation) {
    RdRelationLessThanOrEqual,
    RdRelationGreaterThanOrEqual,
};

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
 *等于
 */
/// 依赖superView  ( td_XXXEqualto(10, 10, -10, -1) ※-1为不设定约束 )
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeEqualTo;

/**
 *小于等于
 */
/// 依赖superView  ( td_XXXLessOrEqualto(10, 10, -10, -1) ※-1为不设定约束 )
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

/// rd_userDefinedRelation(childConstraint, relation, relationView(nil为superView), relationViewConstraint)
- (UIView *_Nonnull(^_Nonnull)(RdConstraint childConstraint, RdRelation relation, UIView *_Nullable view, RdConstraint constraint))rd_userDefinedRelation;

/// 水平添加View （ rd_addHorizontalSubview(view, 10, UIViewHorizontalWidthFixed) ）
- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval, RdViewHorizontalWidthType type))rd_addHorizontalSubview;

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addHorizontalWidthAdaptingSubview;

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addHorizontalWidthFixedSubview;

/// 垂直添加View （ rd_addVerticalSubview(view, 10, UIViewVerticalHeightFixed) ）
- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval, RdViewVerticalHeightType type))rd_addVerticalSubview;

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addVerticalHeightAdaptingSubview;

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addVerticalHeightFixedSubview;

- (void)rd_removeConstraint;

@end


