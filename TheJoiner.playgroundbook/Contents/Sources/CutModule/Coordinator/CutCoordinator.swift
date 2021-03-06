//
//  CutCoordinator.swift
//  WWDC
//
//  Created by Lucas Costa  on 25/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

struct CutCoordinator : CoordinatorScene {
    
    static func build(size: CGSize) -> Gameable {
        
        let scene = CutGameScene(size: size)
        scene.addChild(Background.build(in: scene.frame))
        
        return scene
    }
    
}
