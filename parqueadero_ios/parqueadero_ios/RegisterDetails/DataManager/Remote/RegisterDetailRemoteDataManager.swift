//
//  RegisterDetailRemoteDataManager.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import Alamofire

class RegisterDetailRemoteDataManager: RegisterDetailRemoteDataManagerInputProtocol {
   
    var remoteRequestHandler: RegisterDetailRemoteDataManagerOutputProtocol?
    
    func retrieveRegisterRate(forId id: Int) {
        let url : String = "\(Endpoints.ApiParqueadero.obtenerTotalTarifa.url)/\(id)"
        Alamofire
            .request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON { (response) in
                let json = response.result.value as! [String:AnyObject]
                let tarifa = json["tarifa"] as! Int
               
                self.remoteRequestHandler?.onRetrievedRegisterRate(rate: tarifa)
        }

    }
    
    func paidConfirmation(forId id: Int) {
        
        let url: String = "\(Endpoints.ApiParqueadero.pagarTarifa.url)/\(id)"
        
        Alamofire
            .request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseData { (response) in
                print(response)
                switch response.result {
                case .success:
                    
                    self.remoteRequestHandler?.comeBackView()
                    
                case .failure:
                    self.remoteRequestHandler?.onErrorPaying()
                }
        }
      
        
    }
    
    
}
