//
//  DashedLine.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit


struct DashedLine {
    
    /// Points to draw line.
    private var points : [CGPoint] = [] 
    private(set) var shapeNode : SKShapeNode!
    
    
    //MARK:- Initiliazer
    init(from : CGPoint, to: CGPoint) {
        self.points = [from, to]
    }
    
    /// Create the line
    /// - Returns: shape representing the line
    mutating func create() -> SKShapeNode {
        
        let bezierPath = UIBezierPath()
        let initialPoint = CGPoint(x: self.points[0].x, y: self.points[0].y)
        let finalPoint = CGPoint(x: self.points[1].x, y: self.points[1].y)
        
        bezierPath.move(to: initialPoint)
        bezierPath.addLine(to: finalPoint)
        
        let pattern : [CGFloat] = [20.0, 20.0]
        let path = bezierPath.cgPath.copy(dashingWithPhase: 1, lengths: pattern)
        
        shapeNode = SKShapeNode(path: path)
        shapeNode.position = .zero
        shapeNode.strokeColor = .white
        shapeNode.lineWidth = 5
        shapeNode.zPosition = 5
        
        return shapeNode
    }
    
}
