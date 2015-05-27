//
//  LoaderCircle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit
import pop

class LoaderCircle: Circle {
    
    private var initialSize:CGSize!
    
    var loading = false {
        didSet {
            if loading {
                startLoading()
            } else {
                doneLoading()
            }
        }
    }
    
    var progressIndicator:CALayer!
    
    override func commonInit() {
        super.commonInit()
        initialSize = bounds.size
        
        progressIndicator = CALayer()
        progressIndicator.backgroundColor = UIColor(white: 1, alpha: 0.2).CGColor
        progressIndicator.frame = progressIndicatorInitialFrame()
        progressIndicator.hidden = true
        layer.addSublayer(progressIndicator)
    }

    override func tapped(tap: UITapGestureRecognizer) {
        loading = !loading
    }
    
    private func startLoading() {
        
        progressIndicator.hidden = false
        
        let expand = POPSpringAnimation(propertyNamed: kPOPViewSize)
        expand.toValue = NSValue(CGSize: CGSizeMake(200, 60))
        expand.completionBlock = { [unowned self] (anim, finished) in
            self.progressIndicator.frame = self.progressIndicatorFullFrame()
        }
        pop_addAnimation(expand, forKey: "size")
        
        let radius = POPSpringAnimation(propertyNamed: kPOPLayerCornerRadius)
        radius.toValue = 6
        layer.pop_addAnimation(radius, forKey: "cornerRadius")
    }
    
    private func doneLoading() {
        
        progressIndicator.hidden = true
        progressIndicator.frame = progressIndicatorInitialFrame()
        
        let expand = POPSpringAnimation(propertyNamed: kPOPViewSize)
        expand.toValue = NSValue(CGSize: initialSize)
        pop_addAnimation(expand, forKey: "size")
        
        let radius = POPSpringAnimation(propertyNamed: kPOPLayerCornerRadius)
        radius.toValue = cornerRadius
        layer.pop_addAnimation(radius, forKey: "cornerRadius")
    }
    
    private func progressIndicatorInitialFrame() -> CGRect {
        return bounds.rectByInsetting(dx: 5, dy: 5).with(width: 0)
    }
    
    private func progressIndicatorFullFrame() -> CGRect {
        return bounds.rectByInsetting(dx: 5, dy: 5)
    }

}
