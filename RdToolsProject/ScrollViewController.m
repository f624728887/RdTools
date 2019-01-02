//
//  ScrollViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/2.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "ScrollViewController.h"
#import "RdTools/RdToolsHeader.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dataInit];
    [self makeView];
}

- (void)dataInit{
    self.title = @"scrollView";
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
    UIScrollView *vScrollView = [UIScrollView rd_VScrollView:Rd_ColorWith(blueColor) forView:self.view];
    vScrollView.rd_edgeEqualTo(Rd_NavibarH + Rd_MarginDefault, Rd_MarginDefault, Rd_IGNORE, Rd_IGNORE).rd_sizeValue(100, 200);
    float cellHei = 111;
    for (int i = 0; i < 6; i ++) {
        UIColor *color = i % 2 == 0 ? Rd_ColorWith(yellowColor) : Rd_ColorWith(redColor);
        UIView *view = [UIView rd_ViewBGColor:color for:vScrollView.contentView];
        view.rd_heightValue(cellHei).rd_leftEqualTo(nil, 0).rd_rightEqualTo(nil, 0);
        vScrollView.contentView.rd_addVerticalHeightAdaptingSubview(view, 0);
        
    }
    
    UIScrollView *hScrollView = [UIScrollView rd_HScrollView:Rd_ColorWith(blueColor) forView:self.view];
    hScrollView.rd_leftEqualTo(nil, Rd_MarginDefault).rd_rightEqualTo(nil, -Rd_MarginDefault).rd_topToBottmOf(vScrollView, Rd_MarginDefault).rd_heightValue(200);
    float cellWid = 222;
    for (int i = 0; i <= 6; i ++) {
        UIColor *color = i % 2 == 0 ? Rd_ColorWith(yellowColor) : Rd_ColorWith(redColor);
        UIView *view = [UIView rd_ViewBGColor:color for:hScrollView.contentView];
        view.rd_widthValue(cellWid).rd_topEqualTo(nil, 0).rd_bottomEqualTo(nil, 0);
        hScrollView.contentView.rd_addHorizontalWidthAdaptingSubview(view, 0);
    }
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
