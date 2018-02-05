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
    
    
    /*
     Función que crea el registro.
     */
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
            .responseData { (response) in
                
                switch response.result{
                case .success(let data):
           
                    if let newJSON = try? JSONSerialization.jsonObject(with: data, options: []) {
                        let array = newJSON as! [String:Any]
                        let message : String = array["message"] as! String
                        self.remoteRequestHandler?.showError(forError: message)
                    } else {
                        self.remoteRequestHandler?.createdRegisterResponse()
                    }
                 
                case .failure(let error):
                    self.remoteRequestHandler?.showError(forError: error as! String)
                 
                }
        }
    
    }
    
}
