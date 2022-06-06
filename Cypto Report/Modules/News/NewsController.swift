//
//  NewsController.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 09/04/21.
//

import UIKit
    
protocol INewsController: AnyObject {
    var router: INewsRouter? { get set }
    func didSuccessGetNews(data: [NewsData])
    func didFailedGetNews(message: String)
}

class NewsController: UIViewController {
    var interactor: INewsInteractor?
    var router: INewsRouter?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var newsData: [NewsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        Loading.show()
        interactor?.getNews()
    }
    
    private func setupView() {
        titleLabel.text = Constant.titleNews
        tableView.dataSource = self
        tableView.register(cellType: NewsCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK: test local
    @IBAction func didTestLocalPost(_ sender: UIButton) {
//        interactor?.postUser(username: "juiktyu")
    }
    
}

extension NewsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsCell.self, for: indexPath)
        cell.data = newsData[indexPath.row]
        return cell
    }
    
    
}

extension NewsController: INewsController {
    func didSuccessGetNews(data: [NewsData]) {
        DispatchQueue.main.async {
            Loading.hide()
            self.newsData = data
            self.tableView.reloadData()
        }
    }
    
    func didFailedGetNews(message: String) {
        DispatchQueue.main.async {
            Loading.hide()
        }
    }
}
