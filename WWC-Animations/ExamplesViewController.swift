//
//  ViewController.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 27/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import UIKit

class ExamplesViewController: UIViewController, BeeCircleDelegate {
    
    // ==================
    // MARK: - Properties
    // ==================
    
    var tap:UITapGestureRecognizer!
    
    // ================
    // MARK: - Subviews
    // ================
    
    @IBOutlet weak var beeCircle:BeeCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap = UITapGestureRecognizer(target: self, action: "tapped:")
        tap.enabled = false
        view.addGestureRecognizer(tap)
        
        beeCircle.delegate = self
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // ======================
    // MARK: - Event Handlers
    // ======================
    
    func tapped(tap:UITapGestureRecognizer) {
        let location = tap.locationInView(view)
        beeCircle.moveToPoint(location)
        beeCircle.scale(to: nil)
    }

    // =========================
    // MARK: - BeeCircleDelegate
    // =========================
    
    func beeCircleChangedActivation(bee: BeeCircle) {
        tap.enabled = bee.activated
    }

}

