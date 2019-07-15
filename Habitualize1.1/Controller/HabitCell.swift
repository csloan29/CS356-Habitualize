//
//  HabitCell.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class HabitCell: UITableViewCell {
    
    var habitTag = -1
    
    @IBOutlet weak var HabitTextLabel: UILabel!
    @IBOutlet weak var PosPointsLabel: UILabel!
    @IBOutlet weak var NegPointsLabel: UILabel!
    
    @IBAction func AddConsequencePointsForHabit(_ sender: UIButton) {
        USER_DATA_MANAGER.incrementConsequencePoints()
        HABITS_DATA_MANAGER.incrementHabitNegativePointsAtIndex(index: self.habitTag)
        let tableView = self.superview as! UITableView
        tableView.reloadData()
        var habits = HABITS_DATA_MANAGER.getAllHabits()
    }
    
    @IBAction func AddRewardPointsForHabit(_ sender: UIButton) {
        USER_DATA_MANAGER.incrementRewardPoints()
        HABITS_DATA_MANAGER.incrementHabitPositivePointsAtIndex(index: self.habitTag)
        let tableView = self.superview as! UITableView
        tableView.reloadData()
    }
    
    func setHabitLabel(text: String) {
        self.HabitTextLabel.text = text
    }
    
    func setPosPoints(points: Int) {
        self.PosPointsLabel.text = String(points)
    }
    
    func setNegPoints(points: Int) {
        self.NegPointsLabel.text = String(points)
    }
    
    func setHabitTag(tag: Int) {
        self.habitTag = tag
    }
}
