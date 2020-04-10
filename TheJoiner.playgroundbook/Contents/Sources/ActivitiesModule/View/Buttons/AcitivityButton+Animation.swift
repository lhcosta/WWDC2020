//
//  AcitivityButton+Animation.swift
//  WWDC
//
//  Created by Lucas Costa  on 03/04/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Animation
extension ActivityButton {
    
    /// Create animation in button
    func runAnimation() {
        
        self.transform = CGAffineTransform.identity
        
        UIView.animate(withDuration: 2, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse], animations: { 
            self.transform = CGAffineTransform(rotationAngle: .pi/3)
        }, completion: nil)
    }
    
    func removeAnimation() {
        self.layer.removeAllAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: { 
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: nil)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        self.transform = .identity
    }
}
