//
//  RegisterCreateInteractor
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/4/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

class RegisterCreateInteractor: RegisterCreateInteractorInputProtocol {
    var presenter: RegisterCreateInteractorOutputProtocol?
    
    var remoteDataManager: RegisterCreateRemoteDataManagerInputProtocol?
    
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String) {
        remoteDataManager?.createRegister(forRegistrationNumber: registrationNumber, forDisplacement: displacement, forType: type)
    }
    
    
}

extension RegisterCreateInteractor: RegisterCreateRemoteDataManagerOutputProtocol{
    func createdRegisterResponse() {
        presenter?.createdRegisterResponse()
    }
    
    
}
