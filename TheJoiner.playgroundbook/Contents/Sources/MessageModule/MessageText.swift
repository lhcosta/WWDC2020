//
//  MessageText.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit

class MessageText: UILabel {

    //MARK:- Properties
    private let customFont = UIFont(name: "SFProRounded-Regular", size: 45)

    //MARK:- Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = customFont
        self.textColor = UIColor(red: 0.69, green: 0.45, blue: 0.29, alpha: 1)
        self.textAlignment = .left
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
