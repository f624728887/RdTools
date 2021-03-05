//
//  RdRepeatTimer.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/11/26.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "RdRepeatTimer.h"

@interface RdRepeatTimer ()

@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, assign) BOOL isSuspend;

@end

@implementation RdRepeatTimer

+ (RdRepeatTimer *)rd_setRepeatTimer:(NSTimeInterval)period actionBlock:(void (^)(void))block{
    RdRepeatTimer *rdtimer = [[RdRepeatTimer alloc] init];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    rdtimer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(rdtimer.timer, dispatch_walltime(nil, period * NSEC_PER_SEC), period * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(rdtimer.timer, block);
    rdtimer.isSuspend = YES;
    
    [rdtimer rd_resumeRepeatTimer];
    
    return rdtimer;
}

- (void)rd_resumeRepeatTimer{
    if (self.isSuspend) {
        self.isSuspend = !self.isSuspend;
        dispatch_resume(self.timer);
    }
}

- (void)rd_suspendRepeatTimer{
    if (!self.isSuspend) {
        self.isSuspend = !self.isSuspend;
        dispatch_suspend(self.timer);
    }
    
}

- (void)rd_cancelRepeatTimer{
    dispatch_source_cancel(self.timer);
}

@end
