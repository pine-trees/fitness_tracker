//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let stopWatch = StopWatch()
    
    
    @IBOutlet weak var testFractionLbl: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func startStpWatchBtn(sender: AnyObject) {
        //Reverse the status of displayLinkPaused duh, ie start tracking screen updates
        stopWatch.displayLink.paused = !(stopWatch.displayLink.paused)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch.callback = self.updateLbl
        // Do any additional setup after loading the view, typically from a nib.
        
      
    }

    func updateLbl(){
        timeLabel.text = stopWatch.timepassedAsString()
    }

}

