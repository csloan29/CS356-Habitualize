//
//  Reward.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/25/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

class Reward {
    
    var rewardText : String
    var pointCost : Int
    
    init(text: String,cost: Int) {
        self.rewardText = text
        self.pointCost = cost
    }
        
    func getRewardText() -> String {
        return self.rewardText
    }
    
    func getPointCost() -> Int {
        return self.pointCost
    }
    
    func setRewardText(text: String) {
        self.rewardText = text
    }
    
    func setPointCost(cost: Int) {
        self.pointCost = cost
    }
    
}
