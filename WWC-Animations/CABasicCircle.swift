//
//  CABasicCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit

class CABasicCircle: Circle {
    
    var translated = false

    override func tapped(tap: UITapGestureRecognizer) {
        if translated {
            translateBy(0)
        } else {
            translateBy(700)
        }
        translated = !translated
    }
    
    private func translateBy(x:CGFloat) {
        let anim = CABasicAnimation(keyPath: "transform.translation.x")
        anim.toValue = x
        anim.duration = 0.5
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        layer.addAnimation(anim, forKey: "transform.translation.y")
    }

}
