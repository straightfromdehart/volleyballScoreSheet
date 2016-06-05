//
//  Substitution.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 4/25/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit
import CoreData

class Substitution: UIViewController {

    var managedObjectContext: NSManagedObjectContext!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var fetchRequest = NSFetchRequest(entityName: "MatchInfo")
//        
//        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        fetchRequest.fetchLimit = 1
//        
//        do {
//            let results = try managedObjectContext.executeFetchRequest(fetchRequest)
//            
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    
//                    let home = result.valueForKey("homeTeam"), visitor = result.valueForKey("visitingTeam")
//                    homeTeamLabel.text = "\(result.valueForKey("homeTeam")!)"
//                    visitingTeamLabel.text = "\(result.valueForKey("visitingTeam")!)"
//                    var homeTeamServes = result.valueForKey("homeTeamServes")
//                    var visitingTeamServes = result.valueForKey("visitingTeamServes")
//                    let lineupHome1 = result.valueForKey("lineupHome1")
//                    let lineupHome2 = result.valueForKey("lineupHome2")
//                    let lineupHome3 = result.valueForKey("lineupHome3")
//                    let lineupHome4 = result.valueForKey("lineupHome4")
//                    let lineupHome5 = result.valueForKey("lineupHome5")
//                    let lineupHome6 = result.valueForKey("lineupHome6")
//                    let lineupVisitor1 = result.valueForKey("lineupVisitor1")
//                    let lineupVisitor2 = result.valueForKey("lineupVisitor2")
//                    let lineupVisitor3 = result.valueForKey("lineupVisitor3")
//                    let lineupVisitor4 = result.valueForKey("lineupVisitor4")
//                    let lineupVisitor5 = result.valueForKey("lineupVisitor5")
//                    let lineupVisitor6 = result.valueForKey("lineupVisitor6")
//                    
//                    
//                    correctServerHome1.text = "\(lineupHome1!)"
//                    correctServerHome2.text = "\(lineupHome2!)"
//                    correctServerHome3.text = "\(lineupHome3!)"
//                    correctServerHome4.text = "\(lineupHome4!)"
//                    correctServerHome5.text = "\(lineupHome5!)"
//                    correctServerHome6.text = "\(lineupHome6!)"
//                    
//                    
//                    correctServerVisitor1.text = "\(lineupVisitor1!)"
//                    correctServerVisitor2.text = "\(lineupVisitor2!)"
//                    correctServerVisitor3.text = "\(lineupVisitor3!)"
//                    correctServerVisitor4.text = "\(lineupVisitor4!)"
//                    correctServerVisitor5.text = "\(lineupVisitor5!)"
//                    correctServerVisitor6.text = "\(lineupVisitor6!)"
//                    
//                    
//                    print("\(home!) : \(visitor!)")
//                    print("first server is \(lineupHome1!)")
//                    
//                    var homeTeamServesa:NSNumber = homeTeamServes as! NSNumber
//                    
//                    if homeTeamServesa == 1 {
//                        print("home team will serve!")
//                        homeTeamServes = true
//                        visitingTeamServes = false
//                        
//                        
//                    } else {
//                        print("visiting team will serve!")
//                        visitingTeamServes = true
//                        homeTeamServes = false
//                    }
//                    
//                }
//            }
//            
//        } catch {
//            print("error in fetchrequest")
//        }
//        
//        print("the fetched result is: \(fetchRequest)")
//        
//
//        
        
        
        
        
    }
    
    
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "SubToGameSegue" {
        print("segue identified")
    if let navigationController = segue.destinationViewController as? UINavigationController {
        print("first line wokred")
    if let viewController = navigationController.topViewController as? ViewController {
        print("last line worked")
    viewController.managedObjectContext = managedObjectContext
        
    
    }
    
    }
    }
    
}


}
