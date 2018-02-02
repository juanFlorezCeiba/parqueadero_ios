//
//  RegisterDetailWireframe.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit

class RegisterDetailWireframe: RegisterDetailWireframeProtocol { 
   
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createRegisterDetailModule(forRegister register: Registro) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "RegisterDetailViewController")
        
        if let view = viewController as? RegisterDetailView {
            
            let presenter: RegisterDetailPresenterProtocol = RegisterDetailPresenter()
            let wireframe: RegisterDetailWireframeProtocol = RegisterDetailWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.register = register
            
            return viewController
        }
        
        return UIViewController()
    }
    
}
