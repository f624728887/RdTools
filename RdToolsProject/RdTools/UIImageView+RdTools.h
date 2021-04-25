//
//  UIImageView+RdTools.h
//  Library
//
//  Created by Rondo_dada on 2018/4/11.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RdTools)

+ (instancetype _Nonnull)rd_ImageView:(UIColor *_Nullable)bgColor for:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_ImageViewImage:(NSString *_Nullable)imageName for:(UIView *_Nonnull)superView;

+ (instancetype _Nonnull)rd_ImageViewPlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url for:(UIView *_Nonnull)superView;

- (void)rd_setImagePlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url;
- (void)rd_setImagePlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url width:(CGFloat)width;

@end
