//
//  ReportListTableViewController.swift
//  FireDynamicsCalculator
//
//  Created by App Center on 1/21/18.
//  Copyright © 2018 Luke Davis Development. All rights reserved.
//

import UIKit

class ReportListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = UIColor.clear
        self.tableView.tableFooterView = view
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    let headers = ["Flashover",
                   "Heat Release Rate",
                   "Flame Height",
                   "t2 Fires",
                   "Radiation Pool",
                   "Conduction",
                   "Solid Ignition",
                   "Open Pipe",
                   "Gas Concentration",
                   "Gas Amount",
                   "Oxygen Levels",
                   "Self Heating",
                   "T Gas Layer"]
    let descriptions = ["Fire size required for flashover",
                        "Fire Size", "Predict flame height",
                        "Predict size of exponentially growing fire",
                        "Predict radiant flux from a pool fire",
                        "Predict conductive heat flux through a material",
                        "Predict ignition time",
                        "Predict gas flow rate through a leak in an open pipe",
                        "Predict gas concentration in a space due to a leak",
                        "Predict required amount of a gas needed to reach LEL/U",
                        "Predict the amount of oxygen consumed by a fire in a room",
                        "Predict critical pile size and temperature for spontaneous combustion",
                        "Predict the temperature of the upper gas layer in a compartment fire"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return headers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = headers[indexPath.row]
        cell.detailTextLabel?.text = descriptions[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch headers[indexPath.row] {
        case "Flashover":
           performSegue(withIdentifier: "flashover", sender: self)
        case "Heat Release Rate":
            performSegue(withIdentifier: "HRR", sender: self)
        case "Flame Height":
            performSegue(withIdentifier: "flameHeight", sender: self)
        case "t2 Fires":
            performSegue(withIdentifier: "t2Fire", sender: self)
        case "Radiation Pool":
            performSegue(withIdentifier: "radiationPool", sender: self)
        case "Conduction":
            performSegue(withIdentifier: "conduction", sender: self)
        case "Solid Ignition":
            performSegue(withIdentifier: "solidIgnition", sender: self)
        case "Open Pipe":
            performSegue(withIdentifier: "openPipe", sender: self)
        case "Gas Concentration":
            performSegue(withIdentifier: "gasConcentration", sender: self)
        case "Gas Amount":
            performSegue(withIdentifier: "gasAmount", sender: self)
        case "Oxygen Levels":
            performSegue(withIdentifier: "oxygenLevels", sender: self)
        case "Self Heating":
            performSegue(withIdentifier: "selfheating", sender: self)
        case "T Gas Layer":
            performSegue(withIdentifier: "tgaslayer", sender: self)
        default:
            print("Error")
        }
    }

}
