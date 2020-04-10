//
//  Nail.swift
//  NailGame
//
//  Created by Lucas Costa  on 12/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

class Nail {
    
    /// Sound
    let sound : SKAction
    
    /// Node
    let node : SKSpriteNode
    var velocity : Double = 1
    
    /// Node name
    static let name = "Nail"
        
    //MARK:- Initializer
    init(rect : CGRect) {
        self.node = SKSpriteNode(imageNamed: "Nail")
        self.node.position = rect.origin
        self.node.size = rect.size
        self.node.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.node.name = Nail.name
        self.node.zPosition = -1
        
        self.sound = SKAction.playSoundFileNamed("Sounds/NailSound.m4a", waitForCompletion: true)
        
        addPhysics()
    }
    
    /// Rotation in nail.
    func applyRotation() {
        
        let time = TimeInterval(velocity/10.0)
        let leftAngle : CGFloat = .pi/3
        let rightAngle : CGFloat = .pi/(-3)
        
        let leftRotation = SKAction.rotate(byAngle: leftAngle, duration: time)
        let rightRotation = SKAction.rotate(byAngle: rightAngle, duration: time)
        
        let sequence = SKAction.sequence([leftRotation, leftRotation.reversed(), rightRotation, rightRotation.reversed()])
        let action = SKAction.repeatForever(sequence)
            
        self.node.run(action, withKey: "rotation")
    }
    
    /// Move down when hit nail
    /// - Parameter completionHandler: completion
    func moveDown(completionHandler : () -> Void) {
        
        self.node.removeAction(forKey: "rotation")
        let move = SKAction.moveBy(x: 0, y: -self.node.frame.height * 0.8, duration: 0.8)
        let sequence = SKAction.group([sound, move])
        self.node.run(sequence)
        
        completionHandler()
    }
    
}

//MARK:- Private Methods
private extension Nail {
    
    /// Adding physics in nail.
    func addPhysics() {
        self.node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.node.frame.width * 0.3, height: 2), center: CGPoint(x: 0, y: self.node.frame.height))
        self.node.physicsBody?.categoryBitMask = NodeCategoryBitMask.nail.rawValue
        self.node.physicsBody?.contactTestBitMask = NodeCategoryBitMask.hammer.rawValue
        self.node.physicsBody?.collisionBitMask = 0
        self.node.physicsBody?.affectedByGravity = false
    }
    
}
