//
//  CoordinatorScene.swift
//  WWDC
//
//  Created by Lucas Costa  on 25/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

protocol CoordinatorScene {
    /// Create scene
    /// - Parameter size: frame size
    static func build(size : CGSize) -> Gameable
}
