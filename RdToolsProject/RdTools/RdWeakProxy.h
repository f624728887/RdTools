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

+ (instancetype _Nonnull)proxyWithTarget:(id)target;

- (instancetype _Nonnull)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
