//
//  RdWebView.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/4/1.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "RdWebView.h"
#import "RdTools/RdToolsHeader.h"
#import <WebKit/WebKit.h>

@interface RdWebView () <WKNavigationDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation RdWebView

- (instancetype _Nonnull)initWithUrl:(NSString *)url{
    self = [super init];
    if (self) {
        self.bounces = false;
        self.bgView = [UIView rd_ViewBGColor:Rd_ColorWith(whiteColor) for:self];
        self.bgView.rd_edgeEqualTo(0, 0, 0, 0).rd_widthMultipliedBy(self, 1);
        
        UIView *header = [UIView rd_ViewBGColor:Rd_ColorWith(redColor) for:self.bgView];
        header.rd_edgeEqualTo(0, 0, Rd_IGNORE, 0).rd_heightValue(100);
        self.bgView.rd_addVerticalSubview(header, 0);
        
        self.webView = [[WKWebView alloc] init];//WithFrame:CGRectMake(0, header.rd_MaxY, self.bgView.rd_Width, 200)];
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        self.webView.navigationDelegate = self;
//        [self.bgView addSubview:self.webView];
        self.bgView.rd_addVerticalSubview(self.webView, 0);
        self.webView.rd_widthMultipliedBy(nil, 1).rd_heightValue(400).rd_centerXEqualTo(nil, 0);
        [self.webView loadRequest:request];
        self.webView.scrollView.scrollEnabled = NO;
    }
    return self;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    self.bgView.rd_heightValue(webView.scrollView.contentSize.height);
    webView.rd_heightValue(webView.scrollView.contentSize.height);
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
