//
//  WorkoutListViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 16/10/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class WorkoutListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var workouts = [Workout(name: "Energized morning"), Workout(name: "Tender evening"), Workout(name: "Good afternoon")]
    var lastEditedIndex: Int!
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func addWorkout(_ sender: AnyObject) {
        workouts.append(Workout(name: "New workout"))
        tableView.insertRows(at: [IndexPath(row: workouts.count - 1, section: 0)], with: UITableViewRowAnimation.fade)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //tableView set up data source and delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = workouts[row].name
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            workouts.remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: UITableViewRowAnimation.fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(workouts[indexPath.row].name)")
        
        lastEditedIndex = indexPath.row
        performSegue(withIdentifier: "toWorkoutEdit", sender: workouts)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWorkoutEdit" {
            if let workoutEditVC = segue.destination as? WorkoutEditVC {
                if let dataToTransfer = sender as? [Workout] {
                    workoutEditVC.workouts = dataToTransfer
                    workoutEditVC.lastEditedIndex = self.lastEditedIndex
                }
            }
        }
    }
}
