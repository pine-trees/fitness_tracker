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
    
    let cellIdentifier = "excCell"
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWorkout.exercises.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? excCell {
            let row = (indexPath as NSIndexPath).row
            cell.cellConfig(excName: currentWorkout.exercises[row].name, cond: currentWorkout.exercises[row].completionCondition, discr: "reps")
            return cell
        } else {
            return excCell()
        }
        

    }
    
    
}
