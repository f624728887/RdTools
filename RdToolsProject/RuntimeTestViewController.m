//
//  RuntimeTestViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/11/20.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "RuntimeTestViewController.h"
#import "RdToolsHeader.h"
#import <objc/runtime.h>

@interface RuntimeTestViewController ()

@end

@implementation RuntimeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dataInit];
    [self makeView];
}

- (void)dataInit{
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
//    防止按钮多次点击
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
