//
//  NewsBase.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 22/02/22.
//

import Foundation
import SwiftyJSON

class NewsBase {
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case data = "Data"
    }
    
    var message: String?
    var data: [NewsData] = []
    
    required convenience init(json: JSON) {
        self.init()
        message = json[CodingKeys.message.rawValue].string
        let data = json[CodingKeys.data.rawValue].arrayValue
        for item in data {
            let data = NewsData(json: item)
            self.data.append(data)
        }
        
    }
}


class NewsData {
    enum CodingKeys: String {
        case id = "id"
        case title = "title"
        case source = "source"
        case body = "body"
        case imageURl = "imageurl"
    }
    
    var id: String?
    var title: String?
    var source: String?
    var body: String?
    var imageUrl: String?
    
    required convenience init(json: JSON) {
        self.init()
        id = json[CodingKeys.id.rawValue].string
        title = json[CodingKeys.title.rawValue].string
        source = json[CodingKeys.source.rawValue].string
        body = json[CodingKeys.body.rawValue].string
        imageUrl = json[CodingKeys.imageURl.rawValue].string
        
    }
}

