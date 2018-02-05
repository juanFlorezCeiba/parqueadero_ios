//
//  RegisterDetailPresenter.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterDetailPresenter: RegisterDetailPresenterProtocol {
    
    func paidConfirmation(forId id: Int) {
        interactor?.paidConfirmation(forId: id)
    }
    
   
    weak var view: RegisterDetailViewProtocol?
    var wireframe: RegisterDetailWireframeProtocol?
    var interactor: RegisterDetailInteractorInputProtocol?
    
    var register: Registro?
    
     var rate: Int?
    
    /*
     Función que envia la información de un registro a la vista para ser visualizado.
     */
    func viewDidLoad() {
        view?.showRegisterDetail(forRegister: register!)
    }

    /*
     Función para obtener la tarifa.
     */
    func retrieveRegisterRate(forId id: Int) {
        interactor?.retrieveRegisterRate(forId: id)
    }
}


extension RegisterDetailPresenter: RegisterDetailInteractorOutputProtocol{
 
    /*
     Función que obtiene la tarifa y se la envía a la vista.
     */
    func didRetrieveRegisterRate(rate: Int) {
        view?.getRegisterRate(forRate: rate)
    }
  
    /*
     Función para indicarle al wireframe que cambie de vista.
     */
    func comeBackView() {
        wireframe?.comeBackView(from: view!)
    }
    /*
     Función para indicarle a la vista que hubo un error pagando.
     */
    func onErrorPaying() {

        view?.onErrorPaying()
    }
    
}
