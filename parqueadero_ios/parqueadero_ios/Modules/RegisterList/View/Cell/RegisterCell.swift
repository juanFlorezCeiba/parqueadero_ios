//
//  RegisterCell.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import UIKit

class RegisterCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var registrationNumberLabel: UILabel!
    
    
    //Función para mapear un objeto en la celda.
    func set(forRegister register: Registro) {
        idLabel.text = "\(String(describing: register.id!))"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd hh:mm"
        let dateFechaEntrada = Date(timeIntervalSince1970: (TimeInterval(register.fechaEntrada! / 1000)))
        let fechaEntrada = dateFormatter.string(from: dateFechaEntrada)
        
        checkInDateLabel.text = "\(fechaEntrada)"
        
        if register.fechaSalida != nil {
            let dateFechaSalida = Date(timeIntervalSince1970: (TimeInterval(register.fechaSalida! / 1000)))
            let fechaSalida = dateFormatter.string(from: dateFechaSalida)
            checkOutDateLabel.text = "\(fechaSalida)"
        } else {
            checkOutDateLabel.text = "Aún esta parqueado."
        }
        registrationNumberLabel.text = register.vehiculo?.placa
        
    }
}
