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

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self dataInit];
    [self makeView];
}

- (void)dataInit{
    self.dataArr = @[@"布局封装", @"视频封装", @"键盘监听"];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)makeView{
    self.tableView = [UITableView rd_TableView:[UIColor redColor] forView:self.view];
    self.tableView.rd_edgeEqualTo(Rd_NavibarH, 0, 0, 0);
}


@end
