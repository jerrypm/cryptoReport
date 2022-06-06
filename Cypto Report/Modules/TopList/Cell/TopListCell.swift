//
//  TopListCell.swift
//  Cypto Report
//
//  Created by Jerry Purnama Maulid on 10/04/21.
//

import UIKit
import Kingfisher

class TopListCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinFullnameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    
    var data: CryptoData? {
        didSet {
            coinNameLabel.text = data?.coinInfo?.name
            coinFullnameLabel.text = data?.coinInfo?.fullName
            priceLabel.text = data?.display?.usd?.price
            let changePCTHour = data?.display?.usd?.changePCTHour ?? Constant.empty
            let changeHour = data?.display?.usd?.changeHour?.replacingOccurrences(of: "$ ", with: Constant.empty) ?? Constant.empty
            if changeHour.contains("-") {
                tickerLabel.text = "\(changeHour)(\(changePCTHour)%)"
                tickerLabel.backgroundColor = .red
            } else {
                tickerLabel.text = "+\(changeHour)(+\(changePCTHour)%)"
                tickerLabel.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                
            }
            
            let stringUrl = Config.URL.baseUrlImage + (data?.coinInfo?.imageUrl ?? "")
            guard let url = URL(string: stringUrl) else { return }
            iconView.kf.setImage(with: url)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tickerLabel.backgroundColor = .red
        tickerLabel.layer.cornerRadius = 5
        
    }
    
}
