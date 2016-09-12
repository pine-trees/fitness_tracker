//
//  ViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 09/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    var stopWatch = StopWatch()
    
    
    @IBOutlet weak var testFractionLbl: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func startStpWatchBtn(sender: AnyObject) {
        stopWatch.displayLink.paused = !(stopWatch.displayLink.paused)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    }

    func updateLbl(){
        timeLabel.text = stopWatch.timestring
    }

}

