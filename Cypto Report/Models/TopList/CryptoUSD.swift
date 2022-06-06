//
//  CryptoUSD.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 22/02/22.
//

import Foundation
import SwiftyJSON

class CryptoUSD {
    enum CodingKeys: String {
        case toSymbol = "TOSYMBOL"
        case price = "PRICE"
        case changePCTHour = "CHANGEPCTHOUR"
        case changeHour = "CHANGEHOUR"
        case mktcappenalty = "MKTCAPPENALTY"
        
    }
    
    var toSymbol: String?
    var price: String?
    var changePCTHour: String?
    var changeHour: String?
    var mktcappenalty: String?
    
    required convenience init(json: JSON) {
        self.init()
        toSymbol = json[CodingKeys.toSymbol.rawValue].string
        price = json[CodingKeys.price.rawValue].string
        changePCTHour = json[CodingKeys.changePCTHour.rawValue].string
        changeHour = json[CodingKeys.changeHour.rawValue].string
        mktcappenalty = json[CodingKeys.mktcappenalty.rawValue].string
    }
}

