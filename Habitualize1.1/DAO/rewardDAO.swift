//
//  rewardDAO.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

let REWARDS_DATA_MANAGER = RewardDAO()

class RewardDAO {
    
    var rewards: [Reward] = []
    
    init() {
        //Create dummy rewards
        let reward1 = Reward(text: "Go get ice cream for the every meal!", cost: 5)
        rewards.append(reward1)
        let reward2 = Reward(text: "Play game for 1 hour", cost: 10)
        rewards.append(reward2)
    }
    
    func addNewReward(text: String, cost: Int) {
        let reward = Reward(text: text, cost: cost)
        self.rewards.append(reward)
    }
    
    func getAllRewards() -> [Reward] {
        return self.rewards
    }
    
    func getRewardAtIndex(index: Int) -> Reward {
        return self.rewards[index]
    }
    
    func updateRewardTextAtIndex(index: Int, text: String) {
        self.rewards[index].setRewardText(text: text)
    }
    
    func updateRewardCostAtIndex(index: Int, cost: Int) {
        self.rewards[index].setPointCost(cost: cost)
    }
    
    func deleteRewardAtIndex(index: Int) {
        self.rewards.remove(at: index)
    }
}
