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
    
    func retrieveRegisterRate(forId id: Int) {
        remoteDataManager?.retrieveRegisterRate(forId: id)
    }
    
    
}

extension RegisterDetailInteractor: RegisterDetailRemoteDataManagerOutputProtocol{
    func onRetrievedRegisterRate(rate: Int) {
        
        presenter?.didRetrieveRegisterRate(rate: rate)
    }
    
    
    
    
}
