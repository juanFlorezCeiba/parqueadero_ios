//
//  RegisterCreateProtocols.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/4/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterCreateViewProtocol: class {
    var presenter: RegisterCreatePresenterProtocol? {get set}
    
    func showResponse()

}

protocol RegisterCreatePresenterProtocol: class {
    
    var view: RegisterCreateViewProtocol? {get set}
    var interactor: RegisterCreateInteractorInputProtocol? {get set}
    var wireframe: RegisterCreateWireframeProtocol? {get set}
    
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String)

    func comeBackView()
}

protocol RegisterCreateInteractorInputProtocol: class {
    var presenter: RegisterCreateInteractorOutputProtocol? {get set}
    var remoteDataManager: RegisterCreateRemoteDataManagerInputProtocol? {get set}
    
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String)
}

protocol RegisterCreateInteractorOutputProtocol: class {
    
    func createdRegisterResponse()
}


protocol RegisterCreateRemoteDataManagerInputProtocol: class {
    
    var remoteRequestHandler: RegisterCreateRemoteDataManagerOutputProtocol? {get set}
    
    func createRegister(forRegistrationNumber registrationNumber: String, forDisplacement displacement: Int, forType type: String)
    
}

protocol RegisterCreateRemoteDataManagerOutputProtocol: class {
    
    func createdRegisterResponse()
}

protocol RegisterCreateWireframeProtocol: class {
    
    //Función donde se conectan todos los modulos.
    static  func createRegisterCreateModule() -> UIViewController
    
    func comeBackView(from view: RegisterCreateViewProtocol)

}
