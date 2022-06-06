//
//  TabBarController.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 25/02/22.
//

import UIKit

class TabBarController:  UITabBarController {
    
    var homeNavigationController: BaseNavigationController!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setup() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = true
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .mainGreen
        
        let homeViewController = Configurator.setupTopListModule()
        let discoverViewController = Configurator.setupDiscoverModule()
        let newsViewController = Configurator.setupNewsModule()
        homeNavigationController = BaseNavigationController(rootViewController: homeViewController)
        
        // setup icon tabbar
        homeViewController.tabBarItem.image = CI.house.image
        discoverViewController.tabBarItem.image = CI.discover.image
        newsViewController.tabBarItem.image = CI.news.image
        
        viewControllers = [homeNavigationController, discoverViewController, newsViewController]
        let tabBarItemTitle = [Constant.home, Constant.discover, Constant.news]
        
        for (index, tabBarItem) in tabBar.items!.enumerated() {
            tabBarItem.title = tabBarItemTitle[index]
        }
        
    }
    
}

//MARK: UITabbar Delegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

//MARK: Base Navigation
class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = .mineShaft
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.isTranslucent = false
        setNavigationBarHidden(true, animated: false)
    }
    
}
