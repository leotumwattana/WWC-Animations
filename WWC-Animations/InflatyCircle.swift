//
//  InflatyCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class InflatyCircle: Circle {
    
    var inflated = false

    override func tapped(tap: UITapGestureRecognizer) {
        if inflated {
            deflate()
        } else {
            inflate()
        }
        inflated = !inflated
    }
    
    private func inflate() {
        let toValue = NSValue(CGSize: CGSizeMake(2, 2))
        if let anim = pop_animationForKey("scale") as? POPSpringAnimation {
            anim.toValue = toValue
        } else {
            let inflate = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            inflate.toValue = toValue
            inflate.springBounciness = 16
            inflate.springSpeed = 20
            pop_addAnimation(inflate, forKey: "scale")
        }
    }
    
    private func deflate() {
        let toValue = NSValue(CGSize: CGSizeMake(1, 1))
        if let anim = pop_animationForKey("scale") as? POPSpringAnimation {
            anim.toValue = toValue
        } else {
            let deflate = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            deflate.toValue = toValue
            deflate.springBounciness = 16
            deflate.springSpeed = 20
            pop_addAnimation(deflate, forKey: "scale")
        }
    }

}
