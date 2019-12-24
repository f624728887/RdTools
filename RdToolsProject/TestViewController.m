//
//  TestViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/3/13.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "TestViewController.h"
#import "RdTools/RdToolsHeader.h"
#import "RdPageView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
    self.view.clipsToBounds = YES;
    self.title = @"test";
    
    NSArray *imgList = @[@"http://i3.sinaimg.cn/IT/t/2010-03-23/U4373P2T1D3977324F13DT20100323204034.JPG", @"https://tse3.mm.bing.net/th?id=OIP.NhtyuGqMktb2_SIGGSqkIQHaF7&pid=Api", @"https://i10.hoopchina.com.cn/hupuapp/bbs/938/27501938/thread_27501938_20170106125452_s_138853_o_h_300px_w_471px2047383998.jpeg?x-oss-process=image/resize,w_800/format,jpeg", @"https://i10.hoopchina.com.cn/hupuapp/bbs/938/27501938/thread_27501938_20170106125452_s_238668_o_h_600px_w_400px2122520759.jpeg", @"https://i10.hoopchina.com.cn/hupuapp/bbs/938/27501938/thread_27501938_20170106125453_s_303571_o_h_900px_w_573px265700814.jpeg"];
    
    RdPageView *p = [[RdPageView alloc] initWithViewEdge:Rd_MarginLarge pageEdge:Rd_MarginDefault imageList:imgList placeHolder:@"hill" forView:self.view];
    p.backgroundColor = Rd_ColorWith(whiteColor);
    p.rd_edgeEqualTo(Rd_NavibarH, 0, Rd_IGNORE, 0).rd_heightValue(Rd_ScreenWidth/16.0*9.0);
    
    
    UILabel *l = [UILabel rd_LabelString:@"hehe" fontName:nil fontSize:Rd_FontSizeL lineNumber:1 textColor:Rd_ColorWith(blackColor) superView:self.view];
    l.rd_topToBottmOf(p, Rd_MarginLarge).rd_rightEqualTo(nil, -Rd_MarginDefault).rd_sizeValue(60, 30);
    l.backgroundColor = Rd_ColorWith(greenColor);
    [l rd_setSingleTap:^(UITapGestureRecognizer *sender) {
        [UIView animateWithDuration:Rd_AnimationDuration animations:^{
            l.textColor = Rd_ColorWith(redColor);
            l.font = [UIFont systemFontOfSize:Rd_FontSizeXL];
        }];
    }];
    
    BOOL hehe = NO;
    hehe ?: NSLog(@"haha");
    
    RdPageView *lala = [[RdPageView alloc] init];
    Class c1 = [lala class];
    Class c2 = [RdPageView class];
    
    
    NSLog(@"%p, %p", c1, c2);
    
    
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
