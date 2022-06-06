//
//  TopListController.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import UIKit

protocol ITopListController: AnyObject {
    var router: ITopListRouter? { get set }
    func didSuccessGetList(data: [CryptoData])
    func didFailedGetList(message: String)
}

class TopListController: UIViewController {
    var interactor: ITopListInteractor?
    var router: ITopListRouter?
    
    @IBOutlet weak var tableView: UITableView!
    
    var topListData: [CryptoData]?
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor?.getTopList()
        Loading.show()
        
    }
    
    private func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: HeaderTableViewCell.self)
        tableView.register(cellType: TopListCell.self)
        tableView.separatorStyle = .none
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.pullRefresh)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        interactor?.getTopList()
    }
    
}

//MARK: Datasource
extension TopListController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.numberTwo
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == .zero {
            return Constant.numberOne
            
        } else {
            return topListData?.count ?? .zero
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == .zero {
            let cell = tableView.dequeueReusableCell(with: HeaderTableViewCell.self, for: indexPath)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(with: TopListCell.self, for: indexPath)
            cell.data = topListData?[indexPath.row]
            return cell
            
        }
    }

}

//MARK: Delegate
extension TopListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigateToDetailCoin()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == .zero {
            return UITableView.automaticDimension
        } else {
            return Constant.numberNinety.toCGfloat()
        }
    }
}

//MARK: Response
extension TopListController: ITopListController {
    func didSuccessGetList(data: [CryptoData]) {
        Loading.hide()
        refreshControl.endRefreshing()
        topListData = data
        tableView.reloadData()
    }
    
    func didFailedGetList(message: String) {
        refreshControl.endRefreshing()
        Loading.hide()
    }
}
