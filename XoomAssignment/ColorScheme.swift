//
//  ColorScheme.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/28/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit

struct ColorScheme {
    static let navigationBarForegroundColor = UIColor.white
    static let navigationBarBackgroundColor = UIColor.colorWithHex(hex: ColorName.XoomGreen)
    
    static let pickerBackgroundColor = UIColor.white
    static let toolBarTintColor = UIColor.colorWithHex(hex: ColorName.XoomGreen)
    
    fileprivate struct ColorName {
        static let XoomGreen = "55B949"
    }
}
