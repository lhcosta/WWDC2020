//
//  CreateScene.swift
//  WWDC
//
//  Created by Lucas Costa  on 25/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit 

struct CreateScene {
    
    private let size : CGSize
    
    /// Initializer using the scene size
    /// - Parameter size: scene size
    init(size : CGSize)  {
        self.size = size
    }
    
    /// Create scene according the type
    /// - Parameter type: scene type
    /// - Returns: scene.
    func build(type : Activity) -> SKScene {
        
        var scene : SKScene!
        
        switch type {
            case .nail:
                scene = NailCoordinator.build(size: size)
            case .cut:
                scene = CutCoordinator.build(size: size)
            case .glue:
                scene = GlueCoordinator.build(size: size)
        }
        
        return scene
    }

}
