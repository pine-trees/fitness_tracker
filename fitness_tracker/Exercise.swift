//
//  Exercise.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 23/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class Exercise {
    var name: String
    var type: String?
    var icon: UIImage!
    var completionTime: Double?
    var completionDate = NSDate()
    var bestResult: Bool?
    
    init(name: String) {
        self.name = name
    }
    //need to add a method to format the time here alter
}