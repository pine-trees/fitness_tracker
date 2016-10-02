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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tableViewData
        tableView.delegate = self
        workoutName.text = tableViewData.currentWorkout.name
        tableViewData.callback = self.forceUpdateTable
        keyboardNotifications()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        tableViewData.currentWorkout.exercises[textField.tag].name = textField.text!
        tableView.reloadData()
    }
    
    func forceUpdateTable () {
        tableView.reloadData()
    }
    
    //Keyboard management
    func keyboardNotifications () {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(sender: Notification) {
        let info = sender.userInfo
        let value = info?[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardSize: CGSize = value.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
    }
    
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
