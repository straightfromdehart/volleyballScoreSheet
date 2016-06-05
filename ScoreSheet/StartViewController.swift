//
//  StartViewController.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 4/10/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit
import CoreData

class StartViewController: UIViewController {
    
    var fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController()
    var managedObjectContext: NSManagedObjectContext!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StartToMatchesSegue" {
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let viewController = navigationController.topViewController as? TableViewController {
                    viewController.managedObjectContext = managedObjectContext
                } else
                    
                    if segue.identifier == "StartToGameSegue" {
                    if let navigationController = segue.destinationViewController as? UINavigationController {
                        if let viewController = navigationController.topViewController as? ViewController {
                           // viewController.managedObjectContext = managedObjectContext
                        }

            
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


        }
    }
}
}
}
