//
//  Background.swift
//  NailGame
//
//  Created by Lucas Costa  on 24/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

struct Background {
    
    //MARK:- Properties
    private static var node : SKSpriteNode!
    
    //MARK:- Methods
    
    /// Create background to all scenes.
    /// - Parameter rect: size and position.
    /// - Returns: node representing the background.
    static func build(in rect : CGRect) -> SKSpriteNode {
        
        let texture = SKTexture(imageNamed: "Background")
        self.node = SKSpriteNode(texture: texture)
        self.node.size = rect.size
        self.node.position = rect.origin
        self.node.anchorPoint = .zero
        self.node.zPosition = -2
        
        return node
    }
    
}
