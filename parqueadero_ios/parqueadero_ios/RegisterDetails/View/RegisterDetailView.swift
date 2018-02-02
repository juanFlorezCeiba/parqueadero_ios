//
//  RegisterDetailView.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/2/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import UIKit

class RegisterDetailView: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var registrationNumberLabel: UILabel!
   
    @IBOutlet weak var displacementLabel: UILabel!
    
    
    var presenter: RegisterDetailPresenterProtocol?
    var rate: Int?
    var register: Registro?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func payParking(_ sender: UIButton) {
        
        presenter?.retrieveRegisterRate(forId: (self.register?.id)!)
    }
    
}

extension RegisterDetailView: RegisterDetailViewProtocol{ 
    
    func showRegisterDetail(forRegister register: Registro) {
        
        self.register = register
        
        idLabel.text = "\(self.register?.id!)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd hh:mm"
        let dateFechaEntrada = Date(timeIntervalSince1970: (TimeInterval((self.register?.fechaEntrada!)! / 1000)))
        let fechaEntrada = dateFormatter.string(from: dateFechaEntrada)

        checkInDateLabel.text = "\(fechaEntrada)"
        checkOutDateLabel.text = "Aún esta parqueado."
        
        if self.register?.fechaSalida != nil {
            let dateFechaSalida = Date(timeIntervalSince1970: (TimeInterval((self.register?.fechaSalida!)! / 1000)))
            let fechaSalida = dateFormatter.string(from: dateFechaSalida)
            
            checkOutDateLabel.text = "\(fechaSalida)"
            
        }
        registrationNumberLabel.text = self.register?.vehiculo?.placa
        displacementLabel.text = "\((self.register?.vehiculo?.cilindraje)!)"
        
        
    }
    
    
}
