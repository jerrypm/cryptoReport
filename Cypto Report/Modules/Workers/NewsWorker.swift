//
//  NewsWorker.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 11/04/21.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import SwiftyJSON

protocol INewsWorker: AnyObject {
    func getNews(completion: @escaping (status?, [NewsData]?) -> Void)
    func postUser(username: String, completion: @escaping (status?, String) -> Void)
}

class NewsWorker: INewsWorker {
    var newsData: [NewsData] = []
    var disposeBag: DisposeBag! = DisposeBag()
    var provider: MoyaProvider<NetworkService>! = MoyaProvider<NetworkService>(plugins: [CompleteUrlLoggerPlugin()])
    
    func getNews(completion: @escaping (status?, [NewsData]?) -> Void) {
        provider.rx.request(.getNews)
            .filterSuccessfulStatusCodes()
            .mapJSON().subscribe { response in
                DispatchQueue.main.async {
                    guard let json = try? JSONSerialization.data(withJSONObject: response) else { return }
                    let jsonData = JSON(json)
                    let model = NewsBase(json: jsonData)
                    model.data.forEach { (data) in
                        self.newsData.append(data)
                    }
                    completion(.success, self.newsData)
                }
                
            } onError: { error in
                print(error.localizedDescription)
                completion(.failed, nil)
                
            }.disposed(by: disposeBag)
    }
    
    //MARK: Test POST Api Local / Mockoon
    func postUser(username: String, completion: @escaping (status?, String) -> Void) {
        provider.rx.request(.postUser(username))
            .filterSuccessfulStatusCodes()
            .mapJSON().subscribe { response in
                print("Test Success Post", response)
                completion(.success, "")
                
            } onError: { message in
                print("Test failed Post", message)
                completion(.failed, "")
            }
    }
    
}
