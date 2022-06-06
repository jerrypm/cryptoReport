//
//  TopListWorker.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 11/04/21.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import SwiftyJSON

protocol ITopListWorker: AnyObject {
    func getTopList(_ limit: Int, completion: @escaping (status?, [CryptoData]?) -> Void)
}

class TopListWorker: ITopListWorker {
    
    var topListData: [CryptoData] = []
    var disposeBag: DisposeBag! = DisposeBag()
    var provider: MoyaProvider<NetworkService>! = MoyaProvider<NetworkService>(plugins: [CompleteUrlLoggerPlugin()])
    
    func getTopList(_ limit: Int, completion: @escaping (status?, [CryptoData]?) -> Void) {
        topListData.removeAll()
        provider.rx.request(.getTopList(limit: limit))
            .filterSuccessfulStatusCodes()
            .mapJSON().subscribe { response in
                DispatchQueue.main.async {
                    guard let json = try? JSONSerialization.data(withJSONObject: response) else { return }
                    let jsonData = JSON(json)
                    let model = CryptoTopLists(json: jsonData)
                    model.data.forEach { (data) in
                        self.topListData.append(data)
                    }
                    completion(.success, self.topListData)
                }
                
            } onError: { error in
                print(error.localizedDescription)
                completion(.failed, nil)
                
            }.disposed(by: disposeBag)

    }
    
}
