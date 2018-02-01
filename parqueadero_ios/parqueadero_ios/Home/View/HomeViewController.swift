//
//  HomeViewController.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tabRegister = RegisterListWireframe.createRegisterListModule()
        let tabRegisterItem = UITabBarItem(title: "Registros", image: #imageLiteral(resourceName: "document"), selectedImage: nil)
        tabRegister.tabBarItem = tabRegisterItem
        
        let tabTwo = TabTwoViewController()
        
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: #imageLiteral(resourceName: "car"), selectedImage: nil)
        tabTwo.tabBarItem = tabTwoBarItem2
        self.viewControllers = [tabTwo, tabRegister]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
