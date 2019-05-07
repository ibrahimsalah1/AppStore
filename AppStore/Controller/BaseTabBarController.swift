//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/3/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createNavController(viewController: AppsPageController(), title: "Today", image: #imageLiteral(resourceName: "todayIcon")),
                           createNavController(viewController: UIViewController(), title: "Apps", image: #imageLiteral(resourceName: "appsIcon")),
                           createNavController(viewController: AppsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search"))]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title:String, image:UIImage ) -> UIViewController{
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }

}


