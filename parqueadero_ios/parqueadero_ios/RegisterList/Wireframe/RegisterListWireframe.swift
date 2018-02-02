//
//  RegisterListWireframe.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit

class RegisterListWireframe: RegisterListWireframeProtocol {

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    
    static func createRegisterListModule() -> UIViewController {
        
        let navController = storyboard.instantiateViewController(withIdentifier: "RegisterNavigationController")
        
        if let view = navController.childViewControllers.first as? RegisterListView {
            
            let presenter: RegisterListPresenterProtocol & RegisterListInteractorOutputProtocol = RegisterListPresenter()
            
            let interactor : RegisterListInteractorInputProtocol & RegisterListRemoteDataManagerOutputProtocol = RegisterListInteractor()
            
            let remoteDataManager: RegisterListRemoteDataManagerInputProtocol = RegisterListRemoteDataManager()
            
            let wireframe: RegisterListWireframeProtocol = RegisterListWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
            interactor.presenter = presenter
            interactor.remoteDataManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        
        return UIViewController()
    }
    
    func presenterRegisterDetailScreen(from view: RegisterListViewProtocol, forRegister register: Registro) {
        
        let registerDetailViewController = RegisterDetailWireframe.createRegisterDetailModule(forRegister: register)
        
        if let sourceView = view as? UIViewController {
            
            sourceView.navigationController?.pushViewController(registerDetailViewController, animated: true)
        }
    }
    
    
}
