//
//  AITabBarViewController.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import UIKit

class AITabBarViewController: UITabBarController {
    
    var presentor:AITabBarViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .purple
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        self.tabBar.unselectedItemTintColor = .gray
        UINavigationBar.appearance().isTranslucent = false
    }
    
    func setupTabbar(from tabbar: [AITabbarViewModel]) {
        var viewControllerList = [UIViewController]()
        for tab in tabbar {
            if let vc = presentor?.getViewForTab(type: tab.type) {
                let nc = UINavigationController(rootViewController: vc)
                vc.navigationItem.title = tab.title
                vc.tabBarItem.image = FontAwesomeImageWrapper.getImage(name: tab.imageName)
                viewControllerList.append(nc)
            }
        }
        viewControllers = viewControllerList
    }
}

extension AITabBarViewController:AITabBarPresenterToViewProtocol {
    func loadViewData() {
        self.setupTabbar(from: presentor?.fetchTabData() ?? [])
    }
}
