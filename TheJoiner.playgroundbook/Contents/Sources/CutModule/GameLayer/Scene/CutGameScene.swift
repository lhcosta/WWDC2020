//
//  CutGameScene.swift
//  CutGame
//
//  Created by Lucas Costa  on 16/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit
import SpriteKit

public class CutGameScene: SKScene {
    
    //MARK:- Properties
    private var wood : Wood!
    private var control : ControlGame!  
    private var timeBar : TimeBar!
    private var controlGame : ControlGame!
    
    //MARK:- Delegate
    weak var gameDelegate: GameDelegate?
    
    //MARK:- Initializer
    override init(size: CGSize) {
        super.init(size: size)
        
        self.controlGame = ControlGame()
        self.controlGame.delegate = self        
    }
    
    //MARK:- Scene lifecycle
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        
        view.ignoresSiblingOrder = true
        
        addWood()
        addPointsBar() 
        self.physicsWorld.gravity = .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- Add Components
private extension CutGameScene {
    
    /// Adding wood in scene.
    func addWood() {
        let size = CGSize(width: self.frame.width * 0.8, height: self.frame.height * 0.5)
        self.wood = Wood(rect: CGRect(x: (self.frame.width - size.width)/2, y: (self.frame.height - size.height)/2, width: size.width, height: size.height))
        
        self.addChild(wood.node)
    }
    
    /// Adding points bar.
    func addPointsBar() {
        self.timeBar = TimeBar(in: self.frame)
        timeBar.delegate = self
        self.addChild(timeBar.icon)
    }
    
}

//MARK:- Extensions
extension CutGameScene : Gameable {
    
    func startScene() {
        self.timeBar.startCount()
        self.controlGame.startGyroscope()
    }
    
    func finishScene(result: GameResult) {
        
        self.controlGame.stopGyroscope()
        self.timeBar.stopCount()
        self.wood.saw.node.removeAllActions()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
            if result == .win {
                self.gameDelegate?.finishGame(result: result, type: .cut)
            } else {
                self.gameDelegate?.finishGame(result: result, type: nil)
            }
        }
    }
}

//MARK:- Delegates
extension CutGameScene : ControlGameDelegate {
    
    func move(deslocation: CGFloat) {
        
        let yPos = deslocation + 0.5
        
        if wood.saw.node.position.x > wood.node.size.width {
            self.finishScene(result: .win)
        } else {
            if wood.dashedLine.shapeNode.frame.contains(wood.saw.node.position) {
                let move = SKAction.moveBy(x: 1, y: yPos, duration: 0.2)
                let group = SKAction.group([wood.saw.sound, move])
                self.wood.saw.node.run(group)
            } else {
                let move = SKAction.moveBy(x: 0, y: yPos, duration: 0.2)
                self.wood.saw.node.run(move)
            }  
        }
    }
    
}

extension CutGameScene : TimeBarDelegate {
    
    func didZeroBar() {
        self.finishScene(result: .loss)
    }
}
