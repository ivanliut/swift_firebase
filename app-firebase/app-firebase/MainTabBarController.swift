//
//  MainTabBarController.swift
//  app-firebase
//
//  Created by administrator on 5/16/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        //home
        let homeNavController = templateNavController(unselectedImage: UIImage(named: "home")!, selectedImage: UIImage(named: "home-filled")!)
        
        //search
        let searchNavController = templateNavController(unselectedImage: UIImage(named: "search")!, selectedImage: UIImage(named: "search-filled")!)
        
        //plus
        let plusNavController = templateNavController(unselectedImage: UIImage(named: "add")!, selectedImage: UIImage(named: "add")!)
        
        //heart
        let heartNavController = templateNavController(unselectedImage: UIImage(named: "heart")!, selectedImage: UIImage(named: "heart-filled")!)
        
        //user profile
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        
        let userProfileNavController = UINavigationController(rootViewController: userProfileController)
        
        userProfileNavController.tabBarItem.image = UIImage(named: "man_unfilled")
        userProfileNavController.tabBarItem.selectedImage = UIImage(named: "man_filled")
        
        tabBar.tintColor = .black
        
        viewControllers = [homeNavController,
                           searchNavController,
                           plusNavController,
                           heartNavController,
                           userProfileNavController]
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    
}
