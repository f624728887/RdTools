//
//  RdMacroFile.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//
// 0.4.3 fix bug, add function 20200517
// 0.4.4 fix bug, add function 20200517
// 0.4.5 block声明引用修改为Copy， 添加longpress方法， 添加线性震动反馈， 修改button分类方法， 添加RdWeakProxy类 等等

#import "UILabel+RdTools.h"
#import "RdToolsManager.h"

static inline BOOL isIPhoneXSeries() {
    BOOL iPhoneXSeries = NO;
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
        NSLog(@"%f, %f, %f, %f", mainWindow.safeAreaInsets.top, mainWindow.safeAreaInsets.left, mainWindow.safeAreaInsets.bottom, mainWindow.safeAreaInsets.right);
    }
    
    return iPhoneXSeries;
}

static inline float safeAreaTop() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.top;
    }
    return 20;
}

static inline float safeAreaSide() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.left;
    }
    return 0;
}

static inline float safeAreaBottom() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.bottom;
    }
    return 0;
}

#define Rd_IGNORE               CGFLOAT_MAX

#define Rd_FontNameNormal       [RdToolsManager getManager].fontNameDefault
#define Rd_AnimationDuration    0.26f

#define Rd_WeakSelf(type)        __weak typeof(type) weak##type = type;
#define Rd_StrongSelf(type)      __strong typeof(type) type = weak##type;

#define Rd_ScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define Rd_ScreenHeight         [[UIScreen mainScreen] bounds].size.height

#define Rd_SafeAreaTop          safeAreaTop()
#define Rd_SafeAreaSides        safeAreaSide()
#define Rd_SafeAreaBottom       safeAreaBottom()

#define Rd_isiPhoneX            isIPhoneXSeries()

#define Rd_isLandscape          ((Rd_ScreenWidth > Rd_ScreenHeight) ? true : false)

#define Rd_NavibarH             ((float)44 + Rd_SafeAreaTop)
#define Rd_TabbarH              ((float)49 + Rd_SafeAreaBottom)
#define Rd_StatusbarH           (Rd_SafeAreaTop)


#define Rd_NumberOfSingleLine(min, max) (Rd_ScreenWidth <= 750 ? min : max)


#define Rd_IMG_HEI_16_9         (Rd_ScreenWidth / 16.0 * 9.0)
#define Rd_IMG_HEI_4_3          (Rd_ScreenWidth / 4.0 * 3.0)

#define Rd_GET_HEI_16_9(width)  (width / 16.0 * 9.0)
#define Rd_GET_HEI_4_3(width)   (width / 4.0 * 3.0)

#define Rd_GET_WID_16_9(height) (height / 9.0 * 16.0)
#define Rd_GET_WID_4_3(height)  (height / 3.0 * 4.0)

#define Rd_MarginLarge          (20)
#define Rd_MarginMiddle         (15)
#define Rd_MarginDefault        (10)
#define Rd_MarginSmall          (5)

#define Rd_FontSizeS    12
#define Rd_FontSizeM    14
#define Rd_FontSizeL    16
#define Rd_FontSizeXL   22
#define Rd_FontSizeXXL  24

// rgb颜色转换（16进制->10进制）
#define Rd_Color_16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define Rd_Color_RGB_A(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define Rd_ColorWith(color) [UIColor color]

#define Rd_ImageWith(name) [UIImage imageNamed:name]


#define Rd_TapticEngine_Light           UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleLight];\
[generator prepare];\
[generator impactOccurred];


#define Rd_TapticEngine_Medium           UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];\
[generator prepare];\
[generator impactOccurred];


#define Rd_TapticEngine_Heavy           UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];\
[generator prepare];\
[generator impactOccurred];


#define Rd_Tapic        if (@available(iOS 10.0, *)) {\
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];\
    [generator prepare];\
    [generator impactOccurred];\
}

static inline NSString * getJsonWithDic(NSDictionary *dic) {
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *text =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return text;
}

static inline NSString * getJsonWithArr(NSArray *arr) {
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
    NSString *text =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return text;
}

static inline NSArray * getArrWithJson(NSString *string) {
    NSData *jsonData = [string dataUsingEncoding:NSASCIIStringEncoding];
    
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    return arr;
}

static inline NSDictionary * getDicWithJson(NSString *string) {
    NSData *jsonData = [string dataUsingEncoding:NSASCIIStringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
}

static inline UIImage * fixImageOrientation(UIImage *aImage) {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
    
    
}

//#ifndef RdMacroFile_h
//#define RdMacroFile_h
//
//
//#endif /* RdMacroFile_h */

