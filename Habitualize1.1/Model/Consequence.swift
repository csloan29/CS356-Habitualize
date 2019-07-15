//
//  Consequence.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/26/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

class Consequence {
    
    let DEFAULT_COST = 5
    var consequenceText : String
    var pointCost : Int
    
    init(text: String,cost: Int) {
        self.consequenceText = text
        self.pointCost = cost
    }
    
    func getDefaultCost() -> Int {
        return DEFAULT_COST
    }
    
    func getConsequenceText() -> String {
        return self.consequenceText
    }
    
    func getPointCost() -> Int {
        return self.pointCost
    }
    
    func setConsequenceText(text: String) {
        self.consequenceText = text
    }
    
    func setPointCost(cost: Int) {
        self.pointCost = cost
    }
}
