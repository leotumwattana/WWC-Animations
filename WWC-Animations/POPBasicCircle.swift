//
//  POPBasicCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class POPBasicCircle: Circle {

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
        let anim = POPBasicAnimation(propertyNamed: kPOPLayerTranslationX)
        anim.toValue = x
        anim.duration = 0.5
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        layer.pop_addAnimation(anim, forKey: "translation")
    }

}
