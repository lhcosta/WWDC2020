//
//  ControlGame.swift
//  CutGame
//
//  Created by Lucas Costa  on 16/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit
import CoreMotion

protocol ControlGameDelegate : AnyObject {
    /// Moving node.
    /// - Parameter deslocation: movement y position
    func move(deslocation : CGFloat)
}

class ControlGame {
    
    //MARK:- Properties
    weak var delegate : ControlGameDelegate?
    private var timer : Timer?
    private var motion : CMMotionManager!
    
    //MARK:- Constants
    private let multiplier : CGFloat = 10
    
    //MARK:- Initializer
    init() {
        self.motion = CMMotionManager()
    }
    
    /// Start Gyroscope
    func startGyroscope() {
        
        if motion.isGyroAvailable {
            
            self.motion.gyroUpdateInterval = 1/30
            self.motion.startGyroUpdates()
            
            self.timer = Timer(fire: Date(), interval: 1/30, repeats: true, block: { [weak self] (timer) in
                
                guard let self = self else { return }
                
                if let data = self.motion.gyroData {
                    let y = CGFloat(data.rotationRate.y)
                    self.delegate?.move(deslocation: CGFloat(y * self.multiplier))
                }
                
                
            })
            
            RunLoop.current.add(self.timer!, forMode: .default)
        }
    }
    
    /// Stop Gyroscope
    func stopGyroscope() {
        
        if self.timer != nil {
            
            self.timer?.invalidate()
            self.timer = nil
            
            self.motion.stopGyroUpdates()
        }
    }
    
    
}
