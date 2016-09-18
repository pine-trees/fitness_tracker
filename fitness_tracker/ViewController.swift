//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tempExc = ["Burpees", "Squats", "Pull-Ups", "Sit-Ups", "Jog", "Jumping Jacks"]
    let cellIdentifier = "textCell"
    let stopWatch = StopWatch()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startWorkoutLbl: UILabel!
    
    @IBAction func startButtonAction(sender: AnyObject) {
        //Reverse the status of displayLinkPaused duh, ie start tracking screen updates
        stopWatch.displayLink.paused = !(stopWatch.displayLink.paused)
        startWorkoutLbl.hidden = true
        timeLabel.alpha = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch.callback = self.updateLbl
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

    func updateLbl(){
        timeLabel.text = stopWatch.timepassedAsString()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempExc.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = tempExc[row]
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        print(tempExc[row])
    }
}

