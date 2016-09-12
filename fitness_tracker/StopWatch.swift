//
//  StopWatch.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 12/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import Foundation
import QuartzCore

class StopWatch {
    
    var displayLink: CADisplayLink!
    var timePassed: CFTimeInterval!
//    var fractions = 0
//    var secconds = 0
//    var minutes = 0
    var timestring = ""
    var check = "all"
    
    
    init () {
        check = "all good"
        self.displayLink = CADisplayLink(target: self, selector: "displayLinkUpdate")
        displayLink.paused = true
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        self.timePassed = displayLink.timestamp
        
    }
    
    func displayLinkUpdate (sender: CADisplayLink) {
        timePassed = timePassed + displayLink.duration
    }
    
    func start () {
        displayLink.paused = false
    }

    
    func timepassedAsString () {
//        fractions = (Int(timePassed * 100)) % 100
//        secconds = Int(timePassed) % 60
//        minutes = (Int(timePassed) / 60) % 60
        timestring = "\(NSString(format:"%02d",(Int(timePassed / 60) % 60))):\(NSString(format: "%02d", Int(timePassed) % 60)).\(Int(timePassed * 100) % 100)"
    }
    
//    func formatter (time) {
//       formattedTime = "\(NSString(format: "%02d", time))"
//    }
//    
}