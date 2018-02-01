//
//  RegisterListPresenter.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterListPresenter: RegisterListPresenterProtocol {
    
    weak var view: RegisterListViewProtocol?
    
    var wireframe: RegisterListWireframeProtocol?
    
    var interactor: RegisterListInteractorInputProtocol?
    
    /**
     * Función que le indica a la view que muestre el HUD de cargando.
     * Le indica al interactor que obtenga los registros.
 */
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveRegisterList()
    }
    
    func showRegisterDetail(forRegister register: Registro) {
        //TODO
    }
    
}

extension RegisterListPresenter: RegisterListInteractorOutputProtocol{
    
    /*
     Función envía los registros recuperados desde presenter hacía la view.
    */
    func didRetrieveRegisters(_ registers: [Registro]) {
       
        view?.hideLoading()
        view?.showRegister(with: registers)
    }
    
    /*
    Función que le indica a la vista que hubo un error.
    */
    func onError() {
        view?.showError()
    }
    
    
}