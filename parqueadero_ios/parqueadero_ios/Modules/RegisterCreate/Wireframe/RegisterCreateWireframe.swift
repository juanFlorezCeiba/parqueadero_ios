//
//  RegisterCreateWireframe.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/4/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit

class RegisterCreateWireframe: RegisterCreateWireframeProtocol {
    
  
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    /*
     Función que permite crear el modulo de creación de registros.
     */
    static func createRegisterCreateModule() -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "RegisterCreateViewController")
        
        if let view = viewController as? RegisterCreateView {
            
            let presenter: RegisterCreatePresenterProtocol & RegisterCreateInteractorOutputProtocol = RegisterCreatePresenter()
            
            let interactor: RegisterCreateInteractorInputProtocol & RegisterCreateRemoteDataManagerOutputProtocol = RegisterCreateInteractor()
            let remoteDataManager: RegisterCreateRemoteDataManagerInputProtocol = RegisterCreateRemoteDataManager()
            
            let wireframe: RegisterCreateWireframeProtocol = RegisterCreateWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDataManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            
            return viewController
        }
        
        return UIViewController()
    }
    
    /*
     Función que cambia de vista a la vista principal.
     */
    func comeBackView(from view: RegisterCreateViewProtocol){
        
        if let sourceView = view as? UIViewController {
            
            sourceView.navigationController?.popViewController(animated: true)
        }
    }

    
}
