//
//  RegisterListInteractor.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterListInteractor: RegisterListInteractorInputProtocol {
   
    weak var presenter: RegisterListInteractorOutputProtocol?
    
    var remoteDataManager: RegisterListRemoteDataManagerInputProtocol?
    
    /*
     Función que le indica al remoteDataManager que obtenga los datos de los registros.
     */
    func retrieveRegisterList() {
        
        remoteDataManager?.retrieveRegisterList()
    }
    
}

extension RegisterListInteractor: RegisterListRemoteDataManagerOutputProtocol{
  

    /*
     Función que le envía al presentador 
     */
    func onRegistersRetrieved(_ registers: [Registro]) {
        presenter?.didRetrieveRegisters(registers)
    }
    
    func onError() {
        presenter?.onError()
    }
    
    
    
}
