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
        var isCardio: Bool
        var completionTime: Double?
        var completionDate: Date?
    }
    
    
    
    var name: String
    var exercises = [Exercise]()
    var completionStatus = false
    var completionTime: Double?
    var completionDate = Date()
    var bestResult: Bool?
    
    func appendExercise (_ name: String, completionCondition: Int, isCardio: Bool) {
        self.exercises.append(Workout.Exercise(name: name, completionCondition: completionCondition, isCardio: isCardio, completionTime: nil, completionDate: nil))
    }
    
    init(name: String) {
        self.name = name
        appendExercise("Burpee", completionCondition: 25, isCardio: true)
        appendExercise("Squat", completionCondition: 40, isCardio: false)
        appendExercise("Pull-up", completionCondition: 10, isCardio: false)
        appendExercise("Sit-up", completionCondition: 60, isCardio: false)
        appendExercise("Jog", completionCondition: 6, isCardio: true)
        appendExercise("Jumping jack", completionCondition: 100, isCardio: true)
    }
    
}
