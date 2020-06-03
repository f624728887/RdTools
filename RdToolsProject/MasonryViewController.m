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
    [blueView rd_setLongPressBegan:^(UILongPressGestureRecognizer * _Nonnull sender) {
        NSLog(@"长按触发");
    } end:nil];
    
    UIView *yellowView = [UIView rd_ViewBGColor:Rd_ColorWith(yellowColor) for:baseView];
    yellowView.rd_centerEqualTo(nil).rd_squareLengthValue(40);
    [yellowView rd_setLongPressBegan:nil end:^(UILongPressGestureRecognizer * _Nonnull sender) {
        NSLog(@"长按结束触发");
    }];
    
    UIView *orangeView = [UIView rd_ViewBGColor:Rd_ColorWith(orangeColor) for:baseView];
    orangeView.rd_leftToRightOf(yellowView, 20).rd_centerYEqualTo(yellowView, 0).rd_sizeValue(40, 20);
    [orangeView rd_setLongPressBegan:^(UILongPressGestureRecognizer * _Nonnull sender) {
        NSLog(@"长按触发");
    } end:^(UILongPressGestureRecognizer * _Nonnull sender) {
        NSLog(@"长按结束触发");
    }];
    
    UIView *tapView = [UIView rd_ViewBGColor:Rd_ColorWith(greenColor) for:self.view];
    tapView.rd_centerXEqualTo(nil, 0).rd_topToBottmOf(baseView, Rd_MarginDefault * 2).rd_sizeValue(40, 25);
    [tapView rd_setSingleTap:^(UITapGestureRecognizer *sender) {
        NSLog(@"hehe");
    }];
    
    UIImageView *image = [UIImageView rd_ImageView:Rd_ColorWith(redColor) for:self.view];
    image.rd_centerXEqualTo(tapView, 0).rd_topToBottmOf(tapView, Rd_MarginSmall).rd_sizeValue(40, 25);
    [image rd_setSingleTap:^(UITapGestureRecognizer *sender) {
        NSLog(@"haha");
    }];
    
    image.image = Rd_ImageWith(@"hill");
    
    UILabel *label = [UILabel rd_LabelString:@"hehe" fontName:nil fontSize:Rd_FontSizeM lineNumber:1 textColor:Rd_ColorWith(blackColor) superView:self.view];
    label.userInteractionEnabled = YES;
    label.rd_centerXEqualTo(image, 0).rd_topToBottmOf(image, Rd_MarginDefault);
    [label rd_setSingleTap:^(UITapGestureRecognizer *sender) {
        NSLog(@"lala");
        sender.view.backgroundColor = Rd_ColorWith(yellowColor);
    }];

    UIView *maxView = [UIView rd_ViewBGColor:Rd_ColorWith(yellowColor) for:self.view];
    maxView.rd_topToBottmOf(label, Rd_MarginLarge).rd_leftEqualTo(nil, Rd_MarginLarge).rd_rightEqualTo(nil, -Rd_MarginLarge).rd_heightValue(40);
    
    UILabel *leftLabel = [UILabel rd_LabelString:@"阿卡丽时代峻峰和爱哭的就是发火打算" fontName:nil fontSize:Rd_FontSizeM lineNumber:1 textColor:Rd_ColorWith(blueColor) superView:maxView];
    leftLabel.rd_leftEqualTo(nil, 0).rd_heightValue(30).rd_centerYEqualTo(nil, 0).rd_widthValuePriority([leftLabel rd_getLabelStringWidth], 1000);
    leftLabel.backgroundColor = Rd_ColorWith(redColor);
    
    UILabel *rightLabel = [UILabel rd_LabelString:@"爱哭吉林省电话费阿克江的说法啊卡就是电话费" fontName:nil fontSize:Rd_FontSizeM lineNumber:1 textColor:Rd_ColorWith(blueColor) superView:maxView];
    rightLabel.rd_leftToRightOf(leftLabel, 0).rd_heightValue(30).rd_centerYEqualTo(nil, 0).rd_widthValuePriority([rightLabel rd_getLabelStringWidth], 500).rd_rightEqualTo(nil, 0);
    rightLabel.backgroundColor = Rd_ColorWith(greenColor);
    
    NSLog(@"%f", maxView.rd_MinX);
    
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
