//
//  RegisterCreateRemoteDataManager.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/4/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import Alamofire

class RegisterCreateRemoteDataManager: RegisterCreateRemoteDataManagerInputProtocol {
    var remoteRequestHandler: RegisterCreateRemoteDataManagerOutputProtocol?
    
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String) {
        
        var url : String?
        
        switch type {
        case "Carro":
            url = Endpoints.ApiParqueadero.crearRegistroCarro.url
        case "Moto":
            url = Endpoints.ApiParqueadero.crearRegistroMoto.url
        default:
            url = ""
        }
        
        let parameters: Parameters = [
            "placa": registrationNumber,
            "cilindraje": displacement,
        ]
        
        Alamofire
            .request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    
                    self.remoteRequestHandler?.createdRegisterResponse()
                
                case .failure:
                    print("ERROR")
                
        }
    }
    
    }
    
}
