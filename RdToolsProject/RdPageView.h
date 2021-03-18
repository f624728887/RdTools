//
//  RdPageView.h
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/3/14.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RdPageView : UIView

- (instancetype _Nonnull)initWithViewEdge:(CGFloat)viewEdge pageEdge:(CGFloat)pageEdge imageList:(NSArray <NSString *>*)imageList placeHolder:(NSString *)placeHolder forView:(UIView *)forView;

@end

NS_ASSUME_NONNULL_END
