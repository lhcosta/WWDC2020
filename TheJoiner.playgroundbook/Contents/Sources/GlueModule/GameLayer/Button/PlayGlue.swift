//
//  PlayGlue.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit

class PlayGlueButton: UIButton {
    
    //MARK:- Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: frame.size.width),
            self.heightAnchor.constraint(equalToConstant: frame.size.height)
        ])
            
        self.setBackgroundImage(UIImage(named: "PlayGlue"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
