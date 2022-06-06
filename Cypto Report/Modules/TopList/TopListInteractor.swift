//
//  TopListInteractor.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import Foundation

protocol ITopListInteractor: AnyObject {
    var parameters: [String: Any]? { get set }
    func getTopList()
}

class TopListInteractor: ITopListInteractor {
    var presenter: ITopListPresenter?
    var worker: ITopListWorker?
    var parameters: [String: Any]?
    
    init(presenter: ITopListPresenter, worker: ITopListWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func getTopList() {
        worker?.getTopList(10, completion: { (status, result) in
            switch status {
            case .success:
                if let value = result {
                    self.presenter?.presentSuccessGetList(data: value)
                }
            case .failed:
                self.presenter?.presentFailedGetList(message: "")
            case .none:
                break
            }
        })
    }
}
