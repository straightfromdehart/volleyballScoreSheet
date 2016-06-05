//
//  UpdateMatchViewController.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 4/9/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit
import CoreData

class ContinueMatchViewController: UIViewController {
    
    var record: NSManagedObject!
    var managedObjectContext: NSManagedObjectContext!
    

    
    @IBAction func save(send: AnyObject) {
        
        let textBox = homeTeam.text
        
        if let isEmpty = textBox?.isEmpty where isEmpty == false {
            // Update Record
            record.setValue(textBox, forKey: "homeTeam")
            
            do {
                // Save Record
                try record.managedObjectContext?.save()
                
                // Dismiss View Controller
                navigationController?.popViewControllerAnimated(true)
                
            } catch {
                let saveError = error as NSError
                print("\(saveError), \(saveError.userInfo)")
                
                // Show Alert View
                showAlertWithTitle("Warning", message: "Your to-do could not be saved.", cancelButtonTitle: "OK")
            }
            
        } else {
            // Show Alert View
            showAlertWithTitle("Warning", message: "Enter a new name", cancelButtonTitle: "OK")
        }

    }
    
    @IBOutlet weak var homeTeam: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(record)

        if let name = record.valueForKey("homeTeam") as? String {
            homeTeam.text = name
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: -
    // MARK: Helper Methods
    private func showAlertWithTitle(title: String, message: String, cancelButtonTitle: String) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Configure Alert Controller
        alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .Default, handler: nil))
        
        // Present Alert Controller
        presentViewController(alertController, animated: true, completion: nil)
    }


    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditToMatchesSegue" {
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let viewController = navigationController.topViewController as? TableViewController {
                    viewController.managedObjectContext = managedObjectContext
                }
            }
        }
    }

}
