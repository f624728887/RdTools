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

/// 并发多个同步任务管理器
@interface RdGCDGroupManager : RdGCDTools

+ (instancetype)rd_GroupManager;

- (void)rd_addGroupAction:(RdActionBlock)block;

- (void)rd_addCompleteAction:(RdActionBlock)block;

@end

/**
 旗帜锁，rd_SemaphoreManagerValue方法在声明时设定了允许同时操作的数量
 那么同时操作的数量超过设定值时，后发生的操作会被锁住，直到有操作完成
 才会开始后面的操作。
 */
@interface RdGCDSemaphoreManager : RdGCDTools

/// 初始化一个旗帜，允许同时操作最小值为1
+ (instancetype)rd_SemaphoreManagerValue:(NSInteger)value;

/// 将要执行的操作放到block中，方法内部会自动处理
- (void)rd_action:(void (^)(void))block;

@end

/// 并发多个异步任务管理器（不包含任务执行是否成功标识）
@interface RdAsyncSemaphoreManager : RdGCDTools

+ (instancetype)getAsyncSemaphoreManager;

/// 向管理器中添加任务。
- (void)rd_addAction:(void (^)(void (^complete)(void)))block;

/// 开始执行所有异步任务，全部执行完毕后回调
- (void)rd_complete:(void (^)(void))block;

@end

/// 并发多个异步任务管理器（含任务执行是否成功标识）
@interface RdAsyncConcurrentSignalManager : RdGCDTools

+ (instancetype)getAsyncConcurrentSignalManager;

/// 向管理器中添加任务。
/// @param block 异步任务执行完成后调用complete，success：任务执行状态。
- (void)rd_addAction:(void (^)(void (^complete)(BOOL success)))block;

/// 开始执行所有异步任务。
/// @param block 当所有任务完成后回调，并且有一个子任务执行结果为false，则返回false。
- (void)rd_complete:(void (^)(BOOL success))block;

@end

NS_ASSUME_NONNULL_END
