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
    
    
    func set(forRegister register: Registro) {
        self.selectionStyle = .none
        idLabel.text = "\(String(describing: register.id!))"
        checkInDateLabel.text = "\(register.fechaEntrada!)"
        checkOutDateLabel.text = "\(register.fechaSalida)"
        registrationNumberLabel.text = register.vehiculo?.placa
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
