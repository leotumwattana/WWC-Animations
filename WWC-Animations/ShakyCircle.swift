//
//  ShakyCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 27/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class ShakyCircle: Circle {

    override func tapped(tap: UITapGestureRecognizer) {
        if let anim = layer.pop_animationForKey("shake") as? POPAnimation {
            reset()
        } else {
            shake()
        }
    }
    
    private func shake() {
        let shake = POPBasicAnimation(propertyNamed: kPOPLayerTranslationX)
        shake.fromValue = -5
        shake.toValue = 5
        shake.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shake.duration = 0.05
        shake.autoreverses = true
        shake.repeatForever = true
        layer.pop_removeAnimationForKey("reset")
        layer.pop_addAnimation(shake, forKey: "shake")
    }
    
    private func reset() {
        let reset = POPSpringAnimation(propertyNamed: kPOPLayerTranslationX)
        reset.toValue = 0
        reset.velocity = 2000
        reset.springBounciness = 20
        reset.dynamicsFriction = 10
        reset.dynamicsTension = 1000
        layer.pop_removeAnimationForKey("shake")
        layer.pop_addAnimation(reset, forKey: "reset")
        
        let scream = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scream.toValue = NSValue(CGSize: CGSizeMake(1.5, 1.5))
        scream.springSpeed = 20
        scream.completionBlock = { [unowned self] (anim, finished) in
            let settle = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
            settle.toValue = NSValue(CGSize: CGSizeMake(1, 1))
            self.layer.pop_addAnimation(settle, forKey: "scale")
        }
        layer.pop_addAnimation(scream, forKey: "scale")
    }

}
