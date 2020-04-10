//
//  PlayButton.swift
//  WWDC
//
//  Created by Lucas Costa  on 29/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit

class PlayButton: UIButton {
    
    var type : Activity!
    
    //MARK:- Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setBackgroundImage(UIImage(named: "PlayButton"), for: .normal)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: frame.size.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: frame.size.height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

      
    override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
        
        //Multiple touches in button
        self.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { 
            self.isUserInteractionEnabled = true
        }
    }
    
}
