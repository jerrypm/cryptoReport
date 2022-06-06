//
//  LoadingViewController.swift
//  Netzme
//
//  Created by Ari Munandar on 21/08/19.
//  Copyright © 2019 Netzme. All rights reserved.
//

import UIKit

class Loading {
    class func show(message: String? = nil,_ completion: (() -> Void)? = nil) {
        let popup = LoadingViewController()
        popup.modalPresentationStyle = .overFullScreen
        popup.modalTransitionStyle = .crossDissolve
        UIApplication.topViewController()?.view.endEditing(true)
        UIApplication.topViewController()?.present(popup, animated: true, completion: completion)
        if message != nil {
            popup.message = message ?? Constant.empty
        }
    }

    class func hide(_ completion: (() -> Void)? = nil) {
        if let topVC = UIApplication.topViewController() as? LoadingViewController {
            topVC.dismiss(animated: true, completion: completion)
        }
    }
}

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var labelMessage: UILabel!
    
    var message: String = Constant.empty {
        didSet {
            labelMessage.text = message
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
