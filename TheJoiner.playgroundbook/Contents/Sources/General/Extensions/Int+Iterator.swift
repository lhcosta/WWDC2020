//
//  Extensions.swift
//  NailGame
//
//  Created by Lucas Costa  on 12/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation

extension Int : Sequence {
    public __consuming func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}
