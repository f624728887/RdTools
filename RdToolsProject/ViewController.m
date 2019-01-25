//
//  ViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2018/11/14.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import "ViewController.h"
#import "RdToolsHeader.h"
#import "ScrollViewController.h"
#import "MasonryViewController.h"
#import "TimerViewController.h"
#import "GCDViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

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
    self.dataArr = [NSMutableArray arrayWithArray:@[@"scrollVIew", @"view", @"timer", @"gcd"]];
}

- (void)makeView{
    self.tableView = [UITableView rd_TableView:Rd_ColorWith(whiteColor) forView:self.view];
    self.tableView.rd_edgeEqualTo(Rd_NavibarH, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
//
//    RdRepeatTimer *timer = [RdRepeatTimer rd_setRepeatTimer:2.0 actionBlock:^{
//        NSLog(@"hehe");
//    }];
//
//    [RdOnceTimer rd_setOnceTimer:10.0 actionBlock:^{
//        NSLog(@"hahaha");
//        [timer rd_cancelRepeatTimer];
//    }];
//
//
//
//
//
//    UIView *bottomView = [UIView rd_ViewBGColor:Rd_ColorWith(greenColor) for:self.view];
//    bottomView.rd_sizeValue(Rd_ScreenWidth, 50).rd_bottomEqualTo(nil, -Rd_SafeAreaBottom);
//
//    UITextField *field = [[UITextField alloc] init];
//    [bottomView addSubview:field];
//    field.backgroundColor = Rd_ColorWith(whiteColor);
//    field.borderStyle = UITextBorderStyleRoundedRect;
//    field.rd_leftEqualTo(nil, Rd_MarginDefault).rd_centerYEqualTo(nil, 0).rd_heightValue(40).rd_rightEqualTo(nil, -60);
//
//    UIButton *cancel = [UIButton rd_ButtonJustTitle:@"完成" target:self action:@selector(cancelClick) superView:bottomView];
//    cancel.rd_leftToRightOf(field, Rd_MarginDefault).rd_rightEqualTo(nil, -Rd_MarginDefault).rd_centerYEqualTo(nil, 0); cancel.rd_setButtonBgColorNormal(Rd_ColorWith(whiteColor)).rd_setButtonTitleColorNormal(Rd_ColorWith(blackColor));
//    cancel.rd_setLayerCornerRadius(3);
//
//    self.kbTools = [[RdKeyboardTools alloc] init];
//    [self.kbTools rd_setShow:^(CGFloat time, CGFloat kbHeight) {
//        [UIView animateWithDuration:time animations:^{
//            bottomView.rd_bottomEqualTo(nil, -kbHeight);
//            [bottomView rd_animation];
//        }];
//    }];
//
//    [self.kbTools rd_setHidden:^(CGFloat time, CGFloat kbHeight) {
//        [UIView animateWithDuration:time animations:^{
//            bottomView.rd_bottomEqualTo(nil, -Rd_SafeAreaBottom);
//            [bottomView rd_animation];
//        }];
//    }];
}

#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseID = @"hehe";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ScrollViewController *vc = [[ScrollViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        MasonryViewController *vc = [[MasonryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
        TimerViewController *vc = [[TimerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3) {
        GCDViewController *vc = [[GCDViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)cancelClick{
    [self.view endEditing:YES];
}

- (void)dealloc{
    [self.kbTools rd_KeyboardRemoveObserver];
}


@end
