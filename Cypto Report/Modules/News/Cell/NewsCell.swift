//
//  NewsCell.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 12/04/21.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var data: NewsData? {
        didSet {
            sourceLabel.text = data?.source
            titleLabel.text = data?.title
            descLabel.text = data?.body
            
            let stringUrl = data?.imageUrl ?? ""
            guard let url = URL(string: stringUrl) else { return }
            newsImage.kf.setImage(with: url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
