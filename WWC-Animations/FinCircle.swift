//
//  FinCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class FinCircle: Circle {
    
    var expanded = false
    var label:UILabel!
    
    override func commonInit() {
        super.commonInit()
        label = UILabel()
        label.text = "FIN"
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 75)
        label.textColor = UIColor.whiteColor()
        label.sizeToFit()
    }

    override func tapped(tap: UITapGestureRecognizer) {
        if expanded {
            shrink()
        } else {
            expand()
        }
        expanded = !expanded
    }
    
    private func expand() {
        superview?.bringSubviewToFront(self)
        scaleTo(27)
        if let superview = superview {
            label.center = superview.center
            superview.bringSubviewToFront(label)
            superview.addSubview(label)
        }
    }
    
    private func shrink() {
        scaleTo(1, speed: 7)
        label.removeFromSuperview()
    }
    
    private func scaleTo(s:CGFloat, speed:CGFloat = 3) {
        let toValue = NSValue(CGSize: CGSizeMake(s, s))
        if let anim = pop_animationForKey("scale") as? POPSpringAnimation {
            anim.toValue = toValue
            anim.springSpeed = speed
        } else {
            let anim = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            anim.toValue = toValue
            anim.springSpeed = speed
            anim.dynamicsFriction = 20
            pop_addAnimation(anim, forKey: "scale")
        }
    }

}
