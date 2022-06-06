//
//  Extension+String.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 24/02/22.
//

import Foundation
import UIKit

extension String {
    //MARK: Set Image string name
    func setImage() -> UIImage {
        return UIImage(named: self) ?? UIImage()
    }
    
    func setSystemImage() -> UIImage {
        return UIImage(systemName: self) ?? UIImage()
    }
}

extension Int {
    func toCGfloat() -> CGFloat {
        return CGFloat(self)
    }
}
