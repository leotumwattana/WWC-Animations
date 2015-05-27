//
//  Helpers.swift
//  WWC-Animations
//
//  Created by Leo Tumwattana on 28/5/15.
//  Copyright (c) 2015 Innovoso Ltd. All rights reserved.
//

import Foundation

func randomInt(#max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
}