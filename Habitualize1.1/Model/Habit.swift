//
//  Habit.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/25/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

class Habit {
    
    var habitText : String
    var habitPosPoints : Int
    var habitNegPoints : Int
    
    init(text: String) {
        self.habitText = text
        self.habitPosPoints = 0
        self.habitNegPoints = 0
    }
    
    func getHabitText() -> String {
        return self.habitText
    }
    
    func getPosPoints() -> Int {
        return self.habitPosPoints
    }
    
    func getNegPoints() -> Int {
        return self.habitNegPoints
    }
    
    func setHabitText(text: String) {
        self.habitText = text
    }
    
    func setPosPoints(points: Int) {
        self.habitPosPoints = points
    }
    
    func setNegPoints(points: Int) {
        self.habitNegPoints = points
    }
    
    func posPointIncrement() {
        self.habitPosPoints += 1
    }
    
    func negPointIncrement() {
        self.habitPosPoints += 1
    }
}
