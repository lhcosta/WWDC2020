//
//  PointsBar.swift
//  WWDC
//
//  Created by Lucas Costa  on 25/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

protocol TimeBarDelegate : AnyObject {
    func didZeroBar()
}

class TimeBar {
    
    //MARK:- Properties
    private let bar : SKSpriteNode!
    private let points : SKSpriteNode 
    var icon : SKSpriteNode!

    weak var delegate : TimeBarDelegate?
    private var time : TimeInterval = 60
    private var timer : Timer?
    
    //MARK:- Initializer
    init(in rect : CGRect) {
        
        self.bar = SKSpriteNode(imageNamed: "TimeBar")
        self.points = SKSpriteNode(imageNamed: "TimePoints") 

        createTimeIcon(rect: rect)
        createTimeBar(in: rect)
    }
    
    func startCount() {
        let sizeBar = self.points.size.width/CGFloat(time)
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: sizeBar, repeats: true) 
    }
    
    func stopCount() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
}

//MARK:- Private methods
private extension TimeBar {
    
    func createTimeBar(in rect : CGRect) {
        
        self.bar.size = CGSize(width: rect.width * 0.5, height: self.icon.size.height * 0.55)
        self.bar.position = CGPoint(x: 0, y: 0)
        self.bar.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.bar.zPosition = -1
        self.icon.addChild(bar)
        self.createPointsBar()
    }
    
    func createPointsBar() {
        self.points.size = CGSize(width: bar.size.width * 0.99, height: bar.size.height * 0.95)
        self.points.zPosition = -1
        self.points.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.bar.addChild(points)
    }
    
    func createTimeIcon(rect : CGRect) {
        self.icon = SKSpriteNode(imageNamed: "TimeIcon")
        self.icon.size = CGSize(width: rect.width * 0.07, height: rect.height * 0.1)
        self.icon.position = CGPoint(x: rect.width * 0.1, y: rect.height * 0.85)
        self.icon.zPosition = 1
    }
    

    @objc func updateTime(timer : Timer) {
        
        guard let sizeBar = timer.userInfo as? CGFloat else {
            return
        }
                
        if time > 0 {
            let resize = SKAction.resize(byWidth: -sizeBar, height: 0, duration: 1)
            self.points.run(resize)
        } else {
            stopCount()
            self.delegate?.didZeroBar()
        }
        
        time -= 1
    }
        
}
