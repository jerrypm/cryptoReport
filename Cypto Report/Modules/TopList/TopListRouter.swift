//
//  TopListRouter.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import UIKit

protocol ITopListRouter: AnyObject {
    func navigateToDetailCoin()
}

class TopListRouter: ITopListRouter {
    weak var view: TopListController?
    
    init(view: TopListController?) {
        self.view = view
    }
    
    func navigateToDetailCoin() {
        let vc = Configurator.setupDiscoverModule()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
