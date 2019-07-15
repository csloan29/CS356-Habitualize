//
//  habitListViewController.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/25/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class HabitTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    //-----------------------------------------------
    //MARK - TABLEVIEW DATASOURCE METHODS
    //-----------------------------------------------
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HABITS_DATA_MANAGER.getAllHabits().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitItemCell", for: indexPath) as! HabitCell
        let habit = HABITS_DATA_MANAGER.getHabitAtIndex(index: indexPath.row)
        cell.setHabitLabel(text: habit.getHabitText())
        cell.setPosPoints(points: habit.getPosPoints())
        cell.setNegPoints(points: habit.getNegPoints())
        cell.setHabitTag(tag: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            HABITS_DATA_MANAGER.deleteHabitAtIndex(index: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    //-----------------------------------------------
    //MARK - TRANSITION TO HABIT EDIT VIEW
    //-----------------------------------------------
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let habitEditView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditTableView") as! EditTableViewController
        let habit = HABITS_DATA_MANAGER.getHabitAtIndex(index: indexPath.row)
        habitEditView.addEditable(label: "Habit", text: habit.getHabitText())
        habitEditView.addEditable(label: "Positive", text: String(habit.getPosPoints()))
        habitEditView.addEditable(label: "Negative", text: String(habit.getNegPoints()))
        habitEditView.setType(type: "Habit")
        habitEditView.seteditRowTag(tag: indexPath.row)
        self.navigationController?.pushViewController(habitEditView, animated: true)
    }
    
    //-----------------------------------------------
    //MARK - TRANSITION TO POINT BANK VIEW
    //-----------------------------------------------
    @IBAction func GoToPointBankPage(_ sender: UIBarButtonItem) {
        //TODO: Safe Push the pointbank view onto the navigation controller
        let pointBankView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PointBankView") as! PointBankViewController
        self.navigationController?.pushViewController(pointBankView, animated: true)
    }
    
    //-----------------------------------------------
    //MARK - ADD NEW HABIT TO HABIT LIST
    //-----------------------------------------------
    @IBAction func addNewHabit(_ sender: UIBarButtonItem) {
        
        var habitTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new Habit", message: "", preferredStyle: .alert)
        let addHabitAction = UIAlertAction(title: "Add Habit", style: .default) { (action) in
            HABITS_DATA_MANAGER.addNewHabit(text: habitTextField.text ?? "New Habit")
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new habit here..."
            habitTextField = alertTextField
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addHabitAction)
        present(alert, animated: true, completion: nil)
        
    }
    
}
