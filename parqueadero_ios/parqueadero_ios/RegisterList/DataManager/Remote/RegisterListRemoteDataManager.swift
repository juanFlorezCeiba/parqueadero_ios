//
//  RegisterListRemoteDataManager.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class RegisterListRemoteDataManager: RegisterListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: RegisterListRemoteDataManagerOutputProtocol?
    
    /*
     Función que recupera la lista de registros de la API.
     */
    func retrieveRegisterList() {

        Alamofire
        .request(Endpoints.ApiParqueadero.obtenerTodosVehiculos.url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        .validate()
            .responseArray { (response: DataResponse<[Registro]>) in
                
                switch response.result {
                    
                case .success(let registers):
                    
                    print("El total de registros es: \(registers.count)")
                    self.remoteRequestHandler?.onRegistersRetrieved(registers)
                case .failure(_):
                    print(response.result)
                }
        }

        
    }
    
}
