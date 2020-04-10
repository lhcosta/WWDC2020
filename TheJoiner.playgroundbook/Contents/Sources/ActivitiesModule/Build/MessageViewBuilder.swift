//
//  MessageViewBuilder.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit

struct MessageViewBuilder {
    
    static func build(activity : Activity?, result : GameResult, activityCoordinator : Coordinator) -> UIViewController {
        
        let viewController = MessageViewController()
        viewController.coordinator = activityCoordinator
        viewController.viewDidLoad()
        viewController.createMessageView(activity: activity, result: result)

        return viewController
    }
    
}
