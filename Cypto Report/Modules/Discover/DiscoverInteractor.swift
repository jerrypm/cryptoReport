//
//  DiscoverInteractor.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 26/02/22.
//

import Foundation

protocol IDiscoverInteractor: AnyObject {
  // here
}

class DiscoverInteractor: IDiscoverInteractor {
    var presenter: IDiscoverPresenter?
    var worker: IDiscoverWorker?
    var parameters: [String: Any]?
    
    init(presenter: IDiscoverPresenter, worker: IDiscoverWorker) {
        self.presenter = presenter
        self.worker = worker
    }
  
}
