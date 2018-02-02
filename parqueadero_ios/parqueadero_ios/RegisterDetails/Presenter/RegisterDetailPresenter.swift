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
    
    var register: Registro?
    
    func viewDidLoad() {
        view?.showRegisterDetail(forRegister: register!)
    }

}
