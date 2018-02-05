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
    
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String) {
        
        interactor?.createRegister(forRegistrationNumber: registrationNumber, forDisplacement: displacement, forType: type)
    }
    
    func comeBackView() {
        wireframe?.comeBackView(from: view!)
    }
    
    func addRegister(){
        
    }
}

extension RegisterCreatePresenter: RegisterCreateInteractorOutputProtocol{
    func createdRegisterResponse() {
        view?.showResponse()
    }
    
    
}
