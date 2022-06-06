//
//  DiscoverPresenter.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 26/02/22.
//

import UIKit

protocol IDiscoverPresenter: AnyObject {
    //here
}

class DiscoverPresenter: IDiscoverPresenter {
    weak var view: IDiscoverViewController?
    
    init(view: IDiscoverViewController?) {
        self.view = view
    }
    
}
