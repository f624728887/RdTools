//
//  TimerViewController.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/1/2.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "TimerViewController.h"
#import "RdTools/RdToolsHeader.h"

@interface TimerViewController ()

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) RdKeyboardTools *kbManager;
@property (nonatomic, strong) UITextField *addfield;
@property (nonatomic, strong) UILabel *logLabel;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dataInit];
    [self makeView];
    
//    [self rd_ClearBarLeftBtn];
    [self rd_SetControllerTitle:@"啦" textColor:[UIColor redColor] textFont:nil textSize:15];
    [self rd_SetDefaultTitleBackBtn];
//    [self rd_SetLeftBtnJustTitle:@"hehe" responder:nil];
    
    SEL aSel = @selector(makeView);
    NSLog(@"%p", aSel);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"qweasd");
}

- (void)dataInit{
//    self.title = @"timer";
    self.view.backgroundColor = Rd_ColorWith(whiteColor);
}

- (void)makeView{
    self.addfield = [UITextField rd_FieldBgColor:nil fontName:nil size:Rd_FontSizeM textColor:Rd_ColorWith(blueColor) placeholder:nil returnType:UIReturnKeyDone borderStyle:UITextBorderStyleRoundedRect keyboardType:UIKeyboardTypeNumberPad superView:self.view];
    self.addfield.rd_topEqualTo(nil, Rd_NavibarH + Rd_MarginLarge).rd_heightValue(40).rd_leftEqualTo(nil, Rd_MarginDefault);
    
    self.logLabel = [UILabel rd_LabelString:nil fontName:nil fontSize:Rd_FontSizeM lineNumber:1 textColor:Rd_ColorWith(redColor) superView:self.view];
    self.logLabel.rd_leftEqualTo(nil, Rd_MarginDefault).rd_topToBottmOf(self.addfield, Rd_MarginLarge).rd_rightEqualTo(nil, -Rd_MarginDefault).rd_heightValue(50);
    self.logLabel.backgroundColor = Rd_ColorWith(yellowColor);
    
    Rd_WeakSelf(self);
    UIButton *addbutton = [UIButton rd_BtnTitle:@"添加计时器" forView:self.view responder:^(UIButton *sender) {
        Rd_StrongSelf(self);
        [self.view endEditing:YES];
        sender.enabled = NO;
        NSLog(@"开始");
        NSInteger __block time = [self.addfield.text integerValue];
        RdRepeatTimer *repeat = [RdRepeatTimer rd_setRepeatTimer:1.0 actionBlock:^{
            if (time < 0) {
                return;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.logLabel.text = [NSString stringWithFormat:@"%ld", (long)(time = time - 1)];
                NSLog(@"%ld", (long)time);
            });
        }];
        [RdOnceTimer rd_setOnceTimer:time actionBlock:^{
            [repeat rd_cancelRepeatTimer];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.logLabel.text = @"停止";
                sender.enabled = YES;
            });
        }];
    }];
    addbutton.rd_setButtonBgColorNormal(Rd_ColorWith(greenColor));
    addbutton.rd_topEqualTo(self.addfield, 0).rd_leftToRightOf(self.addfield, Rd_MarginDefault).rd_heightValue(40).rd_rightEqualTo(nil, -Rd_MarginDefault);
    
    
    self.bottomView = [UIView rd_ViewBGColor:Rd_ColorWith(greenColor) for:self.view];
    self.bottomView.rd_sizeValue(Rd_ScreenWidth, 40 + Rd_SafeAreaBottom).rd_leftEqualTo(nil, 0).rd_bottomEqualTo(nil, 0);
    [self.bottomView rd_setSingleTap:^(UITapGestureRecognizer *sender) {
        Rd_StrongSelf(self);
        [self.view endEditing:YES];
    }];
    
    self.kbManager = [[RdKeyboardTools alloc] init];
    [self.kbManager rd_setShow:^(CGFloat time, CGFloat kbHeight) {
        [UIView animateWithDuration:time animations:^{
            Rd_StrongSelf(self);
            self.bottomView.rd_bottomEqualTo(nil, -kbHeight);
            [self.bottomView rd_animation];
        }];
    }];
    
    [self.kbManager rd_setHidden:^(CGFloat time, CGFloat kbHeight) {
        [UIView animateWithDuration:time animations:^{
            Rd_StrongSelf(self);
            self.bottomView.rd_bottomEqualTo(nil, 0);
            [self.bottomView rd_animation];
        }];
    }];
}

- (void)dealloc{
    [self.kbManager rd_KeyboardRemoveObserver];
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
