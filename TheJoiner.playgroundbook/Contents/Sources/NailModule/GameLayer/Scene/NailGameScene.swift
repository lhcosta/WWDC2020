//
//  GameScene.swift
//  NailGame
//
//  Created by Lucas Costa  on 12/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit
import SpriteKit
import Combine

class NailGameScene: SKScene {
    
    //MARK:- Properties
    private var wood : NailWood!
    private var hammer : HammerProtocol!
    private var timeBar : TimeBar!
    private var cancellable : AnyCancellable?
    
    //MARK:- Delegate
    weak var gameDelegate: GameDelegate?
    
    //MARK:- Methods
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        addButton(in: view)
        addWood()
        addHammer() 
        addPointsBar()
        
        view.ignoresSiblingOrder = true
        self.physicsWorld.contactDelegate = self
    }
    
}

//MARK:- Private Methods
private extension NailGameScene {
    
    /// Adding wood in scene.
    func addWood() {
        
        let size = CGSize(width: self.size.width * 0.8, height: self.size.height * 0.15)
        let rect = CGRect(origin: CGPoint(x: (self.frame.width - size.width)/2, y: self.frame.midY - size.height), size: size)
        
        self.wood = NailWood(rect: rect)
        
        self.wood.addNailsInWood()
        
        self.addChild(self.wood.node)
    }
    
    /// Adding hammer in scene.
    func addHammer() {
        
        let size = CGSize(width: self.size.height * 0.3, height: self.size.width * 0.09)
        let nailSize = self.wood.nails.first!.node.frame.size
        let rect = CGRect(origin: CGPoint(x: self.wood.node.frame.minX + nailSize.width + 30, y: self.wood.node.frame.maxY + (nailSize.height * 1.5)), size: size)
        
        self.hammer = Hammer(rect: rect)
        self.addChild(self.hammer.node)
    }
    
    /// Adding button to play.
    /// - Parameter view: view to add button.
    func addButton(in view : SKView) {
        
        let button = PlayButton(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width * 0.1, height: view.frame.width * 0.1)))
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        button.addTarget(self, action: #selector(rotateHammer), for: .touchUpInside)
    }
    
    /// Adding points bar
    func addPointsBar() {
        self.timeBar = TimeBar(in: self.frame)
        self.timeBar.delegate = self
        self.addChild(timeBar.icon)
    }
    
}

//MARK:- Actions
extension NailGameScene {
    
    @objc func rotateHammer() {
        self.hammer.rotate()
    }
    
    /// Call hit nail.
    func hitNail() {
        self.wood.hitNail()
    }
}

//MARK:- Gameable 
extension NailGameScene : Gameable {
    
    /// All methods to start scene
    func startScene() {
        
        self.timeBar.startCount()
        self.wood.animateNailInTarget()
        
        self.cancellable = wood.$nails.sink(receiveValue: { [weak self] (nails) in
            
            guard let self = self else { return }
            
            if nails.count == 0 {
                self.finishScene(result: .win)
            } else if nails.count < self.wood.numbersOfNails {
                self.hammer.changePosition(xPos: self.wood.spaceBetweenNails)
            }
        })
    }  
    
    func finishScene(result: GameResult) {
        
        self.timeBar.stopCount()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
            if result == .win {
                self.gameDelegate?.finishGame(result: result, type: .nail)
            } else {
                self.gameDelegate?.finishGame(result: result, type: nil)
            }
        }
    }
}

//MARK:- Delegates 
extension NailGameScene : TimeBarDelegate {
    
    func didZeroBar() {
        self.finishScene(result: .loss)
    }
    
}
