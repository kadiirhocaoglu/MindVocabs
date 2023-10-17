//
//  MainTabBarViewController.swift
//  MindVocabs
//
//  Created by Kadir Hocaoğlu on 12.10.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "person")
        vc1.tabBarItem.title = "Anasayfa"
        vc2.tabBarItem.title = "Profil"
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2], animated: true)
    }
    

}
