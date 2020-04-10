//
//  GlueWood.swift
//  GlueGame
//
//  Created by Lucas Costa  on 22/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import Combine

class GlueWood {
    
    //MARK:- Properties
    private(set) var node: SKSpriteNode
    private var targetManager : TargetManager!
    @Published var targets : [GlueTarget] = []
    private var glue : Glue!
    
    //MARK:- Constants
    private let margin : CGFloat = 20
    private let sizeTarget : CGSize
    
    //MARK:- Initializer
    init(rect: CGRect) {
        
        self.node = SKSpriteNode(imageNamed: "Wood")
        self.node.position = rect.origin
        self.node.size = rect.size
        self.node.anchorPoint = .zero
        self.node.zPosition = -1
        self.sizeTarget =  CGSize(width: self.node.frame.width * 0.045, height: self.node.frame.width * 0.045)
        self.targetManager = TargetManager(size: sizeTarget, margin: margin)
        
        addGlue()
    }       
    
    //MARK:- Methods
    func drawTargets() {
        self.targetManager.draw(in: self.node.frame) { (targets) in
            targets.forEach {
                self.addStackTargets(stack: $0.value, orientation: $0.key)
            }
        }
    }
    
    /// Try to hit target.
    /// - Parameter gluePoint: position
    func tryHitTarget() {
        
        for i in 0..<self.targets.count {
            if targets[i].node.frame.contains(self.glue.currentPosition) {
                self.targets[i].hitTarget()
                self.targets.remove(at: i)
                break
            }
        }
    }
    
    /// Stop glue
    func stopGlue() {
        self.glue.node.removeAllActions()
    }
    
}

//MARK:- Add targets
private extension GlueWood {
    
    /// Adding stack in wood according the defined position.
    /// - Parameters:
    ///   - stack: stack targets
    ///   - orientation: stack orientation
    func addStackTargets(stack : [GlueTarget], orientation : TargetsOrientation) {
        stack.forEach {
            self.node.addChild($0.node)
            self.targets.append($0)
        }
    }
    
    func addGlue() {
        
        let size = CGSize(width: self.node.size.width * 0.08, height: self.node.size.height * 0.4)
        let initialPoint = CGPoint(x: sizeTarget.width * 0.5 + margin, y: sizeTarget.height * 0.5 + margin)
        self.glue = Glue(frame: CGRect(origin: initialPoint, size: size))
       
        let points : [CGPoint] = [
             CGPoint(x: size.width * 0.5 + margin, y: node.frame.size.height - (sizeTarget.height * 0.5) - margin), 
             CGPoint(x: node.frame.width - (size.width * 0.5), y: node.frame.size.height - (sizeTarget.height * 0.5) - margin),
             CGPoint(x: node.frame.width - (size.width * 0.5), y: sizeTarget.height * 0.5 + margin),
            initialPoint]
        
        self.glue.move(in: points)
        self.node.addChild(glue.node)
    }
    
}

