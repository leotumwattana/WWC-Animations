//
//  BeeCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

@objc protocol BeeCircleDelegate {
    func beeCircleChangedActivation(bee: BeeCircle)
}

class BeeCircle: Circle {
    
    // ==================
    // MARK: - Properties
    // ==================
    
    weak var delegate:BeeCircleDelegate?
    
    var activated = false {
        didSet {
            delegate?.beeCircleChangedActivation(self)
            
            let alpha:CGFloat = activated ? 1 : 0
            animateLabelAlpha(alpha)
            
            if activated {
                superview?.bringSubviewToFront(self)
            }
        }
    }
    
    
    private var originalCenter:CGPoint!
    
    // ================
    // MARK: - Subviews
    // ================
    
    var label:UILabel!
    
    // ============
    // MARK: - Init
    // ============
    
    override func commonInit() {
        super.commonInit()
        label = UILabel()
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 35)
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.text = "!"
        label.alpha = 0
        addSubview(label)
        
        originalCenter = center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    // ======================
    // MARK: - Event Handlers
    // ======================
    
    override func tapped(tap: UITapGestureRecognizer) {
        activated = !activated
    }
    
    override func longPressed(longPressed: UILongPressGestureRecognizer) {
        moveToPoint(originalCenter)
        scale(to: 1)
        activated = false
    }
    
    // ===============
    // MARK: - Helpers
    // ===============
    
    func moveToPoint(point:CGPoint) {
        let toValue = NSValue(CGPoint: point)
        if let anim = pop_animationForKey("center") as? POPSpringAnimation {
            anim.toValue = toValue
        } else {
            let anim = POPSpringAnimation(propertyNamed: kPOPViewCenter)
            anim.toValue = toValue
            anim.springSpeed = 1
            anim.springBounciness = 12
            pop_addAnimation(anim, forKey: "center")
        }
    }
    
    private func animateLabelAlpha(alpha:CGFloat) {
        if let anim = label.pop_animationForKey("alpha") as? POPSpringAnimation {
            anim.toValue = alpha
        } else {
            let anim = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
            anim.toValue = alpha
            label.pop_addAnimation(anim, forKey: "alpha")
        }
    }
    
    func scale(to specifiedScale:CGFloat?) {
        let s:CGFloat = specifiedScale ?? CGFloat(randomInt(max: 2)) + 0.7
        let toValue = NSValue(CGSize: CGSizeMake(s, s))
        if let anim = pop_animationForKey("scale") as? POPSpringAnimation {
            anim.toValue = toValue
        } else {
            let anim = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            anim.toValue = toValue
            pop_addAnimation(anim, forKey: "scale")
        }
        
        if s < 1 {
            superview?.sendSubviewToBack(self)
        } else {
            superview?.bringSubviewToFront(self)
        }
    }

}
