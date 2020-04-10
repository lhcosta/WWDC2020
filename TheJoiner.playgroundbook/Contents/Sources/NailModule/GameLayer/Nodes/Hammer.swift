//
//  Hammer.swift
//  NailGame
//
//  Created by Lucas Costa  on 12/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

protocol HammerProtocol {
    
    /// Node
    var node : SKSpriteNode { get }
    
    /// Rotate to hit the target
    func rotate()
    
     /// Change hammer position only in x.
    /// - Parameter xPos: amount
    func changePosition(xPos : CGFloat)
    
}


struct Hammer : HammerProtocol {
    
    /// Node
    let node : SKSpriteNode
    
    private var texture : SKTexture!
    static let name = "Hammer"
    
    //MARK:- Initializer
    
    init(rect : CGRect) {
        
        self.texture = SKTexture(imageNamed: "Hammer")
        self.node = SKSpriteNode(texture: texture)
        self.node.size = rect.size
        self.node.position = rect.origin
        self.node.name = Hammer.name
        
        addPhysics()     
        
        self.node.zRotation = .pi/3
    }
    
    //MARK:- Methods

    func rotate() {
        
        let angle : CGFloat = .pi/(-2.8)
        
        let rotation = SKAction.rotate(byAngle: angle, duration: 0.2)
        
        let sequence = SKAction.sequence([rotation, rotation.reversed()]) 
        
        node.run(sequence)
    }    
    
    /// Change hammer position only in x.
    /// - Parameter xPos: amount
    func changePosition(xPos : CGFloat) {
        
        let move = SKAction.moveBy(x: xPos, y: 0, duration: 0.8)
        
        self.node.run(move)
    }
    
}

//MARK:- Private methods
private extension Hammer {
    
    func addPhysics() {
        self.node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.node.size.width * 0.25, height: self.node.size.height), center: CGPoint(x: node.size.height - 20, y: 0))
        
        self.node.physicsBody?.categoryBitMask = NodeCategoryBitMask.hammer.rawValue
        self.node.physicsBody?.contactTestBitMask = NodeCategoryBitMask.nail.rawValue
        self.node.physicsBody?.affectedByGravity = false
    }
    
}
