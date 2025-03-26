//
//  main.swift
//  TaskAssigner_v1
//
//  Created by Amani Anderson on 2025-03-06.
//

import Foundation

// Main code
func main() {
   
    let taskAssigner = TaskAssigner()
    
//    print("Do you wanna load up the task list? 1 - yes, 0 - no")
//    if let loadChoice = scanner.nextInt(), loadChoice == 1 {
//
//        if loadedTasks.isEmpty {
//            print("No tasks were loaded. Exiting the program.")
//            return
//        }
//        for task in loadedTasks {
//            taskAssigner.addTask(task)
//        }
//    }
    
    var choice: Int? = -1
    
    repeat {
        // Display menu
        print("\nMenu:")
        print("0. Quit")
        print("1. Add a task")
        print("2. List tasks")
        print("3. Choose a random task")
        print("4. Choose a task based on its weight")
        print("5. Delete a task")
        print("Enter your choice: ")
        
        if let inputChoice = readLine(), let inputChoice = Int(inputChoice), inputChoice < 5 && inputChoice >= 0 {
            choice = inputChoice
        }else{
            print("Error: Invalid input.")
            continue
        }
        
        
//        guard let userChoice = choice else {
//            print("Error: Invalid input.")
//            continue
//        }
        
        switch choice {
        case 0:
            // Asking the user if they want to save the tasks to a file
//            print("Do you want to save the current task list? 1 - yes, 0 - no: ")
//            if let saveChoice = scanner.nextInt(), saveChoice == 1 {
//                //TaskFileManager.saveTasksToFile(taskAssigner.getTasks(), "tasks.txt")
//            }
            print("Exiting.")
            break
            
        case 1:
            print("Enter task name: ")
            var taskName = readLine() ?? ""
            var importance = 0
            var difficulty = 0
            var interest = 0
            
            while taskAssigner.taskNameTaken(taskName) {
                print("Task name taken, re-enter")
                print("Enter task name: ")
                taskName = readLine() ?? ""
            }
            
            // Accept difficulty, importance, and interest values
            while importance < 1 || importance > 3 {
                print("Enter importance (1-3): ")
                if let input = readLine(), let value = Int(input), value >= 1 && value <= 3 {
                    importance = value
                } else {
                    print("Invalid input. Please enter a value between 1 and 3.")
                }
            }
            
            while difficulty < 1 || difficulty > 3 {
                print("Enter difficulty (1-3): ")
                if let input = readLine(), let value = Int(input), value >= 1 && value <= 3 {
                    difficulty = value
                } else {
                    print("Invalid input. Please enter a value between 1 and 3.")
                }
            }
            
            while interest < 1 || interest > 3 {
                print("Enter interest (1-3): ")
                if let input = readLine(), let value = Int(input), value >= 1 && value <= 3 {
                    interest = value
                } else {
                    print("Invalid input. Please enter a value between 1 and 3.")
                }
            }
            
            let newTask = Task(name: taskName, importance: importance, difficulty: difficulty, interest: interest)
            let weight = taskAssigner.calculateWeight(newTask)
            newTask.setWeight(weight)
            if taskAssigner.addTask(newTask) {
                print("Task '\(taskName)' added successfully!")
            }else {
                print("Task '\(taskName)' could not be added, idk why xD")
            }
            
            
        case 2:
            print("List of tasks:")
            for task in taskAssigner.getTasks() {
                print("\(task.getName()) (Weight: \(task.getWeight()))")
            }
            
        case 3:
            let availableTasks = taskAssigner.getTasks()
            if availableTasks.isEmpty {
                print("No tasks available.")
            } else {
                let randomTask = availableTasks[Int.random(in: 0..<availableTasks.count)]
                print("Randomly chosen task: \(randomTask.getName())")
            }
            
        case 4:
            let tasks = taskAssigner.getTasks()
            if tasks.isEmpty {
                print("No tasks available.")
            } else {
                if let chosenTask = taskAssigner.chooseWeightedTask() {
                    print("Algorithmically chosen task: \(chosenTask.getName())")
                }
            }
            
        case 5:
            let tasks = taskAssigner.getTasks()
            if tasks.isEmpty {
                print("You want to delete nothing ? xD")
            } else {
                
                print("Tasks left to do:")
                for task in taskAssigner.getTasks() {
                    print("\(task.getName())")
                }
                print("What is the name of the task you want to delete?")
                if let chosenTask = readLine() {
                    let deleted = taskAssigner.deleteTask(withName: chosenTask)
                    if deleted {
                        print("Task deleted successfully.")
                    }else {
                        print("No task found with that name m8")
                    }
                    
                }else {
                    print("well you gotta input something m8.. try again")
                }
                
            }
            
        default:
            print("Invalid choice. Please read the instructions.")
        }
        
    } while choice != 0
}

main()

