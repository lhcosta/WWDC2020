//
//  GlueTarget.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

class GlueTarget : Copying {
    
    /// Node
    private(set) var node : SKSpriteNode!
        
    /// Textures
    private var textures : [SKTexture] = []
    
    private var sound : SKAction!
    
    //MARK:- Initializer
    public init(size : CGSize) {
        self.loadTextures()
        self.node = SKSpriteNode(texture: self.textures[0])
        self.node.size = size
        self.node.anchorPoint = .zero
        self.sound = SKAction.playSoundFileNamed("Sounds/GlueSound.m4a", waitForCompletion: true)
    }
    
    required convenience init(_ prototype: GlueTarget) {
        self.init(size : prototype.node.size)
    }
    
    //MARK:- Methods
    func hitTarget() {
        self.animate()
    }
}

//MARK:- Private methods
private extension GlueTarget {
    
    /// Animate node
    func animate() {
        let addGlueAnimation = SKAction.animate(with: self.textures, timePerFrame: 0.1)
        let group = SKAction.group([sound, addGlueAnimation])
        self.node.run(group)
    }
    
    /// Loading all textures
    func loadTextures() {
        for i in 1...5 {
            self.textures.append(SKTexture(imageNamed: "GlueTarget_\(i)"))
        }
    }
    
    
}
