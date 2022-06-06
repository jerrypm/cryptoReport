//
//  DiscoverRouter.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 26/02/22.
//

import UIKit

protocol IDiscoverRouter: AnyObject {
    //here
}

class DiscoverRouter: IDiscoverRouter {
    weak var view: DiscoverViewController?
    
    init(view: DiscoverViewController?) {
        self.view = view
    }
    
}
