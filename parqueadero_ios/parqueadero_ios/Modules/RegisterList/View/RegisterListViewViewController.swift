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

    private let refreshControl = UIRefreshControl()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Se configura el searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Escribe la placa"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
        
        //Se añade el pull to refresh.
        refreshControl.addTarget(self, action: #selector(refreshRegisters(_:)), for: .valueChanged)
        registerTableView.addSubview(refreshControl)
        
        //Solicita al presentador que cargue la vista.
        presenter?.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    /*
     Función para refrescar los registros con el pull to refresh.
     */
    @objc private func refreshRegisters(_ sender: Any) {
        // Fetch Weather Data
        presenter?.viewDidLoad()
        registerTableView.reloadData()
        refreshControl.endRefreshing()
        
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
    
    /*
     Boton para añadir un nuevo registro.
     */
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


// MARK: - UISearchResultsUpdating Delegate

extension RegisterListView: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

