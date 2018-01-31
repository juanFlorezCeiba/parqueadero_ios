//
//  Vehiculo.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 1/31/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct Vehiculo {
    
    var placa: String?
    var cilindraje: Int?
}

extension Vehiculo: Mappable {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        placa <-   map["placa"]
        cilindraje <- map["cilindraje"]
        
    }
}
