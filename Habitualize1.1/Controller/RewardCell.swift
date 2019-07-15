//
//  RewardCell.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class RewardCell: UITableViewCell {
    
    var rewardTag = -1
    
    @IBOutlet weak var RewardTextLabel: UILabel!
    @IBOutlet weak var RewardCostLabel: UILabel!
    
    @IBAction func AcceptReward(_ sender: UIButton) {
        if (USER_DATA_MANAGER.getTotalRewardPoints() < Int(self.RewardCostLabel.text ?? "0") ?? 0) {
            self.showAcceptError()
        }
        else {
            let infoMessage = "Accept this reward?"
            let alert = UIAlertController(title: infoMessage, message: "", preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: "Accept", style: .default) { (action) in
                USER_DATA_MANAGER.subtractRewardPoints(points: Int(self.RewardCostLabel.text ?? "0") ?? 0)
                REWARDS_DATA_MANAGER.deleteRewardAtIndex(index: self.rewardTag)
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
    
    func setRewardText(text: String) {
        self.RewardTextLabel.text = text
    }
    
    func setRewardCost(cost: Int) {
        self.RewardCostLabel.text = String(cost)
    }
    
    func setRewardTag(tag: Int) {
        self.rewardTag = tag
    }
    
    func showAcceptError() {
        let infoMessage = "You do not have enough points yet to accept this reward. Keep going!"
        let alert = UIAlertController(title: infoMessage, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
