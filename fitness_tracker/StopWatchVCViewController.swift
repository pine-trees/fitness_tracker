//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate {
    
    var tableViewData = CurrentWorkoutTableViewDataSource()
    let stopWatch = StopWatch()
    let defaultWorkout = Workout(name: "Default Workout")
    //gradient object is created here
    var gradientMaskLayer:CAGradientLayer = CAGradientLayer()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startWorkoutLbl: UILabel!
    
    @IBAction func startButtonAction(_ sender: AnyObject) {
        //Reverse the status of displayLinkPaused duh, ie start tracking screen updates
        stopWatch.displayLink.isPaused = !(stopWatch.displayLink.isPaused)
        startWorkoutLbl.isHidden = true
        timeLabel.alpha = 1
        deleteRow()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch.callback = self.updateLbl
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = tableViewData
        tableView.delegate = self
        //gradient object parameters
        gradientMaskLayer.frame = tableView.bounds
        gradientMaskLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0.0, 1.0]
        //who could have though these things have masks just like in photoshop!
        tableView.layer.mask = gradientMaskLayer
        
    }
//label update func which is a called from within the stopwatch class
    func updateLbl(){
        timeLabel.text = stopWatch.timepassedAsString()
    }
    
    func deleteRow() {
        let indexPath = [IndexPath(row: 0, section: 0)]
        if tableViewData.currentWorkout.exercises.count > 1{
            
            tableViewData.currentWorkout.exercises.remove(at: 0)
            tableView.deleteRows(at: indexPath, with: UITableViewRowAnimation.fade)
            
        } //need to add an else statement that gives us a completion screen with statistics.
    }
}


