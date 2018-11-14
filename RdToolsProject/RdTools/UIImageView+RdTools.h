//
//  UIImageView+RdTools.h
//  Library
//
//  Created by Rondo_dada on 2018/4/11.
//  Copyright © 2018年 Chen Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RdTools)

+ (UIImageView *_Nonnull)rd_ImageView:(UIColor *)bgColor for:(UIView *_Nonnull)superView;

+ (UIImageView *_Nonnull)rd_ImageViewImage:(NSString *_Nullable)imageName for:(UIView *_Nonnull)superView;

+ (UIImageView *_Nonnull)rd_ImageViewPlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url for:(UIView *_Nonnull)superView;

- (void)rd_setImagePlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url;
- (void)rd_setImagePlaceholder:(NSString *)phName url:(NSString *)url width:(CGFloat)width;

@end
