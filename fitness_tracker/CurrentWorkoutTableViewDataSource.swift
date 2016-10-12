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
    //Img array to store icons so the cell can utomatically pick the one it needs.
    let imgArray = [UIImage(named: "Dumbbell_Icon.png"), UIImage(named: "Heart_Icon.png")]
    //initialize callback object. Function can be assigned to this one from outside of this class.
    var callback: (() -> Void)?
    
    //Standart tableView stuff. Sections. Rows in section equals number of items in data model array. And dequereussablecell is everybody's favourite.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWorkout.exercises.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //note that since im using cutom cell we set identiier here. and also it needs to be cast as custom cell type. Some sources say you should use if let in case it fails to retrieve all the cell data, and it should create emty one in that case. Other sourses say its bullcrap and not necessarry.
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? excCell {
            let row = (indexPath as NSIndexPath).row
            //checking for type and assigning the corresponging image.
            if currentWorkout.exercises[row].isCardio {
                cell.icon.image = imgArray[1]
            } else {
                cell.icon.image = imgArray[0]
            }
            //cellconfig. takes whatever is in the data source at given index and puts it into the cell.
            cell.cellConfig(excName: currentWorkout.exercises[row].name, cond: currentWorkout.exercises[row].completionCondition, discr: "reps")
            //crappy solution. I separate two textfields by assigning a seccond one the same tag as the row, but plus 100000 since no one can make hendred thousand exercises in one set. May lead to bugs though if someone does add 100000 exesices. Delegates are the same class.
            cell.condField.tag = row + 100000
            cell.condField.delegate = self
            cell.newNameField.tag = row
            cell.newNameField.delegate = self
            //gesture recognizer for tap. It appears you need gesture recognizer in every view you want it to work in. So every cell gets its own gesture recognizer.
            //add it to the icon within the cell and set the tag to the current row.
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
            cell.icon.addGestureRecognizer(tapGesture)
            cell.icon.isUserInteractionEnabled = true
            cell.icon.tag = row
            
            return cell
        } else {
            return excCell()
        }
    }
    //this is for editing and rearranging. enables us to specify which rows can be edited and which cant. returns true now, so every row is editable.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //this one enables to beatifully drag cells to rearrange. From the get go it enables rearrangng, but we need to update the data model itself as well. It's done here. It provides us with two IndexPaths so we can specify what we grab and where we put it. Callback in the end is to force the update. If not done, it loses gesture recognizer in the cell that has been dragged.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = currentWorkout.exercises[sourceIndexPath.row]
        currentWorkout.exercises.remove(at: sourceIndexPath.row)
        currentWorkout.exercises.insert(itemToMove, at: destinationIndexPath.row)
        callback?()
    }
    
    //this guy here is called whenever gesture occurs. it then updates the data source adn force refreshes the tableView. Note how the tag can be aquired from the sender. Learned this one from keyboard management mumbo-jumbo. Callback for force uodate or else tableView ignores the changes until cell is dequed again.
    func imgTapped (sender: UITapGestureRecognizer) {
        let index = Int((sender.view?.tag)!)
        currentWorkout.exercises[index].isCardio = !currentWorkout.exercises[index].isCardio
        callback?()
    }
    
    //textfield delegate function whis is fired when the editing finishes. if tag is less then 100000 it's the name textField else it's repetitions textfield. Also it checks if the reps field equels zero. In that case it puts 0 into the data source. Usual callback in the end to force uodate the table.
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag < 100000 {
            if textField.text != ""{
                currentWorkout.exercises[textField.tag].name = textField.text!
            }
        } else {
            if textField.text == "" {
                currentWorkout.exercises[textField.tag - 100000].completionCondition = 0
            } else {
                currentWorkout.exercises[textField.tag - 100000].completionCondition = Int(textField.text!)!
            }
        }
        
       callback?()
    }
    
}
