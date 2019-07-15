//
//  consequenceDAO.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

let CONSEQUENCES_DATA_MANAGER = ConsequenceDAO()

class ConsequenceDAO {
    
    var consequences: [Consequence] = []
    
    init() {
        //Create dummy consequences
        let consequence1 = Consequence(text: "Throw out all junk food in house", cost: 20)
        consequences.append(consequence1)
        let consequence2 = Consequence(text: "Ban yourself from computer for the weekend", cost: 30)
        consequences.append(consequence2)
    }
    
    func addNewConsequence(text: String, cost: Int) {
        let consequence = Consequence(text: text, cost: cost)
        self.consequences.append(consequence)
    }
    
    func getAllConsequences() -> [Consequence] {
        return self.consequences
    }
    
    func getConsequenceAtIndex(index: Int) -> Consequence {
        return self.consequences[index]
    }
    
    func updateConsequenceTextAtIndex(index: Int, text: String) {
        self.consequences[index].setConsequenceText(text: text)
    }
    
    func updateConsequenceCostAtIndex(index: Int, cost: Int) {
        self.consequences[index].setPointCost(cost: cost)
    }
    
    func deleteConsequenceAtIndex(index: Int) {
        self.consequences.remove(at: index)
    }
}
