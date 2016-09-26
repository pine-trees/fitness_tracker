//
//  WkOutEditVC.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 26/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class WkOutEditVC: UIViewController, UITableViewDelegate {
    
    var tableViewData = CurrentWorkoutTableViewDataSource()
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tableViewData
        tableView.delegate = self
        workoutName.text = tableViewData.currentWorkout.name
       
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
