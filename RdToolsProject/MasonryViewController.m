//
//  MasonryViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/2.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "MasonryViewController.h"
#import "RdTools/RdToolsHeader.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dataInit];
    [self makeView];
}

- (void)dataInit{
    self.title = @"Masonry";
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
    UIView *baseView = [UIView rd_ViewBGColor:Rd_ColorWith(redColor) for:self.view];
    baseView.rd_edgeEqualTo(Rd_NavibarH + 10, 0, -(Rd_ScreenHeight - Rd_NavibarH)/2.0, 0);
    
    UIView *blueView = [UIView rd_ViewBGColor:Rd_ColorWith(blueColor) for:baseView];
    blueView.rd_edgeEqualTo(0, 0, Rd_IGNORE, Rd_IGNORE).rd_widthMultipliedBy(nil, 0.5).rd_heightMultipliedBy(nil, 0.5);
    
    UIView *yellowView = [UIView rd_ViewBGColor:Rd_ColorWith(yellowColor) for:baseView];
    yellowView.rd_centerEqualTo(nil).rd_squareLengthValue(40);
    
    UIView *orangeView = [UIView rd_ViewBGColor:Rd_ColorWith(orangeColor) for:baseView];
    orangeView.rd_leftToRightOf(yellowView, 20).rd_centerYEqualTo(yellowView, 0).rd_sizeValue(40, 20);
    
    UIView *tapView = [UIView rd_ViewBGColor:Rd_ColorWith(greenColor) for:self.view];
    tapView.rd_centerXEqualTo(nil, 0).rd_topToBottmOf(baseView, Rd_MarginDefault * 2).rd_sizeValue(40, 25);
    [tapView rd_setSingleTap:^(UITapGestureRecognizer *sender) {
        NSLog(@"hehe");
    }];

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
