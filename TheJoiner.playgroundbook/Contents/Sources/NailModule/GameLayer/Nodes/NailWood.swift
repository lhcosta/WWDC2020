//
//  Wood.swift
//  NailGame
//
//  Created by Lucas Costa  on 12/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit
import Combine

class NailWood {
    
    //MARK:- Observable Properties
    /// All nails in wood.
    @Published var nails : [Nail] = []
    
    //MARK:- Properties
    /// Node
    let node : SKSpriteNode
    
    private var stackNode : SKSpriteNode!
    
    /// Amount of nails.
    let numbersOfNails = 6
            
    private(set) var spaceBetweenNails : CGFloat!
    
    //MARK:- Initializer
    init(rect : CGRect) {
        self.node = SKSpriteNode(texture: SKTexture(imageNamed: "NailWood"))
        self.node.size = rect.size
        self.node.position = rect.origin
        self.node.anchorPoint = CGPoint(x: 0, y: 1)
    }
    
    //MARK:- Methods
    
    /// Adding all nails in wood.
    func addNailsInWood() {
        
        let size = CGSize(width: node.size.width * 0.05, height: node.size.height * 0.8)
        let availableSpace = (self.node.frame.width * 0.9) - (size.width * CGFloat(numbersOfNails))
        let space = availableSpace/(CGFloat(numbersOfNails - 1))
        self.spaceBetweenNails = space
        
        stackNode = SKSpriteNode(color: .clear, size: CGSize(width: space * CGFloat(numbersOfNails - 1), height: size.height))
        
        for i in 0..<numbersOfNails {
            let nail = Nail(rect: CGRect(origin: CGPoint(x: space * CGFloat(i), y: 0), size: size)) 
            nail.velocity += Double((numbersOfNails - i))
            self.nails.append(nail)
            stackNode.addChild(nail.node)
        }
        
        stackNode.position = CGPoint(x: (node.frame.width - stackNode.frame.width)/2, y: 0)
        self.node.addChild(stackNode) 
        
    }
    
    /// HIt nail and apply the movement.
    func hitNail() {
        self.nails.first?.moveDown { 
            self.nails.removeFirst()
            animateNailInTarget()
        }
    }
    
    /// Update nail in wood.
    func animateNailInTarget() {
        let nail = nails.first
        nail?.applyRotation()
    }
    
}

