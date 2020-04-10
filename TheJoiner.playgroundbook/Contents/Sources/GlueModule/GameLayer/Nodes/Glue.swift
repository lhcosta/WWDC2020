//
//  Glue.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit


struct Glue {
    
    //MARK:- Properties
    private(set) var node : SKSpriteNode
    
    //MARK:- Initializer
    /// Create node seting frame
    /// - Parameter frame: frame
    init(frame : CGRect) {
        self.node = SKSpriteNode(imageNamed: "Glue")
        self.node.size = frame.size
        self.node.position = frame.origin
        self.node.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.node.zPosition = 2
        self.node.zRotation = (.pi * 3)/2        
    }
    
    var currentPosition : CGPoint {
        return self.node.position
    }
    
    /// Move 
    func move(in points : [CGPoint]) {
        
        let minDuration : TimeInterval = 3
        let maxDuration : TimeInterval = 3.5
        var actions : [SKAction] = []
        
        points.forEach {
            let duration = TimeInterval.random(in: minDuration...maxDuration)
            actions.append(SKAction.move(to: $0, duration: duration))
            actions.append(SKAction.rotate(byAngle: -.pi/2, duration: 0.2))
        }
        
        let action = SKAction.repeatForever(SKAction.sequence(actions))
        self.node.run(action)
    }
    
    /// Stop all actions
    func stopActions() {
        self.node.removeAllActions()
    }        
}

