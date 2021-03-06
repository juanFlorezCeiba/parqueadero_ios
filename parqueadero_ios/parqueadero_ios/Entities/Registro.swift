//
//  Registro.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 1/31/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct Registro {
    var id: Int?
    var fechaEntrada: Int?
    var fechaSalida: Int? = 0
    var vehiculo: Vehiculo?

}

extension Registro: Mappable {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <-   map["id"]
        fechaEntrada <- (map["fechaEntrada"])
        fechaSalida <-  (map["fechaSalida"])
        vehiculo <-     map["vehiculo"]
        
    }
}
