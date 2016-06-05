//
//  SettingsViewController.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 4/1/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit
import CoreData

var lineupA1Array: [Int]!


class SettingsViewController: UIViewController {

    //MARK: Saving Preferences
   
    var managedObjectContext: NSManagedObjectContext!
    

    @IBOutlet var homeTeamName: UITextField!
    @IBOutlet var visitingTeamName: UITextField!
    @IBOutlet var location: UITextField!

    @IBOutlet var lineupHome1: UITextField!
    @IBOutlet var lineupHome2: UITextField!
    @IBOutlet var lineupHome3: UITextField!
    @IBOutlet var lineupHome4: UITextField!
    @IBOutlet var lineupHome5: UITextField!
    @IBOutlet var lineupHome6: UITextField!
    @IBOutlet var lineupALibero: UITextField!
    
    @IBOutlet var lineupVisitor1: UITextField!
    @IBOutlet var lineupVisitor2: UITextField!
    @IBOutlet var lineupVisitor3: UITextField!
    @IBOutlet var lineupVisitor4: UITextField!
    @IBOutlet var lineupVisitor5: UITextField!
    @IBOutlet var lineupVisitor6: UITextField!
    @IBOutlet var lineupVisitorLibero: UITextField!
    
    func getLineupA() {
       
    }

    @IBAction func savePreferences(sender: AnyObject) {
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("MatchInfo", inManagedObjectContext: managedContext)
        let newMatch = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        newMatch.setValue(homeTeamName.text, forKey: "homeTeam")
        newMatch.setValue(visitingTeamName.text, forKey: "visitingTeam")
        newMatch.setValue(NSDate(), forKey: "date")
        newMatch.setValue(NSDate(), forKey: "startingTime")
        newMatch.setValue(location.text, forKey: "location")
        if lineupHome1.text != "" {
        newMatch.setValue(Int(lineupHome1.text!), forKey: "lineupHome1")
            print("lineupHome1 = something")
            print("text is: \(lineupHome1.text)")
        } else {
            newMatch.setValue(1, forKey: "lineupHome1")
            print("lineupHome1 = nil")
        }
        if lineupHome2.text != ""{
        newMatch.setValue(Int(lineupHome2.text!), forKey: "lineupHome2")
        } else {
            newMatch.setValue(2, forKey: "lineupHome2")
        }

        if lineupHome3.text != "" {
        newMatch.setValue(Int(lineupHome3.text!), forKey: "lineupHome3")
        } else {
            newMatch.setValue(3, forKey: "lineupHome3")
        }

        if lineupHome4.text != "" {
        newMatch.setValue(Int(lineupHome4.text!), forKey: "lineupHome4")
        } else {
            newMatch.setValue(4, forKey: "lineupHome4")
        }

        if lineupHome5.text != "" {
        newMatch.setValue(Int(lineupHome5.text!), forKey: "lineupHome5")
        } else {
            newMatch.setValue(5, forKey: "lineupHome5")
        }

        if lineupHome6.text != "" {
        newMatch.setValue(Int(lineupHome6.text!), forKey: "lineupHome6")
        } else {
            newMatch.setValue(6, forKey: "lineupHome6")
        }

        if lineupVisitor1.text != "" {
        newMatch.setValue(Int(lineupVisitor1.text!), forKey: "lineupVisitor1")
        } else {
            newMatch.setValue(1, forKey: "lineupVisitor1")
        }

        if lineupVisitor2.text != "" {
        newMatch.setValue(Int(lineupVisitor2.text!), forKey: "lineupVisitor2")
        } else {
            newMatch.setValue(2, forKey: "lineupVisitor2")
        }

        if lineupVisitor3.text != "" {
        newMatch.setValue(Int(lineupVisitor3.text!), forKey: "lineupVisitor3")
        } else {
            newMatch.setValue(3, forKey: "lineupVisitor3")
        }

        if lineupVisitor4.text != "" {
        newMatch.setValue(Int(lineupVisitor4.text!), forKey: "lineupVisitor4")
        } else {
            newMatch.setValue(4, forKey: "lineupVisitor4")
        }

        if lineupVisitor5.text != "" {
        newMatch.setValue(Int(lineupVisitor5.text!), forKey: "lineupVisitor5")
        } else {
            newMatch.setValue(5, forKey: "lineupVisitor5")
        }

        if lineupVisitor6.text != "" {
        newMatch.setValue(Int(lineupVisitor6.text!), forKey: "lineupVisitor6")
        } else {
            newMatch.setValue(6, forKey: "lineupVisitor6")
        }

        
        
        
        
        
        
        do {
            try managedContext.save()
            print("managed context did save")
            
        } catch {
            print("original : Save did not work \(error)")
            
        }
        
        if homeTeamServes == true {
            newMatch.setValue(true, forKey: "homeTeamServes")
            newMatch.setValue(false, forKey: "visitingTeamServes")
            
            do {
                try managedContext.save()
                
            } catch {
                print("home team serves : Save did not work \(error)")
                
            }

            
        } else {
            newMatch.setValue(false, forKey: "homeTeamServes")
            newMatch.setValue(true, forKey: "visitingTeamServes")
            
            do {
                try managedContext.save()
                
            } catch {
                print("home tesam serves 2 : Save did not work \(error)")
                
            }

            
        }
     
       
        
    }
    //MARK: SETUP FIRST SERVER
    
    var homeTeamServes = true
    var visitingTeamServes = false
    var homeTeamOnLeft = true
    var visitingTeamOnLeft = false
    
    
    @IBOutlet var homeTeamSwitch: UISwitch!
    @IBOutlet var visitingTeamSwitch: UISwitch!
    
    
    @IBAction func visitingTeamSwitch(sender: UISwitch) {
        
        if visitingTeamSwitch.on {
            homeTeamSwitch.setOn(false, animated: true)
            print("visiting team serves = true)")
            homeTeamServes = false
            visitingTeamServes = true
        } else {
            homeTeamSwitch.setOn(true, animated: true)
            print("home team serves = true")
            homeTeamServes = true
            visitingTeamServes = false
        }
        
    }
    
    @IBAction func homeTeamSwitch(sender: UISwitch) {
        if homeTeamSwitch.on {
            visitingTeamSwitch.setOn(false, animated: true)
            print("home team serves = true")
            homeTeamServes = true
            visitingTeamServes = false
        } else {
            visitingTeamSwitch.setOn(true, animated: true)
            print("visiting team serves = true")
            homeTeamServes = false
            visitingTeamServes = true
            
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SettingsToMatchesSegue" {
            
            
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let viewController = navigationController.topViewController as? TableViewController {
                    viewController.managedObjectContext = managedObjectContext
                 
                    }
                }
     }
        else if segue.identifier == "SettingsToGameSegue" {
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let viewController = navigationController.topViewController as? ViewController {
                    viewController.managedObjectContext = managedObjectContext
            
                }
                
                }
            }

        }
        
    }


