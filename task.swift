//
//  task.swift
//  TaskAssigner_v1
//
//  Created by Amani Anderson on 2025-03-06.
//

import Foundation
import Cocoa

class Task {
    private var name: String
    private var importance: Int
    private var difficulty: Int
    private var interest: Int
    private var weight: Double

    init(name: String, importance: Int, difficulty: Int, interest: Int) {
        self.name = name
        self.importance = importance
        self.difficulty = difficulty
        self.interest = interest
        self.weight = 0.0
    }

    // Getter and Setter for name
    func getName() -> String {
        return name
    }

    func setName(_ name: String) {
        self.name = name
    }

    // Getter and Setter for importance
    func getImportance() -> Int {
        return importance
    }

    func setImportance(_ importance: Int) {
        self.importance = importance
    }

    // Getter and Setter for difficulty
    func getDifficulty() -> Int {
        return difficulty
    }

    func setDifficulty(_ difficulty: Int) {
        self.difficulty = difficulty
    }

    // Getter and Setter for interest
    func getInterest() -> Int {
        return interest
    }

    func setInterest(_ interest: Int) {
        self.interest = interest
    }

    // Getter and Setter for weight
    func getWeight() -> Double {
        return weight
    }

    func setWeight(_ weight: Double) {
        self.weight = weight
    }
}

