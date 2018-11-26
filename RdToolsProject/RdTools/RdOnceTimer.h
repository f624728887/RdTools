//
//  RdOnceTimer.h
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/11/26.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RdOnceTimer : NSObject

+ (RdOnceTimer *)rd_setOnceTimer:(NSTimeInterval)time actionBlock:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
