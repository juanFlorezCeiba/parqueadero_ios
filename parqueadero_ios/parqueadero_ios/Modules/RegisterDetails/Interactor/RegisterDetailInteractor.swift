//
//  RegisterDetailInteractor.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterDetailInteractor: RegisterDetailInteractorInputProtocol {
    
    
    weak var presenter: RegisterDetailInteractorOutputProtocol?
    
    var remoteDataManager: RegisterDetailRemoteDataManagerInputProtocol?
    
    /*
     Función para obtener la tarifa.
     */
    func retrieveRegisterRate(forId id: Int) {
        remoteDataManager?.retrieveRegisterRate(forId: id)
    }
    /*
     Función para pagar el registro.
     */
    func paidConfirmation(forId id: Int) {
        remoteDataManager?.paidConfirmation(forId: id)
    }
}

extension RegisterDetailInteractor: RegisterDetailRemoteDataManagerOutputProtocol{
 
    /*
     Función que obtiene la tarifa y la envía al presentador.
     */
    func onRetrievedRegisterRate(rate: Int) {
        
        presenter?.didRetrieveRegisterRate(rate: rate)
    }
    
    /*
     Función que le indica al presentador cambiar de vista.
     */
    func comeBackView() {
        presenter?.comeBackView()
    }
    
    /*
     Función para indicar que ha habido un error pagando.
     */
    func onErrorPaying() {
        presenter?.onErrorPaying()
    }
}

