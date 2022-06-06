//
//  DiscoverViewController.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 26/02/22.
//

import UIKit

protocol IDiscoverViewController: AnyObject {
    //here
}

class DiscoverViewController: UIViewController {
    var interactor: IDiscoverInteractor?
    var router: IDiscoverRouter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        view.backgroundColor = .mainGreen
        title = Constant.discover
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
}

extension DiscoverViewController: IDiscoverViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with:TopListCell.self , for: indexPath)
        return cell
    }
}



