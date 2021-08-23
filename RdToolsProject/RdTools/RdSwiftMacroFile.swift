//
//  RdSwiftMacroFile.swift
//  RdToolsProject
//
//  Created by Rondo on 2021/8/23.
//  Copyright © 2021 Rondo. All rights reserved.
//

import Foundation
import UIKit

var Rd_IGNORE_SW = CGFloat.greatestFiniteMagnitude


var Rd_ScreenWidth_SW = UIScreen.main.bounds.size.width
var Rd_ScreenHeight_SW = UIScreen.main.bounds.size.height

var Rd_SafeAreaTop_SW = CGFloat(Rd_safeAreaTop())
var Rd_SafeAreaSides_SW = CGFloat(Rd_safeAreaSide())
var Rd_SafeAreaBottom_SW = CGFloat(Rd_safeAreaBottom())

var Rd_isiPhoneX_SW = Rd_isIPhoneXSeries()

var Rd_isLandscape_SW = ((Rd_ScreenWidth_SW > Rd_ScreenHeight_SW) ? true : false)

var Rd_NavibarH_SW = CGFloat(44 + Rd_SafeAreaTop_SW)
var Rd_TabbarH_SW = CGFloat(49 + Rd_SafeAreaBottom_SW)
var Rd_StatusbarH_SW = CGFloat(Rd_SafeAreaTop_SW)

func Rd_colorWithHex(hexStr : Int32) -> UIColor {
    let color = UIColor.init(red: ((CGFloat((hexStr & 0xFF0000) >> 16)) / 255.0), green: ((CGFloat((hexStr & 0xFF00) >> 8)) / 255.0), blue: ((CGFloat(hexStr & 0xFF)) / 255.0), alpha: 1.0)
    return color
}

func Rd_colorWithRGB(red : CGFloat, green : CGFloat, blue : CGFloat, alpha : CGFloat) -> UIColor {
    let color = UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    return color
}

func Rd_isIPhoneXSeries() -> Bool {
    return Rd_safeAreaBottom() > 0
}

func Rd_safeAreaTop() -> CGFloat {
    if #available(iOS 11.0, *) {
        if let mainWindow = UIApplication.shared.delegate?.window, let topSafe = mainWindow?.safeAreaInsets.top {
            return topSafe
        }
    }
    return 0
}

func Rd_safeAreaSide() -> CGFloat {
    if #available(iOS 11.0, *) {
        if let mainWindow = UIApplication.shared.delegate?.window, let leftSafe = mainWindow?.safeAreaInsets.left {
            return leftSafe
        }
    }
    return 0
}

func Rd_safeAreaBottom() -> CGFloat {
    if #available(iOS 11.0, *) {
        if let mainWindow = UIApplication.shared.delegate?.window, let bottomSafe = mainWindow?.safeAreaInsets.bottom {
            return bottomSafe
        }
    }
    return 0
}

func Rd_statusbarHeight() -> CGFloat {
    if #available(iOS 11.0, *) {
        if let mainWindow = UIApplication.shared.delegate?.window, let topSafe = mainWindow?.safeAreaInsets.top {
            return topSafe
        }
    }
    return 20
}
