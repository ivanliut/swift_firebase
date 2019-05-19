//
//  MainTabBarController.swift
//  app-firebase
//
//  Created by administrator on 5/16/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit

class MaiTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        
        let navController = UINavigationController(rootViewController: userProfileController)
        
        navController.tabBarItem.image = UIImage(named: "man_unfilled")
        navController.tabBarItem.selectedImage = UIImage(named: "man_filled")
        
        tabBar.tintColor = .black
        
        viewControllers = [navController, UIViewController()]
    }
}
