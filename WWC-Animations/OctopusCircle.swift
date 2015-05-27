//
//  OctopusCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class OctopusCircle: Circle {
    
    var originalColor:UIColor?
    
    override func commonInit() {
        super.commonInit()
        originalColor = backgroundColor
    }

    override func tapped(tap: UITapGestureRecognizer) {
        changeColor(reset: false)
        changeShape(reset: false)
        changeCornerRadius(reset: false)
    }
    
    override func longPressed(longPress: UILongPressGestureRecognizer) {
        changeColor(reset: true)
        changeShape(reset: true)
        changeCornerRadius(reset: true)
    }
    
    private func changeShape(#reset:Bool) {
        let x = CGFloat(randomInt(max: 15) + 5) / 10
        let y = CGFloat(randomInt(max: 15) + 5) / 10
        let size = reset ? CGSizeMake(1, 1) : CGSizeMake(x, y)
        let anim = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        anim.toValue = NSValue(CGSize: size)
        pop_addAnimation(anim, forKey: "scale")
    }
    
    private func changeCornerRadius(#reset:Bool) {
        let radius = reset ? cornerRadius : CGFloat(randomInt(max: Int(cornerRadius)))
        let anim = POPSpringAnimation(propertyNamed: kPOPLayerCornerRadius)
        anim.toValue = radius
        layer.pop_addAnimation(anim, forKey: "cornerRadius")
    }
    
    private func changeColor(#reset:Bool) {
        let color = reset ? originalColor : randomColor()
        let anim = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
        anim.toValue = color
        anim.springBounciness = 16
        pop_addAnimation(anim, forKey: "color")
    }
    
    // ===============
    // MARK: - Helpers
    // ===============
    
    private func randomColor() -> UIColor {
        let r = CGFloat(randomInt(max: 255)) / 255
        let g = CGFloat(randomInt(max: 255)) / 255
        let b = CGFloat(randomInt(max: 255)) / 255
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}
