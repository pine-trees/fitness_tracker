//
//  TestClass.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 16/10/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import Foundation

class TestClass: NSObject, NSCoding {
    var firstName: String!
    var lastName: String!
    var age: Int!
    
    init(first: String, last: String, age: Int) {
        self.firstName = first
        self.lastName = last
        self.age = age
        
    }
    
    override init () {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        self.age = aDecoder.decodeObject(forKey: "age") as! Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(age, forKey: "age")
    }
}
