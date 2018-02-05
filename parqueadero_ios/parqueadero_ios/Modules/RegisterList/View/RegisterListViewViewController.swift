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
  
    //SearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredRegisters = [Registro]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Escriba la placa"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //Solicita al presentador que cargue la vista.
        presenter?.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: - UISearch Methods
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredRegisters = registerList.filter({( register : Registro) -> Bool in
            return (register.vehiculo?.placa?.lowercased().contains(searchText.lowercased()))!
           // return candy.name.lowercased().contains(searchText.lowercased())
        })
        
        registerTableView.reloadData()
    }
    
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        presenter?.addRegister()
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
       
        if isFiltering() {
            return filteredRegisters.count
        }
        return self.registerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = registerTableView.dequeueReusableCell(withIdentifier: "RegisterCell", for: indexPath) as! RegisterCell
        
        var register: Registro
        if isFiltering() {
            register = filteredRegisters[indexPath.row]
        } else {
            register = registerList[indexPath.row]

        }
        
        cell.set(forRegister: register)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var register: Registro
            
        if isFiltering() {
            register = filteredRegisters[indexPath.row]
        } else {
            register = registerList[indexPath.row]
        }
        
        presenter?.showRegisterDetail(forRegister: register)
    }
}

extension RegisterListView: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

