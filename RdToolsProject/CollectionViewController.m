//
//  CollectionViewController.m
//  RdToolsProject
//
//  Created by Rondo on 2020/5/17.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import "CollectionViewController.h"
#import "RdToolsHeader.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, Rd_NavibarH, 56.285714285714285, 56.285714285714285)];
    view.backgroundColor = Rd_ColorWith(redColor);
    [self.view addSubview:view];
    
    UIView *bgView = [UIView rd_ViewBGColor:Rd_ColorWith(greenColor) for:self.view];
    bgView.rd_sizeValue(Rd_ScreenWidth - 20, Rd_ScreenWidth - 20).rd_centerEqualTo(nil);
    
    CGFloat cellWidth = (Rd_ScreenWidth-20)/7.0;
    for (int i = 0; i < 15; i ++) {
        UILabel *label = [UILabel rd_LabelString:[NSString stringWithFormat:@"%d", i] fontName:nil fontSize:Rd_FontSizeL lineNumber:1 textColor:Rd_ColorWith(blackColor) superView:bgView];
        label.rd_sizeValue(cellWidth, cellWidth);
        label.backgroundColor = Rd_ColorWith(redColor);
        [label rd_setTextAlignmentCenter];
//        bgView.rd_addCollectionView(label, cellWidth);
        [bgView rdAddCollectionView:label width:cellWidth];
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
