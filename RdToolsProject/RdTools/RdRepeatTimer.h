//
//  RdRepeatTimer.h
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/11/26.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RdRepeatTimer : NSObject

+ (RdRepeatTimer *)rd_setRepeatTimer:(NSTimeInterval)period actionBlock:(void (^)(void))block;
// 重新开始
- (void)rd_resumeRepeatTimer;
// 暂停
- (void)rd_suspendRepeatTimer;
// 取消
- (void)rd_cancelRepeatTimer;

@end

NS_ASSUME_NONNULL_END
