//
//  EditTableViewController.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
    
    var type = ""
    var editRowTag = -1
    var editables: [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(EditTableViewController.saveFields))
        self.navigationItem.rightBarButtonItem = saveButtonItem
    }
    
    //-----------------------------------------------
    //MARK - TABLEVIEW DATASOURCE METHODS
    //-----------------------------------------------
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editables.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as! EditCell
        cell.setLabel(label: editables[indexPath.row].0)
        cell.setText(index: indexPath.row, text: editables[indexPath.row].1)
        cell.setEditTag(tag: indexPath.row)
        return cell
    }
    
    //-----------------------------------------------
    //MARK - CELL PUBLIC SETTERS
    //-----------------------------------------------
    
    func setType(type: String) {
        self.type = type
    }
    
    func seteditRowTag(tag: Int) {
        self.editRowTag = tag
    }
    
    func addEditable(label: String, text: String) {
        editables.append((label, text))
    }
    
    @objc func saveFields() {
        if type == "Habit" {
            let cells = self.tableView.visibleCells as! Array<EditCell>
            for cell in cells {
                if (cell.getLabel() == "Habit") {
                    HABITS_DATA_MANAGER.updateHabitTextAtIndex(index: self.editRowTag, text: cell.getText())
                }
                else if (cell.getLabel() == "Positive") {
                    HABITS_DATA_MANAGER.updateHabitPositivePointsAtIndex(index: self.editRowTag, points: Int(cell.getText()) ?? 0)
                }
                else if (cell.getLabel() == "Negative") {
                    HABITS_DATA_MANAGER.updateHabitNegativePointsAtIndex(index: self.editRowTag, points: Int(cell.getText()) ?? 0)
                }
            }
        }
        else if type == "Reward" {
            let cells = self.tableView.visibleCells as! Array<EditCell>
            for cell in cells {
                if (cell.getLabel() == "Reward") {
                    REWARDS_DATA_MANAGER.updateRewardTextAtIndex(index: self.editRowTag, text: cell.getText())
                }
                else if (cell.getLabel() == "Cost") {
                    REWARDS_DATA_MANAGER.updateRewardCostAtIndex(index: self.editRowTag, cost: Int(cell.getText()) ?? 0)
                }
            }
        }
        else if type == "Consequence" {
            let cells = self.tableView.visibleCells as! Array<EditCell>
            for cell in cells {
                if (cell.getLabel() == "Consequence") {
                    CONSEQUENCES_DATA_MANAGER.updateConsequenceTextAtIndex(index: self.editRowTag, text: cell.getText())
                }
                else if (cell.getLabel() == "Cost") {
                    CONSEQUENCES_DATA_MANAGER.updateConsequenceCostAtIndex(index: self.editRowTag, cost: Int(cell.getText()) ?? 0)
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}
