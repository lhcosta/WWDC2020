//
//  Wood.swift
//  CutGame
//
//  Created by Lucas Costa  on 16/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

class Wood {
    
    //MARK:- Properties
    
    /// Representing the wood node in scene
    let node : SKSpriteNode!
    private(set) var saw : Saw!
    private(set) var dashedLine : DashedLine!

    //MARK:- Initializer
    init(rect : CGRect) {
        self.node = SKSpriteNode(color: .clear, size: rect.size)
        self.node.position = rect.origin
        self.node.zPosition = 1
        self.node.anchorPoint = .zero
        self.node.zPosition = 1
        
        self.drawNodes()
        addDashedLine()
        addSaw()
        drawPlayableRect()

    }
    
    /// Adding saw in wood node.
    private func addSaw() {
        
        let size = CGSize(width: self.node.size.width * 0.12, height: self.node.size.width * 0.12)
        let point = CGPoint(x: 10, y: self.node.size.height/2)
        
        self.saw = Saw(rect: CGRect(origin: point, size: size))
        self.saw.node.zPosition = 3
        self.node.addChild(saw.node)
    }
    
}

//MARK:- Private methods
extension Wood {
    
    func drawNodes() {
        let topNode = SKSpriteNode(imageNamed: "CutWoodTop")
        topNode.size = CGSize(width: node.size.width, height: node.size.height * 0.5)
        topNode.zPosition = 2
        topNode.anchorPoint = .zero
        topNode.position = CGPoint(x: 0, y: node.frame.height/2)
        
        let bottomNode = SKSpriteNode(imageNamed: "CutWoodBottom")
        bottomNode.size = topNode.size
        bottomNode.zPosition = 4
        bottomNode.anchorPoint = .zero
        bottomNode.position = CGPoint(x: 0, y: 0)
        
        self.node.addChild(topNode)
        self.node.addChild(bottomNode)
    }
        
    /// Drawing a playable rect.
    func drawPlayableRect() {
        
        let margin : CGFloat = 30
        
        let size = CGSize(width: node.size.width + margin + self.saw.node.size.width, height: self.node.size.height * 0.7)
        
        let area = SKSpriteNode()
        
        area.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -margin, y: (self.node.size.height - size.height)/2, width: size.width, height: size.height))
        
        area.physicsBody?.collisionBitMask = CutCategoryBitMask.saw.rawValue
        
        self.node.addChild(area)
    }
    
    /// Adding dashed line in wood.
    func addDashedLine() {
        self.dashedLine = DashedLine(from: CGPoint(x: 0, y: self.node.size.height/2), to: CGPoint(x: self.node.size.width, y: self.node.size.height/2))
        self.node.addChild(dashedLine.create())
    }
    
}
