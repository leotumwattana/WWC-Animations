//
//  WhirlWindCirle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class WhirlWindCirle: Circle {

    var spinning = false
    private var spinnerLayer:CAShapeLayer!
    
    override func commonInit() {
        super.commonInit()
        spinnerLayer = CAShapeLayer()
        spinnerLayer.lineCap = kCALineCapRound
        spinnerLayer.lineWidth = 12
        spinnerLayer.fillColor = UIColor.clearColor().CGColor
        spinnerLayer.hidden = true
        layer.addSublayer(spinnerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        spinnerLayer.path = UIBezierPath(ovalInRect: bounds).CGPath
        spinnerLayer.bounds = bounds
        spinnerLayer.position = CGPointMake(bounds.width / 2, bounds.height / 2)
    }
    
    override func tapped(tap: UITapGestureRecognizer) {
        if spinning {
            stopSpinner()
        } else {
            startSpinner()
        }
        spinning = !spinning
    }
    
    func startSpinner() {
        
        // show spinner layer
        spinnerLayer.hidden = false
        resetSpinner()
        
        // start spinner animations
        spinnerLayer.pop_addAnimation(spinnerStrokeEndAnimation(), forKey: "strokeEnd")
        spinnerLayer.pop_addAnimation(spinnerRotateAnimation(), forKey: "rotateAnimation")
        spinnerLayer.pop_addAnimation(spinnerColorAnimation(), forKey: "colorAnimation")
    }
    
    func stopSpinner() {
        
        spinnerLayer.hidden = true
        resetSpinner()
        
        // stop all animations
        spinnerLayer.removeAllAnimations()
        spinnerLayer.pop_removeAllAnimations()
    }
    
    private func resetSpinner() {
        spinnerLayer.strokeEnd = 0
        spinnerLayer.strokeStart = 0
    }
    
    private func spinnerStrokeStartAnimation() -> POPBasicAnimation {
        var anim = POPBasicAnimation(propertyNamed: kPOPShapeLayerStrokeStart)
        anim.name = "spinnerStrokeStart"
        anim.fromValue = 0.0
        anim.toValue = 1.0
        anim.duration = 0.8
        anim.delegate = self
        return anim
    }
    
    private func spinnerStrokeEndAnimation() -> POPBasicAnimation {
        var anim = POPBasicAnimation(propertyNamed: kPOPShapeLayerStrokeEnd)
        anim.name = "spinnerStrokeEnd"
        anim.fromValue = 0.0
        anim.toValue = 1.0
        anim.duration = 0.8
        anim.delegate = self
        return anim
    }
    
    private func spinnerRotateAnimation() -> POPBasicAnimation {
        var anim = POPBasicAnimation(propertyNamed: kPOPLayerRotation)
        anim.fromValue = 0
        anim.toValue = CGFloat(M_PI * 2)
        anim.repeatForever = true
        anim.duration = 1
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        return anim
    }
    
    private func spinnerColorAnimation() -> POPBasicAnimation {
        var anim = POPBasicAnimation(propertyNamed: kPOPShapeLayerStrokeColor)
        anim.fromValue = backgroundColor!.adjust(0.9, saturation: 0.5, brightness: 0.2, alpha: 0)
        anim.toValue = backgroundColor!.adjust(-0.5, saturation: 0.5, brightness: 0.1, alpha: 0)
        anim.repeatForever = true
        anim.autoreverses = true
        anim.duration = 1.6
        return anim
    }
    
    func pop_animationDidStop(anim: POPAnimation!, finished: Bool) {
        if finished {
            if anim.name == "spinnerStrokeEnd" {
                spinnerLayer.pop_addAnimation(spinnerStrokeStartAnimation(), forKey: "strokeStart")
            } else if anim.name == "spinnerStrokeStart" {
                spinnerLayer.strokeStart = -1 // a bit of a hack to get starting point working
                spinnerLayer.pop_addAnimation(spinnerStrokeEndAnimation(), forKey: "strokeEnd")
            }
        }
    }

}
