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

@interface RdGCDGroupManager : RdGCDTools

+ (instancetype)rd_GroupManager;

- (void)rd_addGroupAction:(RdActionBlock)block;

- (void)rd_addCompleteAction:(RdActionBlock)block;

@end

@interface RdGCDSemaphoreManager : RdGCDTools

/// 最小值为1
+ (instancetype)rd_SemaphoreManagerValue:(NSInteger)value;

- (void)rd_action:(void (^)(void))block;

@end

@interface RdAsyncSemaphoreManager : RdGCDTools

+ (instancetype)getAsyncSemaphoreManager;

- (void)rd_addAction:(void (^)(void (^complete)(void)))block;

- (void)rd_complete:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
