//
//  ResistorClass.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/22/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import Foundation
import UIKit
class ResistorClass{
    
    let value: String
    let color1: UIColor
    let color2: UIColor
    let color3: UIColor
    let color4: UIColor
    let color5: UIColor
    let color6: UIColor
    
    init(value: String, color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor
        , color5: UIColor, color6: UIColor) {
        self.color1=color1
        self.color2=color2
        self.color3=color3
        self.color4=color4
        self.color5=color5
        self.color6=color6
        self.value = value
        
    }
    
}
