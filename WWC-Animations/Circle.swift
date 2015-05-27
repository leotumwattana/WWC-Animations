//
//  Circle.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 27/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit

@IBDesignable class Circle: UIView {
    
    // ==================
    // MARK: - Properties
    // ==================
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = cornerRadius > 0
        }
    }
    
    var tap:UITapGestureRecognizer!
    var longPress:UILongPressGestureRecognizer!
    
    // ============
    // MARK: - Init
    // ============

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        tap = UITapGestureRecognizer(target: self, action: "tapped:")
        addGestureRecognizer(tap)
        
        longPress = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        addGestureRecognizer(longPress)
    }
    
    // ======================
    // MARK: - Event Handlers
    // ======================
    
    func tapped(tap:UITapGestureRecognizer) {
    }
    
    func longPressed(longPressed:UILongPressGestureRecognizer) {
    }

}
