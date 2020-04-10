//
//  LoadFonts.swift
//  WWDC
//
//  Created by Lucas Costa  on 03/04/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import Foundation
import UIKit

struct LoadFonts {
    
    /// Loading fonts
    static func loading() {
        if let urlFont = Bundle.main.url(forResource: "Fonts/lilita-one", withExtension: "ttf"){
            CTFontManagerRegisterFontsForURL(urlFont as CFURL, .process, nil)
        }
        
        if let urlFont = Bundle.main.url(forResource: "Fonts/SF-Pro-Rounded-Regular", withExtension: "otf"){
            CTFontManagerRegisterFontsForURL(urlFont as CFURL, .process, nil)
        }
        
    }
    
}
