//
//  ConsequencesTableViewController.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class ConsequencesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CONSEQUENCES_DATA_MANAGER.getAllConsequences().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsequenceItemCell", for: indexPath) as! ConsequenceCell
        cell.setConsequenceText(text: CONSEQUENCES_DATA_MANAGER.getConsequenceAtIndex(index: indexPath.row).getConsequenceText())
        cell.setConsequenceCost(cost: CONSEQUENCES_DATA_MANAGER.getConsequenceAtIndex(index: indexPath.row).getPointCost())
        cell.setConsequenceTag(tag: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let consequenceEditView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditTableView") as! EditTableViewController
        let consequence = CONSEQUENCES_DATA_MANAGER.getConsequenceAtIndex(index: indexPath.row)
        consequenceEditView.addEditable(label: "Consequence", text: consequence.getConsequenceText())
        consequenceEditView.addEditable(label: "Cost", text: String(consequence.getPointCost()))
        consequenceEditView.setType(type: "Consequence")
        consequenceEditView.seteditRowTag(tag: indexPath.row)
        self.navigationController?.pushViewController(consequenceEditView, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            CONSEQUENCES_DATA_MANAGER.deleteConsequenceAtIndex(index: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
}
