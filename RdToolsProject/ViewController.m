//
//  ViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/11/14.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "ViewController.h"
#import "RdToolsHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self dataInit];
    [self makeView];
}

- (void)dataInit{
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
    
    UIView *baseView = [UIView rd_ViewBGColor:Rd_ColorWith(redColor) for:self.view];
    baseView.rd_edgeEqualTo(Rd_NavibarH + 10, 0, -(Rd_ScreenHeight - Rd_NavibarH)/2.0, 0);
    
    UIView *blueView = [UIView rd_ViewBGColor:Rd_ColorWith(blueColor) for:baseView];
    blueView.rd_edgeEqualTo(0, 0, -1, -1).rd_widthMultipliedBy(nil, 0.5).rd_heightMultipliedBy(nil, 0.5);
    
    UIView *yellowView = [UIView rd_ViewBGColor:Rd_ColorWith(yellowColor) for:baseView];
    yellowView.rd_centerEqualTo(nil).rd_squareLengthValue(40);
    
    UIView *orangeView = [UIView rd_ViewBGColor:Rd_ColorWith(orangeColor) for:baseView];
    orangeView.rd_leftToRightOf(yellowView, 20).rd_centerYEqualTo(yellowView, 0).rd_sizeValue(40, 20);
    
    RdRepeatTimer *timer = [RdRepeatTimer rd_setRepeatTimer:2.0 actionBlock:^{
        NSLog(@"hehe");
    }];
    
    [RdOnceTimer rd_setOnceTimer:10.0 actionBlock:^{
        NSLog(@"hahaha");
        [timer rd_cancelRepeatTimer];
    }];
}


@end
