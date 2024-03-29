//
//  ViewController.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import UIKit

class PeopleListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getPeople()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let personDetailVC = segue.destination as? PersonDetailVC {
            personDetailVC.person = people[selectedIndex!]
        }
    }
    
    
    func getPeople() {
        NetworkService.instance.getPeople(onSuccess: { (people) in
            self.people = people
            self.tableView.reloadData()
        }) { (error) in
             debugPrint(error)
        }
    }

}

extension PeopleListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as? TitleCell else { return UITableViewCell() }
        cell.configureCell(title: people[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "toPersonDetailVC", sender: self)
    }
    
}
