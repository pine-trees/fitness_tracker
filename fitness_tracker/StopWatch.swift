//
//  StopWatch.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 12/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.

import Foundation
import QuartzCore

class StopWatch: NSObject {
    //displaylink - object of type CADisplaylink tracks screen updates
    var displayLink: CADisplayLink!
    // timePassed - timestamp of the last update
    var timePassed: CFTimeInterval!
    //the resulting time formatted as string
    
    var callback: (() -> Void)?
    
    override init () {
        
        super.init ()
        
        // by default displaylink will now be initialized with these parameters. it will call the displaylinkupdate function as soon as screen updates
        
        self.displayLink = CADisplayLink(target: self, selector: #selector(displayLinkUpdate))
        
        //paused by default so we can start/stop it manually
        
        displayLink.paused = true
        
        //display link must be added to runLoop with these parameters(as far as i understand it connects it to the ticks of the processor or whatever. in any case this is what allows it to track the screen updates as the ruuning tie goes on
        
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        //could have initialized it to 0.0 but it looks cooler this way. timestamp is the value of the last display uodate. since its paused by default its 0.0 now
        
        self.timePassed = displayLink.timestamp
        
    }
    
    // this one is tough. I understand it this way: you need an empty var within a class so you can run a function from outside of it(the one that updates the label) You have to init any emty value. But you can not do it in the initializer above, because you need to pass in an empty parameter into the callback. here in cobenience init we do the following: we init with argument callbak, which is a function, that takes in nothing and returns nothing. This also we init whatever we have in the initializer above with self.init. Now our global callback of type function that is void, is assigned a value of type void. Later we reassign that emty void with whatever function we wanna pass from outside of the class(from viewcontroller) and call this new assigned function when needed. In our case we do that upon timePassed calculation which in turn is being called when screen updates. I hope I got it right.
    convenience init(withCallback callback: ()->Void) {
        self.init()
        self.callback = callback
    }
    
    //this function here updates timePassed variable by adding its last value to the time it takes to update the screen
    
    func displayLinkUpdate () {
        timePassed = timePassed + displayLink.duration
        callback?()
    }
    

     //this monstrocity is the inline implementation of time foramtting. by default the value in timePassed is a double with a shitton of digits after the decimal point. we dont want that so we multiply fractions by 100 to move the deciaml point two characters to the right, then we get the modulo 100 of that to discard all digits in front of the last two; also we convert it inti Int to get rid of everything beyond the decimal point. Minutes and secconds are string since we need it in 00 format, but the logic behind converting it into int is same as before, although this time we modulo it by 60 since time is 60-based and not 100 based.
    func timepassedAsString () -> String {
        
        return "\(NSString(format:"%02d",(Int(timePassed / 60) % 60))):\(NSString(format: "%02d", Int(timePassed) % 60)).\(Int(timePassed * 100) % 100)"
    }
    
    
}
