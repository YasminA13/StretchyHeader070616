//
//  NewsItem.swift
//  StretchHeader070616
//
//  Created by Yasmin Ahmad on 2016-06-07.
//  Copyright © 2016 YasminA. All rights reserved.
//

import Foundation
import UIKit

struct NewsItem {
    enum NewsCategory {
        case World
        case Americas
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
        
        func toString() -> String {
            switch self {
            case .World:
                return "World"
            case .Americas:
                return "Americas"
            case .Europe:
                return "Europe"
            case .MiddleEast:
                return "Middle East"
            case .Africa:
                return "Africa"
            case .AsiaPacific:
                return "Asia-Pacific"
            
            }
        }
        
        func toColor() -> UIColor {
            switch self {
            case .World:
                return UIColor(red:0.373, green:0.745, blue:0.843, alpha:1.0)
            case .Americas:
                return UIColor(red:0.867, green:0.267, blue:0.573, alpha:1.0)
            case .Europe:
                return UIColor(red:0.078, green:0.663, blue:0.537, alpha:1.0)
            case .MiddleEast:
                return UIColor(red:1.000, green:0.431, blue:0.290, alpha:1.0)
            case .Africa:
                return UIColor(red:0.612, green:0.318, blue:0.714, alpha:1.0)
            case.AsiaPacific:
                return UIColor(red:0.592, green:0.604, blue:0.667, alpha:1.0)
                
            }
        }
    }
    
    let category: NewsCategory
    let summary: String
}
