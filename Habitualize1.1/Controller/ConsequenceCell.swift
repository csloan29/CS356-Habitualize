//
//  ConsequenceCell.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class ConsequenceCell: UITableViewCell {
    
    var consequenceTag = -1
    
    @IBOutlet weak var ConsequenceTextLabel: UILabel!
    @IBOutlet weak var ConsequenceCostLabel: UILabel!
    
    @IBAction func AcceptConsequence(_ sender: UIButton) {
        
        if (USER_DATA_MANAGER.getTotalConsequencePoints() < Int(self.ConsequenceCostLabel.text ?? "0") ?? 0) {
            self.showAcceptError()
        }
        else {
            let infoMessage = "Accept this consequence?"
            let alert = UIAlertController(title: infoMessage, message: "", preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: "Accept", style: .default) { (action) in
                USER_DATA_MANAGER.subtractConsequcnePoints(points: Int(self.ConsequenceCostLabel.text ?? "0") ?? 0)
                CONSEQUENCES_DATA_MANAGER.deleteConsequenceAtIndex(index: self.consequenceTag)
                let tableView = self.superview as! UITableView
                tableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(acceptAction)
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func setConsequenceText(text: String) {
        self.ConsequenceTextLabel.text = text
    }
    
    func setConsequenceCost(cost: Int) {
        self.ConsequenceCostLabel.text = String(cost)
    }
    
    func setConsequenceTag(tag: Int) {
        self.consequenceTag = tag
    }
    
    func showAcceptError() {
        let infoMessage = "You do not have enough points yet to accept this consequence. Keep up the good work!"
        let alert = UIAlertController(title: infoMessage, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
