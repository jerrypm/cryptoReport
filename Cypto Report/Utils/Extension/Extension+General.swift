//
//  Extension+UITableView.swift
//  Cypto Report
//
//  Created by Jerry Purnama on 11/04/21.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = String(describing: cellType)
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: type)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
}

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            let top = self.topViewController(nav.visibleViewController)
            return top
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                let top = self.topViewController(selected)
                return top
            }
        }
        
        if let presented = base?.presentedViewController {
            let top = self.topViewController(presented)
            return top
        }
        return base
    }
}
