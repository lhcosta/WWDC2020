//
//  MessageType.swift
//  WWDC
//
//  Created by Lucas Costa  on 31/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit

struct MessageType {
    
    static func getText(about activity : Activity) -> String {
        
        var text : String
        
        switch activity {
            case .glue:
                text = GlueInfo.text
            case .cut:
                text = CutInfo.text
            case .nail:
                text = NailInfo.text
        }
        
        return text
    }
    
    
}
