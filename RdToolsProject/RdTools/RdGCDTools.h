//
//  RdGCDTools.h
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/24.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^RdActionBlock)(void);

@interface RdGCDTools : NSObject

@end

@interface RdGCDGroup : RdGCDTools

+ (instancetype)rd_GroupManager;

- (void)rd_addGroupAction:(RdActionBlock)block;

- (void)rd_addCompleteAction:(RdActionBlock)block;

@end

@interface RdGCDSemaphore : RdGCDTools

/// 不是单例！！！ value 是任务的并发数量，最小值为 1；
+ (instancetype)rd_SemaphoreValue:(NSInteger)value;

- (void)rd_action:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
