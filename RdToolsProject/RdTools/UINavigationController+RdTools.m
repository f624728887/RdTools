//
//  UINavigationController+RdTools.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/20.
//  Copyright © 2018年 Rondo. All rights reserved.
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
