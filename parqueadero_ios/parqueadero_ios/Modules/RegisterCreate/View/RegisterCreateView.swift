//
//  RegisterCreateView.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/4/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import UIKit
import PKHUD

class RegisterCreateView: UIViewController {

    @IBOutlet weak var registrationNumberText: UITextField!
    @IBOutlet weak var displacementText: UITextField!
    @IBOutlet weak var type: UISegmentedControl!
    
    var presenter: RegisterCreatePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
     Boton que crear un nuevo registro.
     */
    @IBAction func registerButton(_ sender: UIButton) {
        
        let registrationNumber: String = registrationNumberText.text!
        let displacement: Int = Int(displacementText.text!)!
        
        let vehicleType: String?
        switch type.selectedSegmentIndex {
        case 0:
            vehicleType = "Carro"
        case 1:
            vehicleType = "Moto"
        default:
            vehicleType = ""
        }
        
        presenter?.createRegister(forRegistrationNumber: registrationNumber, forDisplacement: displacement, forType: vehicleType! )
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegisterCreateView: RegisterCreateViewProtocol {
   
    /*
     Función que muestra un error al usuario.
     */
    func showError(forError error: String) {
        HUD.flash(.label(error), delay: 2.5)
    }
    
    /*
     Función que le indica al usuario que el registro ha sido exitoso.
     */
    func showResponse() {
        HUD.flash(.label("El registro ha sido creado."), delay: 2.5)
        presenter?.comeBackView()
    }
    
    
}
