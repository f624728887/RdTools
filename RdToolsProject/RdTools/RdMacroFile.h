//
//  RdMacroFile.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#define Rd_FontNameNormal       @"PingFangSC-Light"
#define Rd_AnimationDuration    0.26f

#define Rd_WeakSelf(type)        __weak typeof(type) weak##type = type
#define Rd_StrongSelf(type)      __strong typeof(type) type = weak##type

#define Rd_ScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define Rd_ScreenHeight         [[UIScreen mainScreen] bounds].size.height

#define Rd_isiPhoneX            ((([[UIScreen mainScreen] bounds].size.width == 375 && [[UIScreen mainScreen] bounds].size.height == 812) || ([[UIScreen mainScreen] bounds].size.width == 812 && [[UIScreen mainScreen] bounds].size.height == 375)) ? true : false)

#define Rd_isLandscape          ((Rd_ScreenWidth > Rd_ScreenHeight) ? true : false)

#define Rd_NavibarH             (Rd_isiPhoneX ? (float)88 : (float)64)
#define Rd_TabbarH              (Rd_isiPhoneX ? (float)(49 + 34) : (float)49)
#define Rd_StatusbarH           (Rd_isiPhoneX ? (float)44 : (float)20)
#define Rd_SafeAreaBottomH      (Rd_isiPhoneX ? (Rd_isLandscape ? (float)21 : (float)34): (float)0)
#define Rd_SafeAreaSidesH       ((Rd_isiPhoneX && Rd_isLandscape) ? (float)44 : (float)0)
#define Rd_SafeAreaLandscapeBottomH ((Rd_isiPhoneX && Rd_isLandscape) ? (float)21 : (float)0)
#define Rd_StatusLandscapeH     ((Rd_isiPhoneX && Rd_isLandscape) ? (float)0 : (float)20)


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

//#ifndef RdMacroFile_h
//#define RdMacroFile_h
//
//
//#endif /* RdMacroFile_h */

