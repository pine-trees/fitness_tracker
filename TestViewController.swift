//
//  TestViewController.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 16/10/2016.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var testArray = [TestClass]()
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func firstNameEdit(_ sender: AnyObject) {
        testArray[0].firstName = firstNameField.text
        saveDataSourceArray()
//        let testArrayArchive = NSKeyedArchiver.archivedData(withRootObject: testArray)
//        UserDefaults.standard.set(testArrayArchive, forKey: "testArray")
//        UserDefaults.standard.synchronize()
        
    }

    @IBAction func lastNameEdit(_ sender: AnyObject) {
    }
    @IBAction func ageEdit(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testArray.append(TestClass(first: "Josepth", last: "Smith", age: 45))
        load()
//        if let loadedTestArray = UserDefaults.standard.object(forKey: "testArray") as? NSData {
//            if let arrayArray = NSKeyedUnarchiver.unarchiveObject(with: loadedTestArray as Data) as? [TestClass]{
//                testArray = arrayArray
//            }
//        }
        firstNameField.text = testArray[0].firstName
        lastNameField.text = testArray[0].lastName
        ageField.text = "\(String(testArray[0].age))"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveDataSourceArray() {
        let dataToSave = NSKeyedArchiver.archivedData(withRootObject: testArray)
        UserDefaults.standard.set(dataToSave, forKey: "testArray")
        UserDefaults.standard.synchronize()
        
    }
    func load () {
        if let loadedData = UserDefaults.standard.object(forKey: "testArray") as? NSData {
            if let unarchivedArray = NSKeyedUnarchiver.unarchiveObject(with: loadedData as Data) as? [TestClass] {
                testArray = unarchivedArray
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
