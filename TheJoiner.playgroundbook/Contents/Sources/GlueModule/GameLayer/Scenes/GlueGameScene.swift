//
//  GlueGameScene.swift
//  GlueGame
//
//  Created by Lucas Costa  on 22/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit
import SpriteKit
import Combine

class GlueGameScene: SKScene {
    
    //MARK:- Properties
    private var glueWood : GlueWood!
    private var timeBar : TimeBar!
    private var cancellable : AnyCancellable?
    
    //MARK:- Delegate
    weak var gameDelegate: GameDelegate?

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        addPointsBar()
        addWood()  
        glueWood.drawTargets()
        addPlayGlueButton(in: view)
        
    }
        
}

//MARK:- Private extensions
private extension GlueGameScene {
    
    /// Adding wood in scene
    func addWood() {
        let size = CGSize(width: self.frame.width * 0.8, height: self.frame.height * 0.5)
        let point = CGPoint(x: (self.frame.width - size.width)/2, y: (self.frame.height - size.height)/2)
        
        self.glueWood = GlueWood(rect: CGRect(origin: point, size: size))
        self.addChild(glueWood.node)
    }
    
    /// Adding points bar in scene.
    func addPointsBar() {
        self.timeBar = TimeBar(in: self.frame)
        self.timeBar.delegate = self
        self.addChild(timeBar.icon)
    }
    
    func addPlayGlueButton(in view : SKView) {
        let button = PlayButton(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width * 0.1, height: view.frame.width * 0.1)))
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
}

//MARK:- Actions
private extension GlueGameScene {
    
    @objc func tapButton() {
        self.glueWood.tryHitTarget()
    }
}

extension GlueGameScene : Gameable {
    
    func startScene() {
        
        self.timeBar.startCount()
        
        self.cancellable = self.glueWood.$targets.sink(receiveValue: { [weak self] (targets) in
            guard let self = self else { return }
            
            if targets.count == 0 {
                self.finishScene(result: .win)
            }
        })
    }
    
    func finishScene(result: GameResult) {
        
        self.timeBar.stopCount()
        self.glueWood.stopGlue()
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
            if result == .win {
                self.gameDelegate?.finishGame(result: result, type: .glue)
            } else {
                self.gameDelegate?.finishGame(result: result, type: nil)
            }
        }
        
    }
    
}

//MARK:- Delegates 
extension GlueGameScene : TimeBarDelegate {
    func didZeroBar() {
        finishScene(result: .loss)
    }
} 
