//
//  RewardsTableViewController.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class RewardsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return REWARDS_DATA_MANAGER.getAllRewards().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardItemCell", for: indexPath) as! RewardCell
        cell.setRewardText(text: REWARDS_DATA_MANAGER.getRewardAtIndex(index: indexPath.row).getRewardText())
        cell.setRewardCost(cost: REWARDS_DATA_MANAGER.getRewardAtIndex(index: indexPath.row).getPointCost())
        cell.setRewardTag(tag: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rewardEditView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditTableView") as! EditTableViewController
        let reward = REWARDS_DATA_MANAGER.getRewardAtIndex(index: indexPath.row)
        rewardEditView.addEditable(label: "Reward", text: reward.getRewardText())
        rewardEditView.addEditable(label: "Cost", text: String(reward.getPointCost()))
        rewardEditView.setType(type: "Reward")
        rewardEditView.seteditRowTag(tag: indexPath.row)
        self.navigationController?.pushViewController(rewardEditView, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            REWARDS_DATA_MANAGER.deleteRewardAtIndex(index: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    
}
