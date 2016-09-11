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
    
    var displayLink: CADisplayLink!
    var lastDisplayLinkTimeStamp: CFTimeInterval!
    
    
    @IBOutlet weak var testFractionLbl: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func startStpWatchBtn(sender: AnyObject) {
        displayLink.paused = !(displayLink.paused)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //the following is from the tut
        //initialize display link and make it call linkUpdate function when there is an update available"
        displayLink = CADisplayLink(target: self, selector: "displayLinkUpdate")
        
        //make sure the displayLink is not updating by default
        displayLink.paused = true
        
        //add the displaylink to the runloop(referenced from apple documentation)
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        //initial timestamp (elapsed time in human language). essentially we assign the default value to be zero since display link has not fired yet
        lastDisplayLinkTimeStamp = displayLink.timestamp
    }

    //displayLink update func - all time calculations must take place here
    func displayLinkUpdate() {
        //update current time
        lastDisplayLinkTimeStamp = lastDisplayLinkTimeStamp + displayLink.duration
        
        //format current time to last two meaningfull digits ( the "0.2f" is appearantly from obj-c)
        let fractions = (Int(lastDisplayLinkTimeStamp * 100)) % 100
        let secconds = Int(lastDisplayLinkTimeStamp) % 60
        let minutes = (Int(lastDisplayLinkTimeStamp) / 60) % 60
        
        //display formated current time
        timeLabel.text = "\(minutes):\(secconds).\(fractions)"
    }


}

