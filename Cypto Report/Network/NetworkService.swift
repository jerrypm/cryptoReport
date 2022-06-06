//
//  NetworkService.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 22/02/22.
//

// Documentation: https://min-api.cryptocompare.com/documentation
// Example request Image: https://www.cryptocompare.com/media/37746251/btc.png

import Alamofire
import Foundation
import Moya

struct Config {
    //MARK: API Key (Authorization)
    static let apiKey = "13d2e02fb569b7b74a6e3da87f6ccdfb29ca69b945c3287aaeef5598c19dccbe"
    
    //MARK: -
    static let topList = "data/top/totaltoptiervolfull"
    static let news = "data/v2/news/"
    static let userpost = "userspost"
    
    //MARK: Base URL
    struct URL {
        static let baseUrlImage = "https://www.cryptocompare.com"
        static let base = "https://min-api.cryptocompare.com/"
//        static let base = "http://0.0.0.0:3002/" // local Api mockoon

    }
}

enum NetworkService: TargetType {
    var baseURL: URL { return URL(string: Config.URL.base)! }
    
    //MARK: GET
    case getTopList(limit: Int)
    case getNews
    
    //MARK: POST
    case postUser(_ username: String) //Test POST Api Local / Mockoon
    
    var path: String {
        switch self {
        case .getTopList:
            return Config.topList
        case .getNews:
            return Config.news
        case .postUser:   // Test POST Api Local / Mockoon
            return Config.userpost
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTopList, .getNews:
            return .get
        case .postUser:  // Test POST Api Local / Mockoon
            return .post
        }
    }
    
    var sampleData: Data { return Data() }
    
    var task: Task {
        switch self {
        case .getTopList, .getNews:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .postUser: // Test POST Api Local / Mockoon
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getTopList(let limit):
            return [
                "limit": limit,
                "tsym": "USD"
            ]
        
        case .getNews:
            return [
                "lang": "EN"
            ]
            
        case .postUser(let username): // Test POST Api Local / Mockoon
            return [
                "username": username
            ]
        }
    }
    
    var headers: [String: String]? {
        return [
            "Authorization": Config.apiKey,
            "Content-Type": "application/json"
        ]
    }
}

