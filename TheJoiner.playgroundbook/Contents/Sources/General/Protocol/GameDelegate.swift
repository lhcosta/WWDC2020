//
//  GameDelegate.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation

protocol GameDelegate : AnyObject {
    /// Finish when user win or time stop
    /// - Parameters:
    ///   - result: win or loss.
    ///   - type: activity type.
    func finishGame(result : GameResult, type : Activity?)
}
