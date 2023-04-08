//
//  TabBarViewController.swift.swift
//  SpotifyCloneApp
//
//  Created by Evgeniy Docenko on 08.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    // controllers
    private let firstVC = HomeViewController()
    private let secondVC = SearchViewController()
    private let thirdVC = LibraryViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // navigation controllers
        let firstNav = UINavigationController(rootViewController: firstVC)
        let secondNav = UINavigationController(rootViewController: secondVC)
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        
        firstNav.navigationBar.prefersLargeTitles = true
        secondNav.navigationBar.prefersLargeTitles = true
        thirdNav.navigationBar.prefersLargeTitles = true
        
        // setup tabbar item image
        firstNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        secondNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 0)
        thirdNav.tabBarItem = UITabBarItem(title: "Your Library", image: UIImage(named: "library"), tag: 0)
        // setup tabbar item image when it pressed
        firstNav.tabBarItem.selectedImage = UIImage(named: "homeFilled")
        secondNav.tabBarItem.selectedImage = UIImage(named: "searchFilled")
        thirdNav.tabBarItem.selectedImage = UIImage(named: "libraryFilled")
        // unselected tabbar item color
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1)
        // selected tabbar item color
        self.tabBar.tintColor = UIColor.white
        
        setViewControllers([firstNav, secondNav, thirdNav], animated: false)
    }
    
    private func setupUI() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 34) ?? ""
        ]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.selectionIndicatorTintColor = .white
        
        
        // customize controllers
        firstVC.navigationItem.largeTitleDisplayMode = .always
        secondVC.navigationItem.largeTitleDisplayMode = .always
        thirdVC.navigationItem.largeTitleDisplayMode = .always
        
        firstVC.title = "Home"
        secondVC.title = "Search"
        thirdVC.title = "Your Library"
    }
}
