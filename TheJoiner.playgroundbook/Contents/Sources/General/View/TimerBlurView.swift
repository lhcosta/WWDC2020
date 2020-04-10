//
//  BlurView.swift
//  WWDC
//
//  Created by Lucas Costa  on 28/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

protocol TimerBlurViewDelegate : AnyObject {
    /// Finish timer
    func didFinishTimer()
}


class TimerBlurView {
    
    //MARK:- Properties
    private var time : TimeInterval = 3
    private var label : UILabel!
    private var timer : Timer?
    private var blurView : UIVisualEffectView!
    weak var delegate : TimerBlurViewDelegate?
    
    func create(rect : CGRect) -> UIView {
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        self.blurView = UIVisualEffectView(frame: rect)
        
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.effect = blurEffect
        blurView.alpha = 0.3
        
        createTimerLabel(view: blurView.contentView)
        
        return blurView
    }
    
    func startTime() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
}

//MARK:- Private Methods
private extension TimerBlurView {
    
    @objc func updateTime() {
        label.text = "\(Int(time))"
        self.time -= 1
        
        if time < 0 {
            timer?.invalidate()
            timer = nil
            removeFromSuperView()
        }
    }
    
    func removeFromSuperView() {
        UIView.animate(withDuration: 0.5, animations: { 
            self.blurView.alpha = 0
        }) { (_) in
            self.blurView.removeFromSuperview()
            self.delegate?.didFinishTimer()
        }
    }
    
}

//MARK:- Outlets 
private extension TimerBlurView {
    
    func createTimerLabel(view : UIView) {
        
        self.label = UILabel()
        self.label.font = UIFont(name: "Helvetica", size: 120)
        self.label.textAlignment = .center
        self.label.textColor = .black
        self.label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            self.label.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5),
            self.label.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5),
            self.label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
