//
//  Saw.swift
//  CutGame
//
//  Created by Lucas Costa  on 16/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

struct Saw {
    
    //MARK:- Properties
    private(set) var node : SKSpriteNode!
    private var saw : SKTexture!
    let sound : SKAction!
    
    //MARK:- Initializer
    init(rect : CGRect) {
        self.saw = SKTexture(imageNamed: "Saw")
        sound = SKAction.playSoundFileNamed("Sounds/CutSound.m4a", waitForCompletion: true)

        createSaw(rect: rect)
        addPhysics()        
    }
    
    /// Initial node movement
    func startCut(point : CGPoint) {
        let movement = SKAction.moveBy(x: point.x, y: point.y, duration: 0.2)
        self.node.run(movement)
    }
    
    
}

//MARK:- Private Methods
private extension Saw {
    
    func addPhysics() {
        self.node.physicsBody = SKPhysicsBody(texture: saw, size: self.node.size)
        self.node.physicsBody?.categoryBitMask = CutCategoryBitMask.saw.rawValue
        self.node.physicsBody?.usesPreciseCollisionDetection = true
        self.node.physicsBody?.isDynamic = true
    }
    
    mutating func createSaw(rect : CGRect) {
        self.node = SKSpriteNode(texture: saw)
        self.node.position = rect.origin
        self.node.size = rect.size
        
        let rotate = SKAction.rotate(byAngle: .pi, duration: 0.3)
        let action = SKAction.repeatForever(rotate)
        self.node.run(action)
    }
}
