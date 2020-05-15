//
//  RdKeyboardTools.h
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/26.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RdKeyboardTools : NSObject

- (void)rd_setShow:(void (^)(CGFloat time, CGFloat kbHeight))block;
- (void)rd_setHidden:(void (^)(CGFloat time, CGFloat kbHeight))block;

- (void)rd_KeyboardRemoveObserver;

@end
