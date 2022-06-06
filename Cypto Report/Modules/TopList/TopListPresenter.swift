//
//  TopListPresenter.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import UIKit

protocol ITopListPresenter: AnyObject {
    func presentSuccessGetList(data: [CryptoData])
    func presentFailedGetList(message: String)
}

class TopListPresenter: ITopListPresenter {
    weak var view: ITopListController?
    
    init(view: ITopListController?) {
        self.view = view
    }
    
    func presentSuccessGetList(data: [CryptoData]) {
        view?.didSuccessGetList(data: data)
    }
    
    func presentFailedGetList(message: String) {
        view?.didFailedGetList(message: message)
    }
}
