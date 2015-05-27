//
//  UIColor+Extensions.swift
//  OneReminder
//
//  Created by Leo Tumwattana on 1/5/15.
//  Copyright (c) 2015 Mothership Factory Ltd. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red:Int, green:Int, blue:Int, a:CGFloat) {
        let r = CGFloat(Double(red) / 255)
        let g = CGFloat(Double(green) / 255)
        let b = CGFloat(Double(blue) / 255)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    func adjust(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return UIColor(red: red+r,
            green: green+g,
            blue: blue+b,
            alpha: alpha+a)
    }
    
    func adjust(hue:CGFloat, saturation:CGFloat, brightness:CGFloat, alpha:CGFloat) -> UIColor {
        var h:CGFloat = 0, s:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        return UIColor(hue: h+hue,
            saturation: s+saturation,
            brightness: b+brightness,
            alpha: a+alpha)
    }
    
}
