//
//  TargetManager.swift
//  GlueGame
//
//  Created by Lucas Costa  on 22/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

class TargetManager {
    
    //MARK:- Properties
    private(set) var targetMaster : GlueTarget
    
    //MARK:- Constants
    private static let horizontalTargets = 4
    private static let verticalTargets = 2
    private let margin : CGFloat!
    
    //MARK:- Initializer
    init(size : CGSize, margin : CGFloat) {
        self.targetMaster = GlueTarget(size: size)
        self.margin = margin
    }
    
    func draw(in frame : CGRect, completion : ([TargetsOrientation : [GlueTarget]]) -> ()) {
        let horizontalNodes = drawTargetsInHorizontal(frame: frame)
        let verticalNodes = drawTargetsInVertical(frame: frame)
        
        completion([.horizontal : horizontalNodes, .vertical : verticalNodes])
    }
}

//MARK:- Draw targets 
private extension TargetManager {
    
    /// Draw all targerts in horizontal position using a stack node
    /// - Parameter frame: frame 
    /// - Returns: horizontal nodes
    func drawTargetsInHorizontal(frame : CGRect) -> [GlueTarget] {
        
        var nodes : [GlueTarget] = []
        let availableSpace = (frame.width * 0.95)/(TargetManager.horizontalTargets.asCGFloat() + 1)
        
        for i in 1...TargetManager.horizontalTargets {         
            
            let xPos = availableSpace * i.asCGFloat()
            
            let topNode = targetMaster.copy()
            topNode.node.position = CGPoint(x: xPos, y: margin)
            
            let bottomNode = targetMaster.copy()
            bottomNode.node.position = CGPoint(x: xPos, y: frame.height - bottomNode.node.frame.height - margin)
            
            nodes.append(contentsOf: [topNode, bottomNode])
        }
        
        return nodes
    }
    
    /// Draw all targerts in vertical position using a stack node
    /// - Parameter frame: frame 
    /// - Returns: stack node
    func drawTargetsInVertical(frame : CGRect) -> [GlueTarget] {
        
        var nodes : [GlueTarget] = []
        let availableSpace = (frame.height * 0.95)/(TargetManager.verticalTargets.asCGFloat() + 1)
        
        for i in 1...TargetManager.verticalTargets {
            
            let yPos = availableSpace * i.asCGFloat()
            
            let leftNode = targetMaster.copy()
            leftNode.node.position = CGPoint(x: margin, y: yPos)
            
            let rightNode = targetMaster.copy()
            rightNode.node.position = CGPoint(x: frame.width - margin - rightNode.node.frame.width, y: yPos)
            
            nodes.append(contentsOf: [leftNode, rightNode])
        }
        
        return nodes
    }
    
}
