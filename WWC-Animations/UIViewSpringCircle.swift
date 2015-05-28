//
//  UIViewSpringCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit

class UIViewSpringCircle: Circle {

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
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .CurveEaseInOut,
            animations: { [unowned self] in
                self.transform = CGAffineTransformMakeTranslation(x, 0)
            },
            completion: nil)
    }
    
}
