//
//  MainTabBarVC.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        tabBar.tintColor = .orange
        
        let firstVC = UINavigationController(rootViewController: MovieListVC())
        firstVC.navigationBar.prefersLargeTitles = true
        firstVC.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "magazine.fill"), tag: 0)
        
        let secondVC = UINavigationController(rootViewController: SearchVC())
        secondVC.navigationBar.prefersLargeTitles = true
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let third = UINavigationController(rootViewController: SettingsVC())
        third.navigationBar.prefersLargeTitles = true
        third.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let controllers = [firstVC, secondVC, third]
        self.viewControllers = controllers
    }
    
}

extension UIColor {
    static var opposite: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                    .white :
                    .black
            }
        }
        
        return .black
    }
}
