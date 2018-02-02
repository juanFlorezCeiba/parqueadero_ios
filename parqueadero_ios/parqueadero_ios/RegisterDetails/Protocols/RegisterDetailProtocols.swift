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
    
    func showRegisterDetail(forRegister register: Registro)
    
}
protocol RegisterDetailPresenterProtocol: class {
    
    var view: RegisterDetailViewProtocol? { get set }
    var wireframe: RegisterDetailWireframeProtocol? { get set }
    var register: Registro? { get set }
    
    func viewDidLoad()

}

protocol RegisterDetailWireframeProtocol: class {
    static func createRegisterDetailModule(forRegister register: Registro) -> UIViewController
}
