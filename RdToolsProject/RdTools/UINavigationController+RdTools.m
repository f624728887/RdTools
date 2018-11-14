//
//  UINavigationController+RdTools.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/20.
//  Copyright © 2018年 王佳兴. All rights reserved.
//

#import "UINavigationController+RdTools.h"

@implementation UINavigationController (RdTools)

- (BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}

- (NSUInteger)supportedInterfaceOrientations{
    return self.topViewController.supportedInterfaceOrientations;
}

@end
