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

@property (nonatomic, strong) RdKeyboardTools *kbTools;

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
    
    UIView *bottomView = [UIView rd_ViewBGColor:Rd_ColorWith(greenColor) for:self.view];
    bottomView.rd_sizeValue(Rd_ScreenWidth, 50).rd_bottomEqualTo(nil, -Rd_SafeAreaBottom);
    
    UITextField *field = [[UITextField alloc] init];
    [bottomView addSubview:field];
    field.backgroundColor = Rd_ColorWith(whiteColor);
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.rd_leftEqualTo(nil, Rd_MarginDefault).rd_centerYEqualTo(nil, 0).rd_heightValue(40).rd_rightEqualTo(nil, -60);
    
    UIButton *cancel = [UIButton rd_ButtonJustTitle:@"完成" target:self action:@selector(cancelClick) superView:bottomView];
    cancel.rd_leftToRightOf(field, Rd_MarginDefault).rd_rightEqualTo(nil, -Rd_MarginDefault).rd_centerYEqualTo(nil, 0); cancel.rd_setButtonBgColorNormal(Rd_ColorWith(whiteColor)).rd_setButtonTitleColorNormal(Rd_ColorWith(blackColor));
    cancel.rd_setLayerCornerRadius(3);
    
    self.kbTools = [[RdKeyboardTools alloc] init];
    [self.kbTools rd_setShow:^(CGFloat time, CGFloat kbHeight) {
        [UIView animateWithDuration:time animations:^{
            bottomView.rd_bottomEqualTo(nil, -kbHeight);
            [bottomView rd_animation];
        }];
    }];
    
    [self.kbTools rd_setHidden:^(CGFloat time, CGFloat kbHeight) {
        [UIView animateWithDuration:time animations:^{
            bottomView.rd_bottomEqualTo(nil, -Rd_SafeAreaBottom);
            [bottomView rd_animation];
        }];
    }];
}

- (void)cancelClick{
    [self.view endEditing:YES];
}

- (void)dealloc{
    [self.kbTools rd_KeyboardRemoveObserver];
}


@end
