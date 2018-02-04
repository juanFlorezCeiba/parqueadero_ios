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
        
        //Se inicializa la view.
        let tabRegister = RegisterListWireframe.createRegisterListModule()
        let tabRegisterItem = UITabBarItem(title: "Registros", image: #imageLiteral(resourceName: "document"), selectedImage: nil)
        tabRegister.tabBarItem = tabRegisterItem
        
        let tabCar = TabCarViewController()
        
        let tabCarBarItem = UITabBarItem(title: "Carros", image: #imageLiteral(resourceName: "car"), selectedImage: nil)
        
        tabCar.tabBarItem = tabCarBarItem
       
        
        let tabBike = TabBikeViewController()
        
        let tabBikeBarItem = UITabBarItem(title: "Motos", image: #imageLiteral(resourceName: "motorbike"), selectedImage: nil)
        tabBike.tabBarItem = tabBikeBarItem
    
        self.viewControllers = [tabRegister, tabCar, tabBike]

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
