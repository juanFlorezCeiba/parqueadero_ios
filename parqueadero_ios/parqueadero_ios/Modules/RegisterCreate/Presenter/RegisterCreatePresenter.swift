//
//  RegisterCreatePresenter.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/4/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterCreatePresenter: RegisterCreatePresenterProtocol {

    
  
    var view: RegisterCreateViewProtocol?
    
    var interactor: RegisterCreateInteractorInputProtocol?
    
    var wireframe: RegisterCreateWireframeProtocol?
    
    /*
     Función que le envia los datos del registro al interactor.
     */
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String) {
        
        interactor?.createRegister(forRegistrationNumber: registrationNumber, forDisplacement: displacement, forType: type)
    }
    
    /*
     Función que le indica al wireframe que cambie de vista.
     */
    func comeBackView() {
        wireframe?.comeBackView(from: view!)
    }
    
}

extension RegisterCreatePresenter: RegisterCreateInteractorOutputProtocol{
   
    /*
     Función que le indica al view que hubo un error.
     */
    func showError(forError error: String) {
        view?.showError(forError: error)
    }
    

    /*
     Función que le indica a la vista que el registro fue exitoso.
     */
    func createdRegisterResponse() {
        view?.showResponse()
    }
    
    
}
