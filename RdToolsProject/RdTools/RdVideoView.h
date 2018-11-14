//
//  RdVideoView.h
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/20.
//  Copyright © 2018年 王佳兴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RdVideoView : UIView

- (instancetype _Nonnull )initForView:(UIView *_Nonnull)superView;

- (void)videoInit:(NSString *_Nonnull)videoUrl title:(NSString *_Nullable)title;

- (void)resetVideoUrl:(NSString *_Nonnull)videoUrl title:(NSString *_Nullable)title;

- (void)setLeftFull:(void (^_Nonnull)(void))block;

- (void)setRightFull:(void (^_Nonnull)(void))block;

- (void)setUnfull:(void (^_Nonnull)(void))block;

- (void)videoStop;

@end
