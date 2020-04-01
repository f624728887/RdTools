//
//  RdToolsManager.h
//  RdToolsProject
//
//  Created by Rondo on 2020/4/1.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RdToolsManager : NSObject

/// 默认字体，特殊（eg. 加粗）字体单独设置
@property (nonatomic, copy) NSString *fontNameDefault;

/// VC默认返回按钮图片
@property (nonatomic, copy) NSString *defaultBackButtonImage;

+ (RdToolsManager *)getManager;

@end

NS_ASSUME_NONNULL_END
