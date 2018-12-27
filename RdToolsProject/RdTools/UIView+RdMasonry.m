//
//  UIView+RdMasonry.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/12.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIView+RdMasonry.h"
#import "Masonry.h"

@implementation UIView (RdMasonry)

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat value))rd_squareLengthValue{
    return ^(CGFloat value) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@(value));
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat width, CGFloat height))rd_sizeValue{
    return ^(CGFloat width, CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat value))rd_widthAndHeightMaxValue{
    return ^(CGFloat value) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.lessThanOrEqualTo(@(value));
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat value))rd_widthAndHeightMinValue{
    return ^(CGFloat value) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.greaterThanOrEqualTo(@(value));
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthValue{
    return ^(CGFloat width) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width));
        }];
        return self;
    };
}
- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightValue{
    return ^(CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(height));
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthMaxValue{
    return ^(CGFloat width) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@(width));
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightMaxValue{
    return ^(CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.lessThanOrEqualTo(@(height));
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthMinValue{
    return ^(CGFloat width) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.greaterThanOrEqualTo(@(width));
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightMinValue{
    return ^(CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.greaterThanOrEqualTo(@(height));
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeEqualTo{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        if (top != -1) {
            self.rd_topEqualTo(nil, top);
        }
        if (left != -1) {
            self.rd_leftEqualTo(nil, left);
        }
        if (bottom != -1) {
            self.rd_bottomEqualTo(nil, bottom);
        }
        if (right != -1) {
            self.rd_rightEqualTo(nil, right);
        }
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeLessOrEqualTo{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        if (top != -1) {
            self.rd_topLessOrEqualTo(nil, top);
        }
        if (left != -1) {
            self.rd_leftLessOrEqualTo(nil, left);
        }
        if (bottom != -1) {
            self.rd_bottomLessOrEqualTo(nil, bottom);
        }
        if (right != -1) {
            self.rd_rightLessOrEqualTo(nil, right);
        }
        return self;
    };
}

/**
 *等于
 */

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView))rd_centerEqualTo{
    return ^(UIView *otherView) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo((otherView == nil ? self.superview : otherView));
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthLessOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightLessOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthGreaterOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightGreaterOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topToBottmOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomToTopOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftToRightOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightToLeftOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView).mas_left).offset(offset);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualToBottmOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualToTopOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualToRightOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualToLeftOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_left).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualToBottmOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualToTopOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualToRightOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualToLeftOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_left).offset(offset);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval, RdViewHorizontalWidthType type))rd_addHorizontalSubview{
    return ^(UIView *chileView, CGFloat interval, RdViewHorizontalWidthType type) {
        if (self.subviews.count == 0) {
            [self addSubview:chileView];
            chileView.rd_leftEqualTo(nil, 0);
            if (type == RdViewHorizontalWidthAdapting) {
                [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.lessThanOrEqualTo(self);
                }];
            }
        }
        else {
            if (self.subviews.lastObject != chileView) {
                UIView *before = self.subviews.lastObject;
                [self addSubview:chileView];
                chileView.rd_leftToRightOf(before, interval);
                if (type == RdViewHorizontalWidthAdapting) {
                    [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.lessThanOrEqualTo(self);
                    }];
                }
            }
            else {
                if (self.subviews.count == 1) {
                    chileView.rd_leftEqualTo(nil, 0);
                    if (type == RdViewHorizontalWidthAdapting) {
                        [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.right.lessThanOrEqualTo(self);
                        }];
                    }
                }
                else {
                    UIView *before = [self.subviews objectAtIndex:(self.subviews.count - 2)];
                    chileView.rd_leftToRightOf(before, interval);
                    if (type == RdViewHorizontalWidthAdapting) {
                        [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.right.lessThanOrEqualTo(self);
                        }];
                    }
                }
            }
        }
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addHorizontalWidthAdaptingSubview{
    return ^(UIView *chileView, CGFloat interval) {
        return self.rd_addHorizontalSubview(chileView, RdViewHorizontalWidthAdapting, interval);
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addHorizontalWidthFixedSubview{
    return ^(UIView *chileView, CGFloat interval) {
        return self.rd_addHorizontalSubview(chileView, RdViewHorizontalWidthFixed, interval);
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval, RdViewVerticalHeightType type))rd_addVerticalSubview{
    return ^(UIView *chileView, CGFloat interval, RdViewVerticalHeightType type) {
        if (self.subviews.count == 0) {
            [self addSubview:chileView];
            chileView.rd_topEqualTo(nil, 0);
            if (type == RdViewVerticalHeightAdapting) {
                [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.lessThanOrEqualTo(self);
                }];
            }
        }
        else {
            if (self.subviews.lastObject != chileView) {
                UIView *before = self.subviews.lastObject;
                [self addSubview:chileView];
                chileView.rd_topToBottmOf(before, interval);
                if (type == RdViewVerticalHeightAdapting) {
                    [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.bottom.lessThanOrEqualTo(self);
                    }];
                }
            }
            else {
                if (self.subviews.count == 1) {
                    chileView.rd_topEqualTo(nil, 0);
                    if (type == RdViewVerticalHeightAdapting) {
                        [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.bottom.lessThanOrEqualTo(self);
                        }];
                    }
                }
                else {
                    UIView *before = [self.subviews objectAtIndex:(self.subviews.count - 2)];
                    chileView.rd_topToBottmOf(before, interval);
                    if (type == RdViewVerticalHeightAdapting) {
                        [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.bottom.lessThanOrEqualTo(self);
                        }];
                    }
                }
            }
        }
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addVerticalHeightAdaptingSubview{
    return ^(UIView *chileView, CGFloat interval) {
        return self.rd_addVerticalSubview(chileView, RdViewVerticalHeightAdapting, interval);
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addVerticalHeightFixedSubview{
    return ^(UIView *chileView, CGFloat interval) {
        return self.rd_addVerticalSubview(chileView, RdViewVerticalHeightFixed, interval);
    };
}

- (void)rd_removeConstraint{
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
}


@end


