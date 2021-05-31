//
//  TabBarController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 15/05/21.
//

import UIKit

final class TabBarController: UITabBarController {
    private let customHome = HomeViewController()
    private let customSearch = SearchViewController()
    private let customInitialLogin = InitialLoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = customHome
        let searchVC = customSearch
        let initialLoginVC = customInitialLogin
        
        homeVC.tabBarItem = UITabBarItem(title: "Início", image: UIImage(named: "IconHome"), tag: 1)
        searchVC.tabBarItem = UITabBarItem(title: "Buscar", image: UIImage(named: "IconSearch"), tag: 2)
        initialLoginVC.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(named: "IconProfile"), tag: 3)
        
        let controllers = [homeVC,searchVC,initialLoginVC]
        self.setViewControllers(controllers, animated: false)
        
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = UIColor(named: "PurpleDark")
        self.tabBar.tintColor = UIColor(named: "Yellow")
    }
}

