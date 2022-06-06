//
//  CryptoTopList.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 22/02/22.
//

import Foundation
import SwiftyJSON

class CryptoTopLists {
    enum CodingKeys: String {
        case data = "Data"
        case message = "Message"
    }
    
    var data: [CryptoData] = []
    var message: String?
    
    required convenience init(json: JSON) {
        self.init()
        let data = json[CodingKeys.data.rawValue].arrayValue
        for item in data {
            let data = CryptoData(json: item)
            self.data.append(data)
        }
        message = json[CodingKeys.message.rawValue].stringValue
    }
}

class CryptoData {
    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case raw = "RAW"
        case display = "DISPLAY"
    }
    
    var coinInfo: CryptoCoinInfo?
    var raw: CryptoCurrency?
    var display: CryptoCurrency?
    
    required convenience init(json: JSON) {
        self.init()
        coinInfo = CryptoCoinInfo(json: json[CodingKeys.coinInfo.rawValue])
        raw = CryptoCurrency(json: json[CodingKeys.raw.rawValue])
        display = CryptoCurrency(json: json[CodingKeys.display.rawValue])
    }
}


class CryptoCurrency {
    var usd: CryptoUSD?
    
    required convenience init(json: JSON) {
        self.init()
        usd = CryptoUSD(json: json["USD"])
    }
    
}


class CryptoCoinInfo {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case fullName = "FullName"
        case name = "Name"
        case imageUrl = "ImageUrl"
    }
    
    var id: String?
    var fullName: String?
    var name: String?
    var imageUrl: String?
    
    required convenience init(json: JSON) {
        self.init()
        id = json[CodingKeys.id.rawValue].string
        fullName = json[CodingKeys.fullName.rawValue].string
        name = json[CodingKeys.name.rawValue].string
        imageUrl = json[CodingKeys.imageUrl.rawValue].string
    }
}



