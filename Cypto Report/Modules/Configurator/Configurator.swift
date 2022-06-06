//
//  Configurator.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 24/02/22.
//

import UIKit

class Configurator {
    
    // MARK: Top List
    static func setupTopListModule() -> UIViewController {
        let controller = TopListController()
        let router = TopListRouter(view: controller)
        let presenter = TopListPresenter(view: controller)
        let worker = TopListWorker()
        let interactor = TopListInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        return controller
    }
    
    // MARK: Discover
    static func setupDiscoverModule() -> UIViewController {
        let controller = DiscoverViewController()
        let router = DiscoverRouter(view: controller)
        let presenter = DiscoverPresenter(view: controller)
        let worker = DiscoverWorker()
        let interactor = DiscoverInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        return controller
    }
    
    // MARK: News
    static func setupNewsModule(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = NewsController()
        let router = NewsRouter(view: controller)
        let presenter = NewsPrensenter(view: controller)
        let worker = NewsWorker()
        let interactor = NewsInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
