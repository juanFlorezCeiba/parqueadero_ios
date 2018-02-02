//
//  RegisterDetailPresenter.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterDetailPresenter: RegisterDetailPresenterProtocol {
   

    
    var view: RegisterDetailViewProtocol?
    
    var wireframe: RegisterDetailWireframeProtocol?
    var interactor: RegisterDetailInteractorInputProtocol?
    
    var register: Registro?
    
     var rate: Int?
    
    
    func viewDidLoad() {
        view?.showRegisterDetail(forRegister: register!)
    }

    
    func retrieveRegisterRate(forId id: Int) {
        interactor?.retrieveRegisterRate(forId: id)
    }
}

extension RegisterDetailPresenter: RegisterDetailInteractorOutputProtocol{
   
    func didRetrieveRegisterRate(rate: Int) {
        view?.rate = rate
    }
    
    func onError() {
        view?.rate = 0
    }
    
    
}
