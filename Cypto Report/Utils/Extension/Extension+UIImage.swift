//
//  Extension+UIImage.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 25/02/22.
//

import UIKit

//MARK: Handle Icon
extension UIImage {
    enum Icon {
        case house
        case news
        case chart
        case discover
        
        var image: UIImage {
            switch self {
            case .house:
                return Asset.house.value.setImage()
            case .chart:
                return Asset.chart.value.setImage()
            case .news:
                return Asset.news.value.setImage()
            case .discover:
                return Asset.discover.value.setImage()
         
            }
        }
    }
    
    enum Asset: String {
        //MARK: TabBar Icon
        case house = "home"
        case chart = "chart"
        case news = "invoice"
        case discover = "discover"
        
        
        var value: String {
            return rawValue
        }
    }
}

