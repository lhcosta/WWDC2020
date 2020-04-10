//
//  NailCoordinator.swift
//  WWDC
//
//  Created by Lucas Costa  on 25/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

struct NailCoordinator : CoordinatorScene {
   
    //Dependency Injection
    static func build(size : CGSize) -> Gameable {
        let scene = NailGameScene(size: size)        
        let background = Background.build(in: scene.frame)
        scene.addChild(background)
        
        return scene
    }
    
}

