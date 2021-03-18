//
//  RdWeakProxy.m
//  RdToolsProject
//
//  Created by Rondo on 2020/6/3.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import "RdWeakProxy.h"

@interface RdWeakProxy ()

@property (weak,nonatomic,readonly)id target;

@end

@implementation RdWeakProxy

- (instancetype _Nonnull)initWithTarget:(id)target{
    _target = target;
    return self;
}

+ (instancetype _Nonnull)proxyWithTarget:(id)target{
    return [[self alloc] initWithTarget:target];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.target methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [self.target respondsToSelector:aSelector];
}

@end
