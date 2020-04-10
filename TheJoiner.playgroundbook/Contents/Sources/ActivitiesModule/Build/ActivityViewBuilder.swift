//
//  ActivityViewBuilder.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

struct ActivityViewBuilder {
    
    static func build(activity : Activity, activityCoordinator : Coordinator) -> UIViewController {
        
        let frame = CGRect(origin: .zero, size: CGSize(width: 1024, height: 768))
        let controller = ActivityViewController()
        
        controller.skview = SKView(frame : frame)
        controller.preferredContentSize = frame.size

        controller.activity = activity
        controller.coordinator = activityCoordinator
        controller.viewDidLoad()
        
        return controller
    }
    
    
}
