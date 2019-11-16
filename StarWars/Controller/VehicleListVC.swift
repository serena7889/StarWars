//
//  VehicleListVC.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import UIKit

class VehicleListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var vehicles = [Vehicle]()
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getVehicles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vehicleDetailVC = segue.destination as? VehicleDetailVC {
            vehicleDetailVC.vehicle = vehicles[selectedIndex!]
        }
    }
    
    
    func getVehicles() {
        NetworkService.instance.getVehicles(onSuccess: { (vehicles) in
            self.vehicles = vehicles
            self.tableView.reloadData()
        }) { (error) in
             debugPrint(error)
        }
    }

}

extension VehicleListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as? TitleCell else { return UITableViewCell() }
        cell.configureCell(title: vehicles[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "toVehicleDetailVC", sender: self)
    }

}
