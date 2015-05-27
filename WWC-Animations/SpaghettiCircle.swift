//
//  SpaghettiCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class SpaghettiCircle: Circle {

    var squeezed = false
    var spaghettiLayer:CAShapeLayer!
    var points:[CGPoint] = []
    
    override func commonInit() {
        super.commonInit()
        
        spaghettiLayer = CAShapeLayer()
        spaghettiLayer.fillColor = UIColor.clearColor().CGColor
        spaghettiLayer.lineWidth = 3
        spaghettiLayer.lineJoin = kCALineJoinRound
        spaghettiLayer.strokeColor = backgroundColor?.CGColor
        spaghettiLayer.strokeEnd = 0
        spaghettiLayer.lineCap = kCALineCapRound
    }
    
    override func tapped(tap: UITapGestureRecognizer) {
        if squeezed {
            reset()
        } else {
            squeeze()
        }
        squeezed = !squeezed
    }
    
    private func squeeze() {
        for i in 1...60 {
            points.append(randomPoint())
        }
        
        let path = UIBezierPath()
        path.moveToPoint(frame.center)
        
        for point in points {
            path.addLineToPoint(point)
        }
        
        spaghettiLayer.path = path.CGPath
        superview?.layer.addSublayer(spaghettiLayer)
        
        let strokeEnd = POPBasicAnimation(propertyNamed: kPOPShapeLayerStrokeEnd)
        strokeEnd.toValue = 1
        strokeEnd.duration = 0.5
        strokeEnd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        spaghettiLayer.pop_addAnimation(strokeEnd, forKey: "strokeEnd")
        
        let size = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
        size.toValue = NSValue(CGSize: CGSizeMake(0.4, 0.4))
        size.duration = 0.5
        size.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        pop_addAnimation(size, forKey: "size")
    }
    
    private func reset() {
        let strokeEnd = POPBasicAnimation(propertyNamed: kPOPShapeLayerStrokeEnd)
        strokeEnd.toValue = 0
        strokeEnd.duration = 0.5
        strokeEnd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        spaghettiLayer.pop_addAnimation(strokeEnd, forKey: "strokeEnd")
        
        let size = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
        size.toValue = NSValue(CGSize: CGSizeMake(1, 1))
        size.duration = 0.5
        size.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        pop_addAnimation(size, forKey: "size")
        
        points = []
    }
    
    private func randomPoint() -> CGPoint {
        let diameter = 100
        let x = CGFloat(randomInt(max: diameter) - diameter / 2)
        let y = CGFloat(randomInt(max: diameter) - diameter / 2)
        return CGPointMake(frame.center.x + x, frame.center.y + y)
    }

}
