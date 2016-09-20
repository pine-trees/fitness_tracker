//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tempExc = ["Burpees", "Squats", "Pull-Ups", "Sit-Ups", "Jog", "Jumping Jacks","Push-ups"]
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
        tempExc.removeAtIndex(0)
        tableView.reloadData()
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
        cell.contentView.alpha = 1
        return cell
    }
    
    //Here the cell are assigned different alpha values based on the for loop. the loop iterates through table data source(in our case array) and calculates the alpha based on the overal number of cells. Just like calculating percentage, but without multiplication by 100
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        for x in 0...tempExc.count {
            if row == 0 {
                cell.contentView.alpha = 1
            } else {
                cell.contentView.alpha = CGFloat((Double(tempExc.count-1) - Double(row)) / Double(tempExc.count-1))
                print(cell.contentView.alpha)
            }
        }
            
    }
    
}


