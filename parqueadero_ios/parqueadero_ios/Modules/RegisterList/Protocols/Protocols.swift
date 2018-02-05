//
//  Protocols.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterListViewProtocol: class {
    
    var presenter: RegisterListPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
    
    func showRegister(with register: [Registro])
    func showError()
    func showLoading()
    func hideLoading()
    
}

protocol RegisterListPresenterProtocol: class {
    
    var view: RegisterListViewProtocol? { get set }
    var wireframe: RegisterListWireframeProtocol? { get set }
    var interactor: RegisterListInteractorInputProtocol? { get set }
    
    //VIEW -> PRESENTER
    func viewDidLoad()
    func showRegisterDetail(forRegister register: Registro)
    func addRegister()
    
}

protocol RegisterListInteractorInputProtocol: class {
    
    var presenter: RegisterListInteractorOutputProtocol? { get set }
    var remoteDataManager: RegisterListRemoteDataManagerInputProtocol? { get set }
    
    //PRESENTER -> INTERACTOR
    func retrieveRegisterList()
}

protocol RegisterListInteractorOutputProtocol: class {
 
    //INTERACTOR -> PRESENTER
    func didRetrieveRegisters(_ registers: [Registro])
    func onError()
}

protocol RegisterListWireframeProtocol: class {
    
    //Función donde se conectan todos los modulos.
    static  func createRegisterListModule() -> UIViewController
    
    //PRESENTER -> WIREFRAME
    func presenterRegisterDetailScreen(from view: RegisterListViewProtocol, forRegister register: Registro)
    
    func presenterRegisterCreateScreen(from view: RegisterListViewProtocol)
    
}

protocol RegisterListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: RegisterListRemoteDataManagerOutputProtocol? {get set}
    
    //INTERACTOR -> REMOTEDATAMANAGER
    func retrieveRegisterList()
}

protocol RegisterListRemoteDataManagerOutputProtocol: class {
    
    //REMOTEDATAMANAGER -> INTERACTOR
    func onRegistersRetrieved(_ registers: [Registro])
    func onError()
    
}
