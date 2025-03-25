//
//  taskAssigner.swift
//  TaskAssigner_v1
//
//  Created by Amani Anderson on 2025-03-06.
//

import Foundation
import Cocoa


class TaskAssigner {
   // private var rand: Random
    private var tasks: [Task]

    init() {
       // rand = Random()
        tasks = []
    }

    func addTask(_ task: Task) -> Bool {
        if !taskNameTaken(task.getName()) {
            tasks.append(task)
           
            print(task.getName())
            return true
            
        }
        
        return false
        
    }

    func taskNameTaken(_ taskName: String) -> Bool {
        for task in tasks {
            if task.getName().lowercased() == taskName.lowercased() {
                return true
            }
        }
        return false
    }

    func deleteTask(withName taskName: String) -> Bool {
        let intiialCount = tasks.count
        tasks.removeAll { $0.getName() == taskName }
        return tasks.count < intiialCount
        
    }

    func getTasks() -> [Task] {
        return tasks
    }

    func getRandomTask() -> Task? {
        guard !tasks.isEmpty else { return nil }
        let randomIndex = Int.random(in: 0..<tasks.count)
        return tasks[randomIndex]
    }

    func calculateWeight(_ task: Task) -> Double {
        let importanceWeight = Double(task.getImportance()) * 0.45
        let difficultyWeight = Double(task.getDifficulty()) * 0.3
        let interestWeight = Double(task.getInterest()) * 0.25

        // Base weight calculation
        let baseWeight = (importanceWeight + difficultyWeight + interestWeight) * (100.0 / 3.0)

        // Add some randomness to the weight (+/- 5%)
        let randomFactor = (Double.random(in: 0..<1) * 0.1) - 0.05
        var finalWeight = baseWeight * (1 + randomFactor)

        // Ensure the weight is within the 0-100 range
        finalWeight = max(0, min(100, finalWeight))

        return Double(finalWeight)
    }

    func chooseWeightedTask() -> Task? {
        guard !tasks.isEmpty else { return nil }

        var highestWeightTask = tasks[0]
        var highestWeight = highestWeightTask.getWeight()

        for task in tasks {
            if task.getWeight() > highestWeight {
                highestWeightTask = task
                highestWeight = task.getWeight()
            }
        }

        return highestWeightTask
    }
}
