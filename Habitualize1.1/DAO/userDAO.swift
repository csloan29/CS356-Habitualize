//
//  userDAO.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

let USER_DATA_MANAGER = UserDAO()

class UserDAO {
    let DEFAULT_POINTS = 0
    var rewardPoints: Int?
    var consequencePoints: Int?
    
    init() {
        //TODO: READ FROM LOCAL SQLITE DATABASE IF THERE IS ONE
        self.rewardPoints = 0
        self.consequencePoints = 0
    }
    
    func getTotalConsequencePoints() -> Int {
        return self.consequencePoints ?? self.DEFAULT_POINTS
    }
    
    func getTotalRewardPoints() -> Int {
        return self.rewardPoints ?? self.DEFAULT_POINTS
    }
    
    func updateRewardPoints(points: Int) {
        self.rewardPoints = self.rewardPoints ?? self.DEFAULT_POINTS + points
        if self.rewardPoints ?? self.DEFAULT_POINTS < 0 {
            self.rewardPoints = self.DEFAULT_POINTS
        }
    }
    
    func subtractRewardPoints(points: Int) {
        self.rewardPoints! -= points
    }
    
    func incrementRewardPoints() {
        self.rewardPoints! += 1
    }
    
    func updateConsequencePoints(points: Int) {
        self.consequencePoints = self.consequencePoints ?? self.DEFAULT_POINTS + points
        if self.consequencePoints ?? self.DEFAULT_POINTS < 0 {
            self.consequencePoints = self.DEFAULT_POINTS
        }
    }
    
    func subtractConsequcnePoints(points: Int) {
        self.consequencePoints! -= points
    }
    
    func incrementConsequencePoints() {
        self.consequencePoints! += 1
    }
    
    func saveData() {
        //TODO: SAVE TO LOCAL DATABASE IF THERE IS ONE
    }
}
