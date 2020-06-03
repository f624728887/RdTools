//
//  RdWeakProxy.h
//  RdToolsProject
//
//  Created by Rondo on 2020/6/3.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RdWeakProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;

- (instancetype)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
