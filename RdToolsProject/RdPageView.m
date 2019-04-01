//
//  RdPageView.m
//  RdToolsProject
//
//  Created by Rondo_dada on 2019/3/14.
//  Copyright © 2019 Rondo. All rights reserved.
//

#import "RdPageView.h"
#import "RdTools/RdToolsHeader.h"

@interface RdPageView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *imgList;
@property (nonatomic, assign) CGFloat pageEdge;

@end

@implementation RdPageView

- (instancetype)initWithViewEdge:(CGFloat)viewEdge pageEdge:(CGFloat)pageEdge imageList:(NSArray <NSString *>*)imageList placeHolder:(NSString *)placeHolder forView:(UIView *)forView{
    self = [super init];
    if (self) {
        [forView addSubview:self];
        self.imgList = [NSMutableArray arrayWithCapacity:0];
        self.pageEdge = pageEdge;
        self.scrollView = [UIScrollView rd_HScrollView:Rd_ColorWith(whiteColor) forView:self];
        self.scrollView.rd_edgeEqualTo(viewEdge, viewEdge, -viewEdge, -viewEdge);
        self.scrollView.clipsToBounds = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        for (int i = 0; i < imageList.count; i ++) {
            UIView *v = [UIView rd_ViewBGColor:Rd_ColorWith(whiteColor) for:self.scrollView.contentView];
            self.scrollView.contentView.rd_addHorizontalSubview(v, 0);
            v.rd_topEqualTo(nil, 0).rd_bottomEqualTo(nil, 0).rd_widthMultipliedBy(self.scrollView, 1);
            
            UIImageView *img = [UIImageView rd_ImageViewPlaceholder:placeHolder url:imageList[i] for:v];
            img.backgroundColor = Rd_ColorWith(whiteColor);
            if (i == 0) {
                img.rd_edgeEqualTo(0, 0, 0, 0);
            }
            else {
                img.rd_edgeEqualTo(pageEdge, pageEdge, -pageEdge, -pageEdge);
            }
            img.rd_setLayerCornerRadius(5);
            [self.imgList addObject:img];
        }
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self.scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat p = self.scrollView.contentOffset.x/self.scrollView.rd_Width;
    NSInteger z = roundf(p);
    if (p<0 || p > self.imgList.count - 1) {
        return;
    }
    if (z < p) {
        CGFloat m = p-z;
        CGFloat pageEdge = self.pageEdge - self.pageEdge*m;
        
        UIImageView *s = self.imgList[z];
        s.rd_edgeEqualTo(self.pageEdge*m, self.pageEdge*m, -self.pageEdge*m, -self.pageEdge*m);
        
        if ((z+1)<=(self.imgList.count-1)) {
            UIImageView *b = self.imgList[z+1];
            b.rd_edgeEqualTo(pageEdge, pageEdge, -pageEdge, -pageEdge);
        }
    }
    else if (z > p) {
        CGFloat m = p-(z-1);
        CGFloat pageEdge = self.pageEdge - self.pageEdge*m;
        
        UIImageView *b = self.imgList[z];
        b.rd_edgeEqualTo(pageEdge, pageEdge, -pageEdge, -pageEdge);
        
        if ((z-1)>=0) {
            UIImageView *s = self.imgList[z-1];
            s.rd_edgeEqualTo(self.pageEdge*m, self.pageEdge*m, -self.pageEdge*m, -self.pageEdge*m);
        }
    }
    else {
        UIImageView *max = self.imgList[z];
        max.rd_edgeEqualTo(0, 0, 0, 0);
        
        if ((z+1)<=(self.imgList.count-1)) {
            UIImageView *min = self.imgList[z+1];
            min.rd_edgeEqualTo(self.pageEdge, self.pageEdge, -self.pageEdge, -self.pageEdge);
        }
        
        if ((z-1)>=0) {
            UIImageView *min2 = self.imgList[z-1];
            min2.rd_edgeEqualTo(self.pageEdge, self.pageEdge, -self.pageEdge, -self.pageEdge);
        }
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
