//
//  ViewController.swift
//  TemplateApp
//
//  Created by Caue Borella on 27/8/18.
//  Copyright © 2018 Caue Borella. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.index(of: viewController)
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
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        //home
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //search
        let searchNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //camera
        let cameraNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "camera3"), selectedImage: #imageLiteral(resourceName: "camera3"))
        
        //history
        let historyNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: HistoryController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //user profile
        let profileNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabBar.tintColor = .black
        
        viewControllers = [homeNavController,
                           searchNavController,
                           cameraNavController,
                           historyNavController,
                           profileNavController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
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

