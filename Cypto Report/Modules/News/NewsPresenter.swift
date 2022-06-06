//
//  NewsPresenter.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import Foundation

protocol INewsPresenter: AnyObject {
    func presentSuccessGetNews(data: [NewsData])
    func presentFailedGetNews(message: String)
}

class NewsPrensenter: INewsPresenter {
    weak var view: INewsController?
    
    init(view: INewsController?) {
        self.view = view
    }
    
    func presentSuccessGetNews(data: [NewsData]) {
        view?.didSuccessGetNews(data: data)
    }
    
    func presentFailedGetNews(message: String) {
        view?.didFailedGetNews(message: message)
    }
}
