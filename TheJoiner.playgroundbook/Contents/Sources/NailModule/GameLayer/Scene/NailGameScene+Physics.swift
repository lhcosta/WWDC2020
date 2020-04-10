//
//  NailGameScene+Physics.swift
//  NailGame
//
//  Created by Lucas Costa  on 20/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

extension NailGameScene : SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == Nail.name && contact.bodyB.node?.name == Hammer.name {
            self.hitNail()
        }
    }
}
