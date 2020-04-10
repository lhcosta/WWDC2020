//
//  ActivityViewController.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit
import SpriteKit

class ActivityViewController: UIViewController {
    
    //MARK:- Outlets
    var skview : SKView!
    private var btnHome : UIButton!
    private var scene : Gameable!
    
    //MARK:- Properties
    var coordinator : Coordinator?
    var activity : Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = skview
        self.presentScene(activity: activity)
        createHomeButton()
    }
    
    private func presentScene(activity : Activity) {
                
        switch activity {
            case .cut:
                scene = CutCoordinator.build(size: skview.frame.size)
            case .glue:
                scene = GlueCoordinator.build(size: skview.frame.size)
            case .nail:
                scene = NailCoordinator.build(size: skview.frame.size)
        }
        
        scene.gameDelegate = self
        self.skview.presentScene(scene)
        
        createBlurView()
    }
    
}

//MARK:- Outlets
extension ActivityViewController {
    
    func createHomeButton() {
        
        btnHome = UIButton()
        btnHome.translatesAutoresizingMaskIntoConstraints = false
        btnHome.setBackgroundImage(UIImage(named: "HomeButton"), for: .normal)
        
        self.skview.addSubview(btnHome)
        
        NSLayoutConstraint.activate([
            btnHome.rightAnchor.constraint(equalTo: skview.rightAnchor, constant: -20),
            btnHome.topAnchor.constraint(equalTo: skview.topAnchor, constant: 70),
            btnHome.widthAnchor.constraint(equalTo: self.skview.widthAnchor, multiplier : 0.06),
            btnHome.heightAnchor.constraint(equalTo: self.skview.widthAnchor, multiplier : 0.06)
        ])
        
        btnHome.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
}

//MARK:- Private Methods
extension ActivityViewController {
    
    @objc func dismissView() {
        self.coordinator?.dismiss()
    }
    
    func createBlurView() {
        
        let timerBlurView = TimerBlurView()
        timerBlurView.delegate = self
        
        let view = timerBlurView.create(rect: skview.frame)        
        self.skview.addSubview(view)
        timerBlurView.startTime()
    }
    
}

//MARK:- Delegates 
extension ActivityViewController : TimerBlurViewDelegate {
    
    func didFinishTimer() {
        scene.startScene()
    }
}

extension ActivityViewController : GameDelegate {
    
    func finishGame(result: GameResult, type: Activity?) {
        self.coordinator?.finishScene(type: type, result: result)
    }
    
}
