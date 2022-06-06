//
//  ViewShadow.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 24/02/22.
//

import UIKit

class CustomShadowView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
        layer.cornerRadius = 10
    }
}
