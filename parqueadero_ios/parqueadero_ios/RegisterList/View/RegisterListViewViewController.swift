//
//  RegisterListViewViewController.swift
//  parqueadero_ios
//
//  Created by Juan Sebastián Flórez Saavedra - Ceiba Software on 2/1/18.
//  Copyright © 2018 Juan Sebastián Flórez Saavedra - Ceiba Software. All rights reserved.
//

import UIKit
import PKHUD

class RegisterListView: UIViewController {

    //View variables
    @IBOutlet weak var registerTableView: UITableView!
    
    //Module variables
    var presenter: RegisterListPresenterProtocol?
    
    //Other variables
    var registerList: [Registro] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Solicita al presentador que cargue la vista.
        presenter?.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


//MARK: - RegisterListViewProtocol

extension RegisterListView: RegisterListViewProtocol{
    
    //Función para mostrar los registros.
    func showRegister(with registers: [Registro]) {
       self.registerList = registers
        registerTableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    
}


//MARK: - TableViewDataSource and TableViewDelegate

extension RegisterListView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.registerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = registerTableView.dequeueReusableCell(withIdentifier: "RegisterCell", for: indexPath) as! RegisterCell
        
        let register = registerList[indexPath.row]
        
        cell.set(forRegister: register)
        return cell
    }
}
