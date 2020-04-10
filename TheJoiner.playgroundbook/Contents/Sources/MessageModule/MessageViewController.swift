//
//  MessageViewController.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    private var messageView : MessageView!
    var coordinator : Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.preferredContentSize = CGSize(width: 1024, height: 768)
        
        LoadFonts.loading()
    }
    
    func createMessageView(activity : Activity?, result : GameResult) {
        
        addMessageView()
        
        if let activity = activity {
            self.messageView.textLabel.text = MessageType.getText(about: activity)
        } else {
            self.messageView.textLabel.text = LossMessage.text
        }
        
        self.messageView.titleLabel.text = result == GameResult.win ? "Parabéns!" : "Que pena!" 
        self.messageView.button.addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
    } 
    
}

//MARK:- Private Methods 
private extension MessageViewController {
    
    func addMessageView() {
        
        self.messageView = MessageView(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width * 0.6, height: self.view.frame.height * 0.9)))
        self.messageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(messageView)
        
        NSLayoutConstraint.activate([
            self.messageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.messageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func goToMenu() {
        self.coordinator?.presentHome()
    }
    
}

