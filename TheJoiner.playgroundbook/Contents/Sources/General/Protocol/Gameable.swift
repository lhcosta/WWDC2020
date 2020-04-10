//
//  File.swift
//  WWDC
//
//  Created by Lucas Costa  on 28/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

protocol Gameable : SKScene {
    
    var gameDelegate : GameDelegate? { get set }
    
    /// Start actions in scene
    func startScene()
    
    /// Finish scene
    /// - Parameter result: result of game
    func finishScene(result : GameResult)
}
