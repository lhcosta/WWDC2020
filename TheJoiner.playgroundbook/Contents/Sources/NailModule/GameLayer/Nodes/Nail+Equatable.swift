//
//  Nail+Equatable.swift
//  WWDC
//
//  Created by Lucas Costa  on 29/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation

extension Nail : Equatable {
    
    static func == (lhs : Nail, rhs: Nail) -> Bool {
        return lhs.node == rhs.node
    }
    
}
