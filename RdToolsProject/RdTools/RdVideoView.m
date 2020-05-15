//
//  RdVideoView.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/20.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "RdVideoView.h"
#import "RdToolsHeader.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSUInteger, RdVideoHudType) {
    RdVideoHudTypeFirstLoading,
    RdVideoHudTypeLoading,
    RdVideoHudTypeFailed,
    RdVideoHudTypeSuccess,
};

@interface RdVideoView()

//baseView
@property (nonatomic, strong)UIView *backTitleView;
@property (nonatomic, assign)id playbackTimeObserver;
@property (nonatomic, assign)BOOL isFull;
@property (nonatomic, strong)UISlider *volumeViewSlider;
@property (nonatomic, assign)CGPoint firstPoint;
@property (nonatomic, assign)CGPoint secondPoint;
@property (nonatomic, assign)NSInteger timeManager;
@property (nonatomic, assign)UIInterfaceOrientation orientation;
@property (nonatomic, strong)void (^myLeft)(void);
@property (nonatomic, strong)void (^myright)(void);
@property (nonatomic, strong)void (^myUp)(void);

// videoView
@property (nonatomic, strong)AVPlayer *videoPlayer;
@property (nonatomic, strong)AVPlayerItem *videoItem;
@property (nonatomic, strong)AVPlayerLayer *videoLayer;
@property (nonatomic, strong)UIView *videoBase;
@property (nonatomic, assign)CGFloat videoCurrentTime;
@property (nonatomic, assign)NSString *videoTotalTime;

// touchView
@property (nonatomic, strong)UIView *touchView;

//toolVIew
@property (nonatomic, strong)UIView *toolView;
@property (nonatomic, strong)UIButton *playBtn;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *fullBtn;
@property (nonatomic, strong)UISlider *progressBar;

@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UILabel *titleLabel;

//loadingView
@property (nonatomic, strong)UIView *hudBaseView;
@property (nonatomic, strong)UILabel *hudLabel;

@end

@implementation RdVideoView

- (instancetype)initForView:(UIView *)superView{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.clipsToBounds = YES;
        [superView addSubview:self];
        
        [self dataInit];
        
        //shipin
        self.videoBase = [UIView rd_ViewBGColor:nil for:self];
        self.videoBase.rd_edgeEqualTo(0, 0, 0, 0);
        
        self.touchView = [UIView rd_ViewBGColor:nil for:self];
        self.touchView.rd_edgeEqualTo(0, 0, 0, 0);
        [self makeTouchView];
        
        // tool
        self.toolView = [UIView rd_ViewBGColor:nil for:self];
        self.toolView.rd_edgeEqualTo(Rd_IGNORE, Rd_SafeAreaSides, -Rd_SafeAreaBottom, -Rd_SafeAreaSides).rd_heightValue(40);
        [self makeToolView];
        
        self.titleView = [UIView rd_ViewBGColor:nil for:self];
        self.titleView.rd_edgeEqualTo(-(40 + (Rd_isiPhoneX ? 0 : 20)), Rd_SafeAreaSides, Rd_IGNORE, -Rd_SafeAreaSides).rd_heightValue(40 + (Rd_isiPhoneX ? 0 : 20));
        [self makeTitleView];
        
        // hud
        self.hudBaseView = [UIView rd_ViewBGColor:nil for:self];
        self.hudBaseView.rd_edgeEqualTo(0, 0, 0, 0);
        [self makeHUDView];
        
    }
    return self;
}

- (void)dataInit{
    self.playbackTimeObserver = nil;
    
    self.isFull = NO;
    
    self.videoCurrentTime = 0.0;
    self.videoTotalTime = @"00:00";
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [session setActive:YES error:nil];
    
    MPVolumeView *volumeView = [[MPVolumeView alloc]init];
    [volumeView sizeToFit];
    
    self.volumeViewSlider = [[UISlider alloc]init];
    self.volumeViewSlider.backgroundColor = [UIColor clearColor];
    for (UIControl *view in volumeView.subviews) {
        if ([view.superclass isSubclassOfClass:[UISlider class]]) {
            _volumeViewSlider = (UISlider *)view;
        }
    }
    self.volumeViewSlider.autoresizesSubviews = NO;
    self.volumeViewSlider.autoresizingMask = UIViewAutoresizingNone;
    self.volumeViewSlider.hidden = YES;
    [self addSubview:_volumeViewSlider];
    
    self.orientation = UIInterfaceOrientationPortrait;
}

- (void)deviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation {
    UIDevice *device = [UIDevice currentDevice] ;
    
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            break;
            
        case UIDeviceOrientationFaceDown:
            break;
            
        case UIDeviceOrientationUnknown:
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            if (self.orientation == UIInterfaceOrientationPortrait || self.orientation == UIInterfaceOrientationLandscapeRight) {
                [self leftFullClick];
            }
            break;
            
        case UIDeviceOrientationLandscapeRight:
            if (self.orientation == UIInterfaceOrientationPortrait || self.orientation == UIInterfaceOrientationLandscapeLeft) {
                [self rightFullClick];
            }
            break;
            
        case UIDeviceOrientationPortrait:
            if (self.orientation == UIInterfaceOrientationLandscapeLeft || self.orientation == UIInterfaceOrientationLandscapeRight) {
                [self unfullClick];
            }
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            break;
            
        default:
            break;
    }
}

- (void)resetTitleToolsView{
    self.toolView.rd_edgeEqualTo(Rd_IGNORE, Rd_SafeAreaSides, -Rd_SafeAreaBottom, -Rd_SafeAreaSides).rd_heightValue(40);
    self.titleView.rd_edgeEqualTo(-(Rd_isLandscape ? 0 : (40 + (Rd_isiPhoneX ? 0 : 20))), Rd_SafeAreaSides, Rd_IGNORE, -Rd_SafeAreaSides).rd_heightValue(40 + (Rd_isiPhoneX ? 0 : 20));
}

- (void)leftFullClick{
    if (self.orientation == UIInterfaceOrientationPortrait || self.orientation == UIInterfaceOrientationLandscapeRight) {
        self.orientation = UIInterfaceOrientationLandscapeLeft;
        [UIView animateWithDuration:0.26 animations:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            if (self.myLeft) {
                self.myLeft();
                self.videoLayer.frame = CGRectMake(0, 0, Rd_ScreenWidth, Rd_ScreenHeight);
                self.isFull = YES;
                self.fullBtn.hidden = YES;
                
                [self resetTitleToolsView];
            }
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        }];
    }
    
}

- (void)rightFullClick{
    if (self.orientation == UIInterfaceOrientationPortrait || self.orientation == UIInterfaceOrientationLandscapeLeft) {
        self.orientation = UIInterfaceOrientationLandscapeRight;
        [UIView animateWithDuration:0.26 animations:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            if (self.myright) {
                self.myright();
                self.videoLayer.frame = CGRectMake(0, 0, Rd_ScreenWidth, Rd_ScreenHeight);
                self.isFull = YES;
                self.fullBtn.hidden = YES;
                
                [self resetTitleToolsView];
            }
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        }];
    }
    
}

- (void)unfullClick{
    if (self.orientation == UIInterfaceOrientationLandscapeRight || self.orientation == UIInterfaceOrientationLandscapeLeft) {
        self.orientation = UIInterfaceOrientationPortrait;
        [UIView animateWithDuration:0.26 animations:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
            if (self.myUp) {
                self.myUp();
                self.videoLayer.frame = CGRectMake(0, 0, Rd_ScreenWidth, Rd_GET_HEI_16_9(Rd_ScreenWidth));
                self.isFull = NO;
                self.fullBtn.hidden = NO;
                
                [self resetTitleToolsView];
            }
        }];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in event.allTouches) {
        self.firstPoint = [touch locationInView:self.touchView];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in event.allTouches) {
        self.secondPoint = [touch locationInView:self.touchView];
    }

    if (fabs(self.firstPoint.x - self.secondPoint.x) > fabs(self.firstPoint.y - self.secondPoint.y)) {
        return;
    }
    
    self.volumeViewSlider.value += (self.firstPoint.y - self.secondPoint.y)/500.0;
    self.firstPoint = self.secondPoint;
}

- (void)removeObject:(NSNotification *)noti{
    if (self.isFull) {
        [self unfullClick];
        [self videoStop];
    }
    else {
        [self videoStop];
    }
}

#pragma mark - video
- (void)videoInit:(NSString *)videoUrl title:(NSString *)title{
    [self videoItemAddObserver:videoUrl];
    
    self.titleLabel.text = title;
    
    self.videoPlayer = [AVPlayer playerWithPlayerItem:self.videoItem];
    
    self.videoLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
    self.videoLayer.frame = CGRectMake(0, 0, Rd_ScreenWidth, Rd_GET_HEI_16_9(Rd_ScreenWidth));
    self.videoLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.videoBase.layer addSublayer:self.videoLayer];
}

- (void)resetVideoUrl:(NSString *)videoUrl title:(NSString *)title{
    [self removeVideoObserver];
    [self setHudLabelForType:RdVideoHudTypeFirstLoading content:nil];
    
    [self videoItemAddObserver:videoUrl];
    self.titleLabel.text = title;
    
    [self.videoPlayer replaceCurrentItemWithPlayerItem:self.videoItem];
}

- (void)videoItemAddObserver:(NSString *)url{
    self.videoItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [self.videoItem addObserver:self
                     forKeyPath:@"status"
                        options:NSKeyValueObservingOptionNew
                        context:nil];
    [self.videoItem addObserver:self
                     forKeyPath:@"loadedTimeRanges"
                        options:NSKeyValueObservingOptionNew
                        context:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.videoItem];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark - 视频播放状态监听
- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context{
    
    if([keyPath isEqualToString:@"status"]) {
        
        AVPlayerStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        
        switch (status) {
            case AVPlayerStatusFailed:{
                [self setHudLabelForType:RdVideoHudTypeFailed content:nil];
            }
                break;
            case AVPlayerStatusUnknown:{
                [self setHudLabelForType:RdVideoHudTypeFailed content:nil];
                self.hudBaseView.hidden = NO;
            }
                break;
            case AVPlayerStatusReadyToPlay:{
                [self setHudLabelForType:RdVideoHudTypeSuccess content:nil];
                
                CMTime duration = self.videoItem.duration;
                CGFloat totalSecond = self.videoItem.duration.value / self.videoItem.duration.timescale;
                self.videoTotalTime = [self convertTime:totalSecond];
                self.progressBar.maximumValue = CMTimeGetSeconds(duration);
                
                [self videoPlay];

                [self monitoringPlayback];
            }
                break;
            default:
                break;
        }
    }
    else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSTimeInterval timeInterval = [self availableDuration];
        CMTime duration = self.videoItem.duration;
        CGFloat totalDuration = CMTimeGetSeconds(duration);

        CGFloat canPlayTime = timeInterval - (self.videoCurrentTime / CMTimeGetSeconds(duration))*totalDuration;
        CGFloat percentage = canPlayTime/3*100;
        

        if (canPlayTime<2) {
            self.hudBaseView.hidden = NO;
            if (percentage < 0) {
                percentage = 0;
            }
            [self setHudLabelForType:RdVideoHudTypeLoading content:[NSString stringWithFormat:@"正在加载%.1f%%",percentage]];
            [self videoPause];
        }
        if (canPlayTime > 3) {
            if (self.hudBaseView.hidden == NO) {
                [self setHudLabelForType:RdVideoHudTypeSuccess content:nil];
                [self videoPlay];
            }
        }
    }
}

- (void)timeFire{
    if (self.timeManager >= 10) {
        [self toolHidden];
    }
    self.timeManager ++;
}

- (void)monitoringPlayback{
    if (self.playbackTimeObserver != nil) {
        return;
    }
    
    Rd_WeakSelf(self);
    self.playbackTimeObserver = [self.videoPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:NULL usingBlock:^(CMTime time) {
        Rd_StrongSelf(self);
        CGFloat currentSecond = self.videoItem.currentTime.value/self.videoItem.currentTime.timescale;// 计算当前在第几秒
        self.videoCurrentTime = currentSecond;
        [self.progressBar setValue:currentSecond animated:YES];
        NSString *timeString = [self convertTime:currentSecond];
        self.timeLabel.text = [NSString stringWithFormat:@"%@/%@",timeString,self.videoTotalTime];
    }];
}

- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [[self.videoPlayer currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
}

#pragma mark - touch
- (void)makeTouchView{
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    singleTap.numberOfTapsRequired = 1; // 单击
    [self.touchView addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(videoPlayClick)];
    doubleTap.numberOfTapsRequired = 2; // 双击
    [self.touchView addGestureRecognizer:doubleTap];
    [singleTap requireGestureRecognizerToFail:doubleTap];
}

- (void)handleSingleTap{
    if (self.toolView.hidden) {
        [self toolUnhidden];
    }
    else {
        [self toolHidden];
    }
}

#pragma mark - tool
- (void)makeToolView{    
    [UIView rd_ViewBGColor:[UIColor grayColor] for:self.toolView].rd_edgeEqualTo(0, 0, 0, 0).alpha = 0.7;
    
    self.playBtn = [UIButton rd_BtnBGColor:nil superView:self.toolView];
    self.playBtn.rd_leftEqualTo(nil, Rd_MarginSmall).rd_centerYEqualTo(nil, 0).rd_squareLengthValue(40);
    self.playBtn.rd_setButtonImageNormal(@"video_play").rd_setButtonImageSelected(@"video_pause");
    [self.playBtn addTarget:self action:@selector(videoPlayClick) forControlEvents:UIControlEventTouchUpInside];
    
    Rd_WeakSelf(self);
    self.fullBtn = [UIButton rd_BtnImage:@"video_fullscreen" forView:self.toolView responder:^(UIButton *sender) {
        Rd_StrongSelf(self);
        [self fullClick];
    }];
    self.fullBtn.rd_edgeEqualTo(0, Rd_IGNORE, 0, -Rd_MarginSmall).rd_squareLengthValue(40);
    
    self.timeLabel = [UILabel rd_LabelString:@"00:00:00/00:00:00" fontName:nil fontSize:Rd_FontSizeS lineNumber:1 textColor:[UIColor whiteColor] superView:self.toolView];
    self.timeLabel.rd_edgeEqualTo(0, Rd_IGNORE, 0, Rd_IGNORE).rd_rightToLeftOf(self.fullBtn, 0).rd_widthValue([self.timeLabel rd_getLabelStringWidth]);
    [self.timeLabel rd_setTextAlignmentCenter];
    
    self.progressBar = [[UISlider alloc] init];
    self.progressBar.minimumTrackTintColor = Rd_ColorWith(orangeColor);
    self.progressBar.maximumTrackTintColor = Rd_ColorWith(lightGrayColor);
    [self.progressBar setThumbImage:Rd_ImageWith(@"video_dot") forState:UIControlStateNormal];
    self.progressBar.continuous = NO;
    [self.progressBar addTarget:self
                     action:@selector(videoSliderChangeValueEnd:)
           forControlEvents:UIControlEventValueChanged];
    [self.progressBar addTarget:self
                     action:@selector(videoSliderChangeBegin:)
           forControlEvents:UIControlEventEditingDidBegin];
    [self.toolView addSubview:self.progressBar];
    self.progressBar.rd_edgeEqualTo (0, Rd_IGNORE, 0, Rd_IGNORE).rd_leftToRightOf(self.playBtn, Rd_MarginSmall).rd_rightToLeftOf(self.timeLabel, -Rd_MarginSmall);
}

- (void)makeTitleView{
    [UIView rd_ViewBGColor:Rd_ColorWith(grayColor) for:self.titleView].rd_edgeEqualTo(0, 0, 0, 0).alpha = 0.7;
    Rd_WeakSelf(self);
    UIButton *backBtn = [UIButton rd_BtnImage:@"AppNavigationBack" forView:self.titleView responder:^(UIButton *sender) {
        Rd_StrongSelf(self);
        [self appWillBack];
    }];
//    UIButton *backBtn = [UIButton rd_ButtonJustImg:@"AppNavigationBack" target:self action:@selector(appWillBack) superView:self.titleView];
    backBtn.rd_edgeEqualTo((Rd_isiPhoneX ? 0 : 20), 0, 0, Rd_IGNORE).rd_squareLengthValue(40);
    
    self.titleLabel = [UILabel rd_LabelString:nil fontName:nil fontSize:Rd_FontSizeL lineNumber:1 textColor:Rd_ColorWith(whiteColor) superView:self.titleView];
    self.titleLabel.rd_leftToRightOf(backBtn, Rd_MarginDefault).rd_rightEqualTo(nil, -Rd_MarginDefault).rd_edgeEqualTo((Rd_isiPhoneX ? 0 : 20), Rd_IGNORE, 0, Rd_IGNORE);
}

- (void)toolHidden{
    if (!self.toolView.hidden) {
        Rd_WeakSelf(self);
        [UIView animateWithDuration:Rd_AnimationDuration animations:^{
            Rd_StrongSelf(self);
            self.toolView.alpha = 0;
            self.titleView.alpha = 0;
        } completion:^(BOOL finished) {
            Rd_StrongSelf(self);
            self.toolView.hidden = YES;
            self.titleView.hidden = YES;
        }];
        if (self.isFull) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        }
    }
}

- (void)toolUnhidden{
    if (self.toolView.hidden) {
        self.toolView.hidden = NO;
        self.titleView.hidden = NO;
        self.toolView.alpha = 0;
        self.titleView.alpha = 0;
        Rd_WeakSelf(self);
        [UIView animateWithDuration:Rd_AnimationDuration animations:^{
            Rd_StrongSelf(self);
            self.toolView.alpha = 1;
            self.titleView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
        if (self.isFull) {
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        }
    }
}

- (NSString *)convertTime:(CGFloat)second{
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (second/3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    NSString *showtimeNew = [formatter stringFromDate:d];
    return showtimeNew;
}

- (void)videoSliderChangeValueEnd:(UISlider *)slider{
    CMTime changedTime = CMTimeMakeWithSeconds(slider.value, 1);
    self.videoCurrentTime = slider.value;
    Rd_WeakSelf(self);
    [self.videoPlayer seekToTime:changedTime completionHandler:^(BOOL finished) {
        Rd_StrongSelf(self);
        [self videoPlayer];
    }];
}

- (void)videoSliderChangeBegin:(UISlider *)slider{
    [self videoPause];
}

- (void)videoPlayClick{
    if (self.playBtn.selected) {
        [self.videoPlayer pause];
        self.playBtn.selected = NO;
    }
    else {
        [self.videoPlayer play];
        self.playBtn.selected = YES;
    }
}

#pragma mark - hud(loading)
- (void)makeHUDView{
    self.hudLabel = [UILabel rd_LabelString:nil fontName:nil fontSize:Rd_FontSizeL lineNumber:1 textColor:Rd_ColorWith(blueColor) superView:self.hudBaseView];
    self.hudLabel.rd_edgeEqualTo(0, 0, 0, 0);
    [self.hudLabel rd_setTextAlignmentCenter];
    
    [self setHudLabelForType:RdVideoHudTypeFirstLoading content:nil];
}

- (void)setHudLabelForType:(RdVideoHudType)type content:(NSString *_Nullable)content{
    if (type == RdVideoHudTypeSuccess) {
        if (self.hudBaseView.hidden) {
            return;
        }
        self.hudLabel.text = @"";
        self.hudBaseView.hidden = YES;
    }
    else {
        self.hudBaseView.hidden = NO;
        [self toolHidden];
        
        if (type == RdVideoHudTypeFirstLoading) {
            self.hudLabel.text = @"正在加载，请稍后";
        }
        else if (type == RdVideoHudTypeLoading) {
            self.hudLabel.text = content;
        }
        else if (type == RdVideoHudTypeFailed) {
            self.hudLabel.text = @"加载失败请重试";
        }
    }
}

#pragma mark - public
- (void)videoPlay{
    if (!self.playBtn.selected) {
        [self videoPlayClick];
    }
}

- (void)videoPause{
    if (self.playBtn.selected) {
        [self videoPlayClick];
    }
}

- (void)videoStop{
    [self removeVideoObserver];
}

- (void)removeVideoObserver{
    [self unfullClick];
    [self videoPause];
    
    [self.videoItem removeObserver:self forKeyPath:@"status" context:nil];
    [self.videoItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.videoItem];
    [self.videoPlayer removeTimeObserver:self.playbackTimeObserver];
    self.playbackTimeObserver = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)fullClick{
    [self leftFullClick];
}

- (void)appWillBack{
    [self unfullClick];
}

- (void)moviePlayDidEnd:(NSNotification *)notification {
    if (self.videoPlayer.status == AVPlayerStatusReadyToPlay) {
        [self.videoPlayer seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
            [self videoPause];
        }];
    }
}

- (void)setLeftFull:(void (^)(void))block{
    self.myLeft = block;
}

- (void)setRightFull:(void (^)(void))block{
    self.myright = block;
}

- (void)setUnfull:(void (^)(void))block{
    self.myUp = block;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
