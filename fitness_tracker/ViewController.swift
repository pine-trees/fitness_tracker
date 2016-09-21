//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tempExc = ["Burpees", "Squats", "Pull-Ups", "Sit-Ups", "Jog", "Jumping Jacks"]
    let cellIdentifier = "textCell"
    let stopWatch = StopWatch()
    //gradient object is created here
    var gradientMaskLayer:CAGradientLayer = CAGradientLayer()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startWorkoutLbl: UILabel!
    
    @IBAction func startButtonAction(sender: AnyObject) {
        //Reverse the status of displayLinkPaused duh, ie start tracking screen updates
        stopWatch.displayLink.paused = !(stopWatch.displayLink.paused)
        startWorkoutLbl.hidden = true
        timeLabel.alpha = 1
        //deketing the first row of table view, for it to not brake the data source for that row has to be romoved as well right now app crashes when array reaches 0 elements
        let delIndexPath = [NSIndexPath(forRow: 0, inSection: 0)]
        tempExc.removeAtIndex(0)
        tableView.deleteRowsAtIndexPaths(delIndexPath, withRowAnimation: UITableViewRowAnimation.Fade)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch.callback = self.updateLbl
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        //gradient object parameters
        gradientMaskLayer.frame = tableView.bounds
        gradientMaskLayer.colors = [UIColor.blackColor().CGColor, UIColor.clearColor().CGColor]
        gradientMaskLayer.locations = [0.0, 1.0]
        //who could have though these things have masks just like in photoshop!
        tableView.layer.mask = gradientMaskLayer
    }
//label update func which is a called from within the stopwatch class
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
    
    
    
}


