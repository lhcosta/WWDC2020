//
//  SelectViewBuilder.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit

public struct SelectViewBuilder {
    
    public static func build(frame : CGRect) -> UIViewController {
        
        let view = SelectActivityView(frame: frame)
        let controller = SelectActivityViewController()
        controller.selectView = view
        controller.viewDidLoad()
        
        return controller
    }

}
