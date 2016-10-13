//
//  Workout.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 23/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class Workout {
    //struct for exercise element. exercise is always part of a workout.
    struct Exercise {
        var name: String
        var completionCondition: Int
        var isCardio: Bool
        var completionTime: Double?
        var completionDate: Date?
        var completionType: String
    }
    
    
    //initial values. note that exercises is an empty array of Exercise objects which are constructed based on the struct described earlier.
    var name: String
    var exercises = [Exercise]()
    var completionStatus = false
    var completionTime: Double?
    var completionDate = Date()
    var bestResult: Bool?
    
    //Dont forget about this one. It will come in handy later.
    func appendExercise (_ name: String, completionCondition: Int, isCardio: Bool) {
        self.exercises.append(Workout.Exercise(name: name, completionCondition: completionCondition, isCardio: isCardio, completionTime: nil, completionDate: nil, completionType: "reps"))
    }
    //apends random exercise
    func appendRandExercise () {
        let defaultNames = ["Squat", "Jumping Jack", "Run", "Pull-Up", "Push-Up", "Deadlift", "Sit-Up", "Burpee", "Lunge", "Overhead Press"]
        let randName = Int(arc4random_uniform(10))
        let condition = Int(arc4random_uniform(25))
        var type: String {
            if randName == 2 {
                return "KM"
            } else {
                return "reps"
            }
            
        }
        
        func ifCardio (rand: Int) -> Bool {
            if randName == 1 || randName == 2 || randName == 7 {
                return true
            } else {
                return false
            }
        }
        
        self.exercises.append(Workout.Exercise(name: defaultNames[randName], completionCondition: condition, isCardio: ifCardio(rand: randName), completionTime: nil, completionDate: nil, completionType: type))
    }
    
    //initailizer. that appendExercise is used here to crate a default workout. The name has to be there though.
    init(name: String) {
        self.name = name
        for _ in 0...5 {
            appendRandExercise()
        }
    }
    
}
