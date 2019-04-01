//
//  Scroll2ViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/4/1.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "Scroll2ViewController.h"
#import "RdTools/RdToolsHeader.h"
#import "RdWebView.h"

@interface Scroll2ViewController ()

@end

@implementation Scroll2ViewController

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
    RdWebView *view = [[RdWebView alloc] initWithUrl:@"http://www.baidu.com"];
    [self.view addSubview:view];
    view.rd_edgeEqualTo(0, 0, 0, 0);
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
