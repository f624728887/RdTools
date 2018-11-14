//
//  RdBaseViewController.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/20.
//  Copyright © 2018年 王佳兴. All rights reserved.
//

#import "RdBaseViewController.h"
#import "UIViewController+RdTools.h"
#import "RdMacroFile.h"

@interface RdBaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation RdBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//
//    [self rd_SetDefaultImgBackBtn];
    
    [self rdSetUpForDismissKeyboard];
    
}

#pragma mark - 点击textFiel以外的地方关闭键盘
- (void)rdSetUpForDismissKeyboard {
    Rd_WeakSelf(self);
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    Rd_StrongSelf(self);
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    Rd_StrongSelf(self);
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
