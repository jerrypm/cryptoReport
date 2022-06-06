//
//  NewsInteractor.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import Foundation

protocol INewsInteractor: AnyObject {
    var parameters: [String: Any]? { get set }
    func getNews()
    func postUser(username: String)
}

class NewsInteractor: INewsInteractor {
    var presenter: INewsPresenter?
    var worker: INewsWorker?
    var parameters: [String: Any]?
    
    init(presenter: INewsPresenter, worker: INewsWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func getNews() {
        worker?.getNews(completion: { (status, result) in
            switch status {
            case .success:
                if let value = result {
                    self.presenter?.presentSuccessGetNews(data: value)
                }
            case .failed:
                self.presenter?.presentFailedGetNews(message: "")
            case .none:
                break
            }
        })
    }
    
    //MARK: Test POST Api Local / Mockoon
    func postUser(username: String) {
        worker?.postUser(username: username, completion: { (status, message) in
            switch status {
            case .success:
                print("Test Post", message)
                
            case.failed:
                print("Test failed Post", message)
                
            case .none:
                break
            }
        })
    }
}
