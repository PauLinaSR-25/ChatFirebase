//
//  MainTabBarController.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        
        let conversationsVC = ConversationsRouter.createModule()
        let profileVC = ProfileRouter.createModule()
        
        conversationsVC.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message.fill"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person.fill"), tag: 1)
        
        let conversationsNav = UINavigationController(rootViewController: conversationsVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        
        viewControllers = [conversationsNav, profileNav]
    }
}
