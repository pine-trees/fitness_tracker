//
//  WorkoutTableViewDataSource.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 24/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class CurrentWorkoutTableViewDataSource: NSObject, UITableViewDataSource {
    
    var currentWorkout = Workout(name: "Default Workout")
    
    //workaround to get a list of exercises in current workout as an array. gotta be a more elegant solution. need to check array methods
//    var currentSet: [String] {
//        var array = [String]()
//        for x in 0...currentWorkout.exercises.count - 1 {
//            array.append(currentWorkout.exercises[x].name)
//        }
//        return array
//    }
    
    let cellIdentifier = "textCell"
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWorkout.exercises.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let row = (indexPath as NSIndexPath).row
        cell.textLabel?.text = currentWorkout.exercises[row].name
        return cell
    }
    
    
}
