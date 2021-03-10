//
//  RdGCDTools.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/24.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "RdGCDTools.h"

@implementation RdGCDTools

@end

#pragma mark - group

@interface RdGCDGroupManager ()

@property (nonatomic, strong) NSMutableArray *actionList;

@end

@implementation RdGCDGroupManager

+ (instancetype)rd_GroupManager{
    RdGCDGroupManager *groupManager = [[RdGCDGroupManager alloc] init];
    groupManager.actionList = [NSMutableArray arrayWithCapacity:0];
    return groupManager;
}

- (void)rd_addGroupAction:(RdActionBlock)block{
    [self.actionList addObject:block];
}

- (void)rd_addCompleteAction:(RdActionBlock)block{
    dispatch_group_t group = dispatch_group_create();
    
    if (self.actionList.count > 0) {
        for (RdActionBlock action in self.actionList) {
            dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                action();
            });
        }
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        block();
        [self.actionList removeAllObjects];
    });
}

@end

#pragma mark - semaphore

@interface RdGCDSemaphoreManager () {
    dispatch_semaphore_t semaphore;
}

@end

@implementation RdGCDSemaphoreManager

+ (instancetype)rd_SemaphoreManagerValue:(NSInteger)value{
    if (value < 1) {
        value = 1;
    }
    RdGCDSemaphoreManager *manager = [[RdGCDSemaphoreManager alloc] init];
    manager->semaphore = dispatch_semaphore_create(value);
    return manager;
}

- (void)rd_action:(void (^)(void))block{
    dispatch_semaphore_wait(self->semaphore, DISPATCH_TIME_FOREVER);
    block();
    dispatch_semaphore_signal(self->semaphore);
}

@end

@interface RdAsyncSemaphoreManager ()

@property (nonatomic, assign) NSInteger semaphore;
@property (nonatomic, strong) NSMutableArray *actionArray;

@end


@implementation RdAsyncSemaphoreManager

+ (RdAsyncSemaphoreManager *)getAsyncSemaphoreManager{
    RdAsyncSemaphoreManager *manager = [[RdAsyncSemaphoreManager alloc] init];
    manager.semaphore = 0;
    manager.actionArray = [NSMutableArray arrayWithCapacity:0];
    return manager;
}

- (void)rd_addAction:(void (^)(void (^complete)(void)))block{
    self.semaphore ++;
    [self.actionArray addObject:block];
}

- (void)rd_complete:(void (^)(void))block{
    __block NSInteger tSemaphore = self.semaphore;
    void (^completeBlock)(void) = ^{
        tSemaphore --;
        if (tSemaphore == 0) {
            block();
        }
    };
    
    for (void (^actionBlock)(void (^complete)(void)) in self.actionArray) {
        actionBlock(completeBlock);
    }
}

@end

@interface RdAsyncConcurrentSignalManager ()

@property (nonatomic, assign) NSInteger semaphore;
@property (nonatomic, assign) BOOL tasksResult;
@property (nonatomic, strong) NSMutableArray *actionArray;

@end


@implementation RdAsyncConcurrentSignalManager

+ (RdAsyncConcurrentSignalManager *)getAsyncConcurrentSignalManager{
    RdAsyncConcurrentSignalManager *manager = [[RdAsyncConcurrentSignalManager alloc] init];
    manager.semaphore = 0;
    manager.tasksResult = true;
    manager.actionArray = [NSMutableArray arrayWithCapacity:0];
    return manager;
}

- (void)rd_addAction:(void (^)(void (^complete)(BOOL success)))block{
    self.semaphore ++;
    [self.actionArray addObject:block];
}

- (void)rd_complete:(void (^)(BOOL success))block{
    __block NSInteger tSemaphore = self.semaphore;
    __block BOOL result = self.tasksResult;
    void (^completeBlock)(BOOL success) = ^(BOOL success) {
        tSemaphore --;
        if (!success) {
            result = false;
        }
        if (tSemaphore == 0) {
            block(result);
        }
    };
    
    for (void (^actionBlock)(void (^complete)(BOOL success)) in self.actionArray) {
        actionBlock(completeBlock);
    }
}

@end
