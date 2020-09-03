//
//  UIColorExtension.swift
//  youtube
//
//  Created by Brayan Kelly Balbuena on 9/1/20.
//  Copyright © 2020 Brayan Kelly Balbuena. All rights reserved.
//

import UIKit

let rgbMax = CGFloat(integerLiteral: 255)
extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) ->  UIColor {
        return UIColor(red: red / rgbMax, green: green / rgbMax, blue: blue / rgbMax, alpha: 1)
    }
}


