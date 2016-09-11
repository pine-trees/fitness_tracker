//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer!
    var fractions = 0
    var secconds = 0
    var minutes = 0
    var stopwatchRunning = false
    
    func timeCalc () {
        fractions += 1
        if fractions >= 100 {
            secconds += 1
            fractions = 1
            if secconds >= 60 {
                minutes += 1
                secconds = 0
            }
        }
        stopwatchText.text = "\(minutes):\(secconds):\(fractions)"
    }
    
    @IBOutlet weak var stopwatchText: UILabel!
   
    @IBAction func stopWatchFire(sender: AnyObject) {
        if stopwatchRunning == false {
            stopwatchRunning = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timeCalc", userInfo: nil, repeats: true)
            
        } else {
            timer.invalidate()
            stopwatchRunning = false
        }
    }
    
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

