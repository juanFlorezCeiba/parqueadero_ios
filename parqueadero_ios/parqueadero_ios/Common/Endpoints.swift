//
//  Endpoints.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 1/31/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl: String = "http://localhost:8081/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum ApiParqueadero: Endpoint {
        case home
        case crearRegistroMoto
        case crearRegistroCarro
        case salidaMoto
        case salidaCarro
        case consultarMoto
        case consultarCarro
        case obtenerTodosVehiculos
        case obtenerTotalTarifa
        case pagarTarifa
        
        //No se utiliza por la estructura de la API.
        public var path: String {
            switch self {
            case .home: return "vigilante/"
            case .crearRegistroMoto: return "vigilante/moto/crear-registro"
            case .crearRegistroCarro: return "vigilante/carro/crear-registro"
            case .salidaMoto: return "vigilante/moto/salida"
            case .salidaCarro: return "vigilante/moto/salida"
            case .consultarMoto: return "vigilante/moto/consultar"
            case .consultarCarro: return "vigilante/carro/consultar"
            case .obtenerTodosVehiculos: return "vigilante/obtener"
            case .obtenerTotalTarifa: return "vigilante/obtener-total"
            case .pagarTarifa: return "vigilante/pagar"
                
            }
        }
        
        public var url: String {
            switch self {
            case .home: return "\(API.baseUrl)\(path)"
            case .crearRegistroMoto: return "\(API.baseUrl)\(path)"
            case .crearRegistroCarro: return "\(API.baseUrl)\(path)"
            case .salidaMoto: return "\(API.baseUrl)\(path)/"
            case .salidaCarro: return "\(API.baseUrl)\(path)/"
            case .consultarMoto: return "\(API.baseUrl)\(path)/"
            case .consultarCarro: return "\(API.baseUrl)\(path)/"
            case .obtenerTodosVehiculos: return "\(API.baseUrl)\(path)"
            case .obtenerTotalTarifa: return "\(API.baseUrl)\(path)"
            case .pagarTarifa: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
