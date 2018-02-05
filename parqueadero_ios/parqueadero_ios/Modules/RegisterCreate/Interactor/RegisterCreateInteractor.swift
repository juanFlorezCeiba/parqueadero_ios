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
    
    /*
     Función que le envia los datos al remoteDataManager para crear el registro a través de un servicio REST.
     */
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String) {
        remoteDataManager?.createRegister(forRegistrationNumber: registrationNumber, forDisplacement: displacement, forType: type)
    }
    
    
}

extension RegisterCreateInteractor: RegisterCreateRemoteDataManagerOutputProtocol{
    
    /*
     Función que le indica al presentador que hubo un error.
     */
    func showError(forError error: String) {
        presenter?.showError(forError: error)
    }
    
    
    /*
     Función que le indica al presentador que se creo exitosamente.
     */
    func createdRegisterResponse() {
        presenter?.createdRegisterResponse()
    }
    
    
}
