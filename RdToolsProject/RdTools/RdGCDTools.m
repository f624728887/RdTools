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

@interface RdGCDGroup ()

@property (nonatomic, strong) NSMutableArray *actionList;

@end

@implementation RdGCDGroup

+ (instancetype)rd_Group{
    RdGCDGroup *groupManager = [[RdGCDGroup alloc] init];
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

@interface RdGCDSemaphore () {
    dispatch_semaphore_t semaphore;
}

@end

@implementation RdGCDSemaphore

+ (instancetype)rd_SemaphoreValue:(NSInteger)value{
    RdGCDSemaphore *manager = [[RdGCDSemaphore alloc] init];
    manager->semaphore = dispatch_semaphore_create(value);
    return manager;
}

- (void)rd_action:(void (^)(void))block{
    dispatch_semaphore_wait(self->semaphore, DISPATCH_TIME_FOREVER);
    block();
    dispatch_semaphore_signal(self->semaphore);
}



@end
