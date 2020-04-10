//
//  ActivityCoordinator.swift
//  WWDC
//
//  Created by Lucas Costa  on 19/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import SpriteKit

protocol Coordinator {
    
    /// Navigation
    var navigationController : UINavigationController { get }
    
    /// Present scene according type
    /// - Parameter type: scene type
    func presentScene(type: Activity)
    
    /// Finish scene change the controller
    /// - Parameters:
    ///   - type: activity type
    ///   - result: game result
    func finishScene(type : Activity?, result : GameResult)
    
    /// Present home
    func presentHome()
    
    /// Dismiss scene
    func dismiss()
}

public class ActivityCoordinator: Coordinator {
    
    //MARK:- Properties
    public var navigationController: UINavigationController
    
    //MARK:- Initializer
    public init(rootViewController : SelectActivityViewController) {
        self.navigationController = UINavigationController(rootViewController: rootViewController)
        self.navigationController.navigationBar.isHidden = true
        rootViewController.coordinator = self
    }
    
    //MARK:- Methods
    func presentScene(type: Activity) {
        self.navigationController.pushViewController(ActivityViewBuilder.build(activity: type, activityCoordinator: self), animated: true)
    }
    
    func finishScene(type : Activity?, result : GameResult) {
        self.navigationController.pushViewController(MessageViewBuilder.build(activity: type, result: result, activityCoordinator: self), animated: true)
    }
    
    func dismiss() {
        self.navigationController.popViewController(animated: true)
    }
    
    func presentHome() {
        self.navigationController.popToRootViewController(animated: true)
    }

}
