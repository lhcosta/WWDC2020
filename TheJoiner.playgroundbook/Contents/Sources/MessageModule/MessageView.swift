//
//  MessageView.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit

class MessageView: UIView {

    //MARK:- Outlets
    var button : MessageButton!
    var titleLabel : MessageTitle!
    var textLabel : MessageText!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.widthAnchor.constraint(equalToConstant: frame.size.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: frame.size.height).isActive = true
        
        addBackground(frame: frame)
        addOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- Private Methods
private extension MessageView {
    
    func addOutlets() {
        
        self.button = MessageButton()
        self.titleLabel = MessageTitle()
        self.textLabel = MessageText()
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel, button])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -60),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ])
        
    } 
    
    func addBackground(frame : CGRect) {
        
        let background = UIImageView(frame: frame)
        background.translatesAutoresizingMaskIntoConstraints = false
        
        background.image = UIImage(named: "MessageView")
    
        self.addSubview(background)
        
        NSLayoutConstraint.activate([
            background.leftAnchor.constraint(equalTo: self.leftAnchor),
            background.rightAnchor.constraint(equalTo: self.rightAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }

    
    
    
}
