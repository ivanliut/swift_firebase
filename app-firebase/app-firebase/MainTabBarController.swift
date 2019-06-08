//
//  MainTabBarController.swift
//  app-firebase
//
//  Created by administrator on 5/16/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2 {
            let layout = UICollectionViewFlowLayout()
            let photoSelectorController = PhotoSelectorController(collectionViewLayout: layout)
            let navController = UINavigationController(rootViewController: photoSelectorController)
            present(navController, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
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
        let homeNavController = templateNavController(unselectedImage: UIImage(named: "home")!, selectedImage: UIImage(named: "home-filled")!, rootViewController: UserProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
       
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
        //modify tab bar item insets
        guard let items = tabBar.items else {
            return
        }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    
}
