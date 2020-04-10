//
//  MessageButton.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit

class MessageButton: UIButton {
    
    //MARK:- Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "MessageButton"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
