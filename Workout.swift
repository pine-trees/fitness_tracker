//
//  Workout.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 23/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import Foundation

class Workout {
    var name: String
    var exercises = [Exercise]()
    var completionStatus = false
    var completionTime: Double?
    var completionDate = NSDate()
    var bestResult: Bool?
    
    init(name: String) {
        self.name = name
    }
    
    //need to add a function to format completion time here later
    
}