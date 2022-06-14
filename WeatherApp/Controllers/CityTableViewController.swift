//
//  CityTableViewController.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 14.06.2022.
//

import UIKit

class CityTableViewController: UITableViewController {
    private let cities = CityManager.shared.cities

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = cities[indexPath.row].name
        content.image = UIImage(named: "city")

        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
        }
    }
}
