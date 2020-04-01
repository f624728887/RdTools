//
//  RdToolsManager.m
//  RdToolsProject
//
//  Created by Rondo on 2020/4/1.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import "RdToolsManager.h"
#import "RdToolsHeader.h"

static RdToolsManager *manager = nil;

@interface RdToolsManager ()

@end

@implementation RdToolsManager

+ (RdToolsManager *)getManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RdToolsManager alloc] init];
        manager.fontNameNormal = [UILabel rd_getLabelDefaulFontName];
        manager.defaultBackButtonImage = @"";
    });
    
    return manager;
}


@end
