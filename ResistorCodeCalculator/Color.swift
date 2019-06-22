//
//  Color.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/20/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import Foundation
import UIKit

enum Color: String {
    
    case RED
    case ORANGE
    case YELLOW
    case GREEN
    case BLUE
    case PURPLE
    case BLACK
    case BROWN
    case GREY
    case WHITE
    case GOLD
    case SILVER
    case DEFAULT
    
    var color: UIColor  {
        switch self {
        case.RED:
            return UIColor(red: 244/255, green: 63/255, blue: 63/255, alpha: 1.0)
        case.ORANGE:
            return UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0)
        case.YELLOW:
            return UIColor(red: 255/255, green: 252/255, blue: 107/255, alpha: 1.0)
        case .GREEN:
            return UIColor(red: 77/255, green: 162/255, blue: 48/255, alpha: 1.0)
        case .BLUE:
            return UIColor(red: 67/255, green: 173/255, blue: 224/255, alpha: 1.0)
        case .PURPLE:
            return UIColor(red: 202/255, green: 152/255, blue: 214/255, alpha: 1.0)
        case .BLACK:
            return UIColor.black
        case .BROWN:
            return UIColor.brown
            //return UIColor(red: 165/255, green: 133/255, blue: 86/255, alpha: 1.0)
        case .GREY:
            return UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1.0)
        case .WHITE:
            return UIColor.white
        case .GOLD:
            return UIColor(red: 252/255, green: 194/255, blue: 0/255, alpha: 1.0)
        case .SILVER:
            return UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1.0)
            
        case .DEFAULT:
            return UIColor(red: 24, green: 54, blue: 38, alpha: 1.0)
            
        }
        
    }
}
