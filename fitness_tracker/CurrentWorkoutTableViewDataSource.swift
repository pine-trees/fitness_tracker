//
//  WorkoutTableViewDataSource.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 24/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class CurrentWorkoutTableViewDataSource: NSObject, UITableViewDataSource, UITextFieldDelegate {
    
    var currentWorkout = Workout(name: "Default Workout")
    
    let cellIdentifier = "excCell"
    
    let imgArray = [UIImage(named: "Dumbbell_Icon.png"), UIImage(named: "Heart_Icon.png")]
    var callback: (() -> Void)?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWorkout.exercises.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? excCell {
            let row = (indexPath as NSIndexPath).row
            
            if currentWorkout.exercises[row].isCardio {
                cell.icon.image = imgArray[1]
            } else {
                cell.icon.image = imgArray[0]
            }
            cell.cellConfig(excName: currentWorkout.exercises[row].name, cond: currentWorkout.exercises[row].completionCondition, discr: "reps")
            cell.condField.tag = row + 100000
            cell.condField.delegate = self
            cell.newNameField.tag = row
            cell.newNameField.delegate = self
            return cell
        } else {
            return excCell()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag < 100000 {
            currentWorkout.exercises[textField.tag].name = textField.text!
        } else {
            currentWorkout.exercises[textField.tag - 100000].completionCondition = Int(textField.text!)!
        }
        
       callback?()
    }
    
}
