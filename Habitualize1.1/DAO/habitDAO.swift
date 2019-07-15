//
//  habitDAO.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import Foundation

let HABITS_DATA_MANAGER = HabitDAO()

class HabitDAO {
    
    var habits: [Habit] = []
    
    init() {
        var habit = Habit(text: "Practice Coding Interview Questions")
        habits.append(habit)
        habit = Habit(text: "Get to bed early, at least before 11pm")
        habits.append(habit)
        habit = Habit(text: "Be more proactive")
        habits.append(habit)
        habit = Habit(text: "Read the scriptures")
        habits.append(habit)
        habit = Habit(text: "Have a good conversation with someone you don't really know")
        habits.append(habit)
        habit = Habit(text: "Run and stretch in the morning")
        habits.append(habit)
        habit = Habit(text: "Eat homecooked meals")
        habits.append(habit)
        habit = Habit(text: "Save $$ every beginning of the month")
        habits.append(habit)
        habit = Habit(text: "Finish all homework at least a day before it's due")
        habits.append(habit)
        habit = Habit(text: "Do pushups before bed")
        habits.append(habit)
        habit = Habit(text: "Plan your days the night before")
        habits.append(habit)
    }
    
    func addNewHabit(text: String) {
        let habit = Habit(text: text)
        self.habits.append(habit)
    }
    
    func getAllHabits() -> [Habit] {
        return self.habits
    }
    
    func getHabitAtIndex(index: Int) -> Habit {
        return self.habits[index]
    }
    
    func updateHabitTextAtIndex(index: Int, text: String) {
        self.habits[index].setHabitText(text: text)
    }
    
    func incrementHabitPositivePointsAtIndex(index: Int) {
        self.habits[index].habitPosPoints += 1
    }
    
    func updateHabitPositivePointsAtIndex(index: Int, points: Int) {
        self.habits[index].setPosPoints(points: points)
    }
    
    func incrementHabitNegativePointsAtIndex(index: Int) {
        self.habits[index].habitNegPoints += 1
    }
    
    func updateHabitNegativePointsAtIndex(index: Int, points: Int) {
        self.habits[index].setNegPoints(points: points)
    }
    
    func deleteHabitAtIndex(index: Int) {
        self.habits.remove(at: index)
    }
}
