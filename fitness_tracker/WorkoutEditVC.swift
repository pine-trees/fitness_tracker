//
//  WkOutEditVC.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 26/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class WorkoutEditVC: UIViewController, UITableViewDelegate {

    var tableViewData = CurrentWorkoutTableViewDataSource()
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addExercise(_ sender: AnyObject) {
        //creates new cell and updates data source
        tableViewData.currentWorkout.appendRandExercise()
        let indexPath = [IndexPath(row: tableViewData.currentWorkout.exercises.count - 1 , section: 0)]
        tableView.insertRows(at: indexPath, with: UITableViewRowAnimation.fade)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this one sets editing to be enabled. simple
        tableView.isEditing = true
        
        
        //delegate and data source blah-blah
        tableView.dataSource = tableViewData
        tableView.delegate = self
        
        workoutName.text = tableViewData.currentWorkout.name
        
        //callback function to be called from within the tableViewData object
        tableViewData.callback = self.forceUpdateTable
        
        
        //activating the notification center function for keyboard events. This is needed to make sure kayboard never covers items being edited
        keyboardNotifications()
    }
    
    // Force updates the table view. Used as a callback
    func forceUpdateTable () {
        tableView.reloadData()
    }
    
    //these next two guys are part of the TableView delegate protocol. This one sets editing stile for a cell. Note that it actually returns the editing stile.
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//       return UITableViewCellEditingStyle.none
//    }
    
    // this one has to do with identation. Self explanatory. In my case it creates some layout conflicts.
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    //Keyboard management
    //This is a tough one.
    //This firs method basically creates a notification center for keyboard events.
    //we add observer to the newly created center. From what I understand this is how notification center is usually set up. Not that the "name" is set from within NSNotification object. Which means the event triggering the selector is typical and is picked from the list.
    //We actually add two observers. One for when the keyboard appears and one for when it dissappears. They call their respective functions upon the completion of the event described in "name" part.
    func keyboardNotifications () {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    // As the name suugests this one is triggered when the keyboard is shown. First two lines are part of the typical set up. First we retrieve some userInfo which is always a part of notification sender. note sender object
    //The seccond line gets last frame from the keyboard animation. And casts it as NSValue.N Not sure why we do the casting though.
    //Then since the last frame is to stay we can get the size of the keyboard (not fixed). CGSize is apparently a thing. If you peak inside it apears to be a cg float.
    //Insets is the simplest one. It has four basic values:t top, left, bottom and right. We only need to inset the content from the bottom so we feed retrieved keyboard size into this. Note that insets are of type: UIEdgeInsets.
    //Lastly we inset the tableView by assigning inset to the previous thingy. contentInsets appears to be a standart value in the tableView class. Neat. Same for scroll indicators.
    
    func keyboardWillShow(sender: Notification) {
        let info = sender.userInfo
        let value = info?[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardSize: CGSize = value.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
    }
    //same as before but now we dont need to specify the last frame. As soon as keyboard is hidden we set the insets to zero. Note that it has to be UIEdgeInsets.zero and not 0 or 0.0 or whatever( but something tell me it can be UIEdgeInsets[0.0, 0.0, 0.0, 0.0].
    func keyboardWillHide(sender: Notification) {
        let contentInsets: UIEdgeInsets = UIEdgeInsets.zero
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
