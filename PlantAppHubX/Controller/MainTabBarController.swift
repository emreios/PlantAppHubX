//
//  MainTabBarController.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isTranslucent = false
        
        setupViewControllers()
        
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage()
        tabBar.clipsToBounds = true
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
    
    func setupViewControllers() {
        
        let homeController = HomeController()
        let homeTab = UINavigationController(rootViewController: homeController)
        
        homeTab.tabBarItem.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        homeTab.tabBarItem.selectedImage = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        homeTab.tabBarItem.title = "Home"
        
        let secondController = UIViewController()
        let secondTab = UINavigationController(rootViewController: secondController)
        
        secondTab.tabBarItem.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.title = "Diagnose"
        
        let thirdController = UIViewController()
        let thirdTab = UINavigationController(rootViewController: thirdController)
        
        thirdTab.tabBarItem.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        thirdTab.tabBarItem.selectedImage = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        
        
        let fourthController = UIViewController()
        let fourthTab = UINavigationController(rootViewController: fourthController)
        
        fourthTab.tabBarItem.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        fourthTab.tabBarItem.selectedImage = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        fourthTab.tabBarItem.title = "My Garden"
        
        let fifthController = UIViewController()
        let fifthTab = UINavigationController(rootViewController: fifthController)
        
        fifthTab.tabBarItem.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        fifthTab.tabBarItem.selectedImage = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        fifthTab.tabBarItem.title = "Profile"
        
        viewControllers = [homeTab, secondTab, thirdTab, fourthTab, fifthTab]
      
        guard let items = tabBar.items else {return}
        
        for item in items {
            
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}

