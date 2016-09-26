//
//  Workout.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 23/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class Workout {
    
    struct Exercise {
        var name: String
        var completionCondition: Int
        var type: String
        var completionTime: Double?
        var completionDate: Date?
    }
    
    var name: String
    var exercises = [Exercise]()
    var completionStatus = false
    var completionTime: Double?
    var completionDate = Date()
    var bestResult: Bool?
    
    func appendExercise (_ name: String, completionCondition: Int, type: String) {
        self.exercises.append(Workout.Exercise(name: name, completionCondition: completionCondition, type: type, completionTime: nil, completionDate: nil))
    }
    
    init(name: String) {
        self.name = name
        appendExercise("Burpee", completionCondition: 25, type: "cardio")
        appendExercise("Squat", completionCondition: 40, type: "streingth")
        appendExercise("Pull-up", completionCondition: 10, type: "streingth")
        appendExercise("Sit-up", completionCondition: 60, type: "streingth")
        appendExercise("Jog", completionCondition: 6, type: "Cardio")
        appendExercise("Jumping jack", completionCondition: 100, type: "cardio")
    }
    
}
