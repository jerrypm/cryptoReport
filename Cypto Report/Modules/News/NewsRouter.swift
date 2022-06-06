//
//  NewsRouter.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import UIKit

protocol INewsRouter: AnyObject {
}

class NewsRouter: INewsRouter {
    weak var view: NewsController?
    
    init(view: NewsController?) {
        self.view = view
    }
    
}

