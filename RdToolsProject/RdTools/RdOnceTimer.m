//
//  RdOnceTimer.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/11/26.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "RdOnceTimer.h"

@implementation RdOnceTimer

+ (RdOnceTimer *)rd_setOnceTimer:(NSTimeInterval)time actionBlock:(void (^)(void))block{
    RdOnceTimer *timer = [[RdOnceTimer alloc] init];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
    
    return timer;
}

@end
