//
//  TabBarViewController.swift
//  ShortIt
//
//  Created by Александр on 14/01/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(white: 0.1, alpha: 0.05)
        
        let mainViewController = MainViewController()
        let icon1 = UITabBarItem(title: "Shorted now", image: UIImage(named: "lasso.and.sparkles"), selectedImage: UIImage(named: "lasso.and.sparkles"))
        mainViewController.tabBarItem = icon1
        
        let historyTableViewController = HistoryTableViewController()
        let icon2 = UITabBarItem(title: "History", image: UIImage(named: "list.bullet"), selectedImage: UIImage(named: "list.bullet"))
        historyTableViewController.tabBarItem = icon2
        
        let mainNavigationController = UINavigationController()
        mainNavigationController.viewControllers = [mainViewController]
        
        let historyNavigationController = UINavigationController()
        historyNavigationController.viewControllers = [historyTableViewController]
        
        let controllers = [mainNavigationController, historyNavigationController]
        
        viewControllers = controllers
    }
}
