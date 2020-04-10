//
//  GlueTarget+Copying.swift
//  WWDC
//
//  Created by Lucas Costa  on 27/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation

protocol Copying : AnyObject {
    init(_ prototype : Self)
}

extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}
