//
//  ProfileViewController.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/25/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class PointBankViewController: UIViewController {
    
    let DEFAULT_REWARD_TEXT = "New Reward"
    let DEFAULT_CONSEQUENCE_TEXT = "New Consequence"
    let DEFAULT_COST = 5
    let DEFAULT_COST_STRING = "5"
    
    var rewardsTableViewController = UITableViewController()
    var consequencesTableViewController = UITableViewController()
        
    @IBOutlet weak var RewardPointLabel: UILabel!
    @IBOutlet weak var ConsequencePointLabel: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPointLabels()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(PointBankViewController.setPointLabels), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
            
        case let rewardTable as RewardsTableViewController:
            self.rewardsTableViewController = rewardTable
        
        case let consequenceTable as ConsequencesTableViewController:
            self.consequencesTableViewController = consequenceTable
        
        default:
            break
        }
    }
    
    @IBAction func addNewReward(_ sender: UIButton) {
        var rewardTextField = UITextField()
        var costTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new Reward", message: "", preferredStyle: .alert)
        let addRewardAction = UIAlertAction(title: "Add", style: .default) { (action) in
            REWARDS_DATA_MANAGER.addNewReward(text: rewardTextField.text ?? self.DEFAULT_REWARD_TEXT, cost: Int(costTextField.text ?? self.DEFAULT_COST_STRING) ?? self.DEFAULT_COST)
                self.rewardsTableViewController.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new reward here..."
            rewardTextField = alertTextField
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add reward cost here..."
            costTextField = alertTextField
            alertTextField.keyboardType = UIKeyboardType.decimalPad
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addRewardAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addNewConsequence(_ sender: UIButton) {
        
        var consequenceTextField = UITextField()
        var costTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new Consequence", message: "", preferredStyle: .alert)
        let addConsequenceAction = UIAlertAction(title: "Add", style: .default) { (action) in
            CONSEQUENCES_DATA_MANAGER.addNewConsequence(text: consequenceTextField.text ?? self.DEFAULT_CONSEQUENCE_TEXT, cost: Int(costTextField.text ?? self.DEFAULT_COST_STRING) ?? self.DEFAULT_COST)
                self.consequencesTableViewController.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new consequence here..."
            consequenceTextField = alertTextField
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add consequence cost here..."
            costTextField = alertTextField
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addConsequenceAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func setPointLabels() {
        self.RewardPointLabel.text = String(USER_DATA_MANAGER.getTotalRewardPoints())
        self.ConsequencePointLabel.text = String(USER_DATA_MANAGER.getTotalConsequencePoints())
    }
}
