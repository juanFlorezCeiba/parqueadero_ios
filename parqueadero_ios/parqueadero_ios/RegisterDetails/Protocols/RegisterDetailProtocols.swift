//
//  RegisterDetailProtocols.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterDetailViewProtocol: class {
   
    var presenter: RegisterDetailPresenterProtocol? { get set }
    var rate: Int? {get set}
    
    func showRegisterDetail(forRegister register: Registro)
    
    func getRegisterRate(forRate rate: Int)
    
    func paidConfirmation(forId id: Int)
    
}
protocol RegisterDetailPresenterProtocol: class {
    
    var view: RegisterDetailViewProtocol? { get set }
    var wireframe: RegisterDetailWireframeProtocol? { get set }
    var interactor: RegisterDetailInteractorInputProtocol? {get set}
    
    var register: Registro? { get set }
    var rate: Int? {get set}
    
    func viewDidLoad()

    func retrieveRegisterRate(forId id: Int)
    
    func paidConfirmation(forId id: Int)
}

protocol RegisterDetailWireframeProtocol: class {
    static func createRegisterDetailModule(forRegister register: Registro) -> UIViewController
}

protocol RegisterDetailInteractorInputProtocol: class {
    
    var presenter: RegisterDetailInteractorOutputProtocol? {get set}
    var remoteDataManager: RegisterDetailRemoteDataManagerInputProtocol? {get set}
        
    func retrieveRegisterRate(forId id: Int)
    
    func paidConfirmation(forId id: Int)
    
    
}

protocol RegisterDetailInteractorOutputProtocol: class {
    
    func didRetrieveRegisterRate(rate: Int)
    func onError()
}

protocol RegisterDetailRemoteDataManagerInputProtocol: class {
 
    var remoteRequestHandler: RegisterDetailRemoteDataManagerOutputProtocol? {get set}
    
    func retrieveRegisterRate(forId id: Int)
    func paidConfirmation(forId id: Int)
}


protocol RegisterDetailRemoteDataManagerOutputProtocol: class {
    
    func onRetrievedRegisterRate(rate: Int)
}
