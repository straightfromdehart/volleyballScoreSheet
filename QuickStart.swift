//
//  QuickStart.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 5/15/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit

class QuickStart: UIViewController {
    
    //MARK: SETUP VARIABLES
    
    var leftSideHome: Bool!
    var leftSideVisitor: Bool!
    var homeTeamServes = true
    var visitingTeamServes : Bool!
    var leftSideServes : Bool! = true
    
    @IBOutlet var leftSideServesLabel: UILabel!
    @IBOutlet var rightSideServesLabel: UILabel!
    
    @IBOutlet var leftSideLabel: UILabel!
    @IBOutlet var rightSideLabel: UILabel!
    var rightTextField:String!
    var leftTextField: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        
        let alert = UIAlertController(title: "Quick Setup", message: "\n Green switch = Left side serves first.  White switch = right side serves first. \n Optional: team names:", preferredStyle: .Alert)

       let left = alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "left side team"
            self.leftTextField = textField.text!
        }
       alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "right side team"
            self.rightTextField = textField.text!
        }
        let startAction = UIAlertAction(title: "Start", style: .Default) { [unowned self, alert] (action: UIAlertAction!) in
            let left = alert.textFields![0] as! UITextField
            let right = alert.textFields![1] as! UITextField
            self.leftSideLabel.text = left.text
            self.rightSideLabel.text = right.text
        
           
        }
        alert.addAction(startAction)
        alert.view.addSubview(createSwitch())
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func createSwitch () -> UISwitch{
        
        
        let switchControl = UISwitch(frame:CGRectMake(10, 20, 0, 0));
        switchControl.on = true
        switchControl.setOn(true, animated: false);
        switchControl.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged);
        return switchControl
    }
    
    func switchValueDidChange(sender:UISwitch!){
        
        print("Switch Value : \(sender.on))")
        if sender.on == false {
        leftSideServes = false
            leftSideServesLabel.text = ""
            rightSideServesLabel.text = "x"
            print(leftSideServes)
            
        } else {
            leftSideServes = true
            print(leftSideServes)
            leftSideServesLabel.text = "x"
            rightSideServesLabel.text = ""
        }
    }
    
    var TeamAPointsScored: [Int] = []
    var TeamBPointsScored: [Int] = []
    

    
    //MARK: TAKE TURNS
    
    
    var TeamARound1 = true
    var TeamARound2 = false
    var TeamARound3 = false
    var TeamARound4 = false
    
    var TeamBRound1 = true
    var TeamBRound2 = false
    var TeamBRound3 = false
    var TeamBRound4 = false
    
    
    var startA1Turn: Bool = true
    var startA2Turn: Bool = false
    var startA3Turn: Bool = false
    var startA4Turn: Bool = false
    var startA5Turn: Bool = false
    var startA6Turn: Bool = false
    
    var startB1Turn: Bool = true
    var startB2Turn: Bool = false
    var startB3Turn: Bool = false
    var startB4Turn: Bool = false
    var startB5Turn: Bool = false
    var startB6Turn: Bool = false
    
    
    
    @IBOutlet var teamATotalScore: UILabel!
    @IBOutlet var teamBTotalScore: UILabel!
    
    //MARK: MADE SERVES LABEL BY PLAYERS
    
    @IBOutlet var serverA1Label: UILabel!
    @IBOutlet var serverA2Label: UILabel!
    @IBOutlet var serverA3Label: UILabel!
    @IBOutlet var serverA4Label: UILabel!
    @IBOutlet var serverA5Label: UILabel!
    @IBOutlet var serverA6Label: UILabel!
    
    
    @IBOutlet var serverB1Label: UILabel!
    @IBOutlet var serverB2Label: UILabel!
    @IBOutlet var serverB3Label: UILabel!
    @IBOutlet var serverB4Label: UILabel!
    @IBOutlet var serverB5Label: UILabel!
    @IBOutlet var serverB6Label: UILabel!
    
    
    // MARK: Points Scored Per Server
    
    var serverA1PointsScoredRound1: [Int] = []
    var serverA2PointsScoredRound1: [Int] = []
    var serverA3PointsScoredRound1: [Int] = []
    var serverA4PointsScoredRound1: [Int] = []
    var serverA5PointsScoredRound1: [Int] = []
    var serverA6PointsScoredRound1: [Int] = []
    
    
    var serverB1PointsScoredRound1: [Int] = []
    var serverB2PointsScoredRound1: [Int] = []
    var serverB3PointsScoredRound1: [Int] = []
    var serverB4PointsScoredRound1: [Int] = []
    var serverB5PointsScoredRound1: [Int] = []
    var serverB6PointsScoredRound1: [Int] = []
    
    var serverA1PointsScoredRound2: [Int] = []
    var serverA2PointsScoredRound2: [Int] = []
    var serverA3PointsScoredRound2: [Int] = []
    var serverA4PointsScoredRound2: [Int] = []
    var serverA5PointsScoredRound2: [Int] = []
    var serverA6PointsScoredRound2: [Int] = []
    
    var serverB1PointsScoredRound2: [Int] = []
    var serverB2PointsScoredRound2: [Int] = []
    var serverB3PointsScoredRound2: [Int] = []
    var serverB4PointsScoredRound2: [Int] = []
    var serverB5PointsScoredRound2: [Int] = []
    var serverB6PointsScoredRound2: [Int] = []
    
    
    var serverA1PointsScoredRound3: [Int] = []
    var serverA2PointsScoredRound3: [Int] = []
    var serverA3PointsScoredRound3: [Int] = []
    var serverA4PointsScoredRound3: [Int] = []
    var serverA5PointsScoredRound3: [Int] = []
    var serverA6PointsScoredRound3: [Int] = []
    
    var serverB1PointsScoredRound3: [Int] = []
    var serverB2PointsScoredRound3: [Int] = []
    var serverB3PointsScoredRound3: [Int] = []
    var serverB4PointsScoredRound3: [Int] = []
    var serverB5PointsScoredRound3: [Int] = []
    var serverB6PointsScoredRound3: [Int] = []
    
    var serverA1PointsScoredRound4: [Int] = []
    var serverA2PointsScoredRound4: [Int] = []
    var serverA3PointsScoredRound4: [Int] = []
    var serverA4PointsScoredRound4: [Int] = []
    var serverA5PointsScoredRound4: [Int] = []
    var serverA6PointsScoredRound4: [Int] = []
    
    var serverB1PointsScoredRound4: [Int] = []
    var serverB2PointsScoredRound4: [Int] = []
    var serverB3PointsScoredRound4: [Int] = []
    var serverB4PointsScoredRound4: [Int] = []
    var serverB5PointsScoredRound4: [Int] = []
    var serverB6PointsScoredRound4: [Int] = []
    
    
    
    // MARK: Starting Points Per Round
    
    var teamA1StartingPointRound1: Int = Int()
    var teamA2StartingPointRound1: Int = Int()
    var teamA3StartingPointRound1: Int = Int()
    var teamA4StartingPointRound1: Int = Int()
    var teamA5StartingPointRound1: Int = Int()
    var teamA6StartingPointRound1: Int = Int()
    
    var teamB1StartingPointRound1: Int = Int()
    var teamB2StartingPointRound1: Int = Int()
    var teamB3StartingPointRound1: Int = Int()
    var teamB4StartingPointRound1: Int = Int()
    var teamB5StartingPointRound1: Int = Int()
    var teamB6StartingPointRound1: Int = Int()
    
    var teamA1StartingPointRound2: Int = Int()
    var teamA2StartingPointRound2: Int = Int()
    var teamA3StartingPointRound2: Int = Int()
    var teamA4StartingPointRound2: Int = Int()
    var teamA5StartingPointRound2: Int = Int()
    var teamA6StartingPointRound2: Int = Int()
    
    var teamB1StartingPointRound2: Int = Int()
    var teamB2StartingPointRound2: Int = Int()
    var teamB3StartingPointRound2: Int = Int()
    var teamB4StartingPointRound2: Int = Int()
    var teamB5StartingPointRound2: Int = Int()
    var teamB6StartingPointRound2: Int = Int()
    
    var teamA1StartingPointRound3: Int = Int()
    var teamA2StartingPointRound3: Int = Int()
    var teamA3StartingPointRound3: Int = Int()
    var teamA4StartingPointRound3: Int = Int()
    var teamA5StartingPointRound3: Int = Int()
    var teamA6StartingPointRound3: Int = Int()
    
    var teamB1StartingPointRound3: Int = Int()
    var teamB2StartingPointRound3: Int = Int()
    var teamB3StartingPointRound3: Int = Int()
    var teamB4StartingPointRound3: Int = Int()
    var teamB5StartingPointRound3: Int = Int()
    var teamB6StartingPointRound3: Int = Int()
    
    var teamA1StartingPointRound4: Int = Int()
    var teamA2StartingPointRound4: Int = Int()
    var teamA3StartingPointRound4: Int = Int()
    var teamA4StartingPointRound4: Int = Int()
    var teamA5StartingPointRound4: Int = Int()
    var teamA6StartingPointRound4: Int = Int()
    
    var teamB1StartingPointRound4: Int = Int()
    var teamB2StartingPointRound4: Int = Int()
    var teamB3StartingPointRound4: Int = Int()
    var teamB4StartingPointRound4: Int = Int()
    var teamB5StartingPointRound4: Int = Int()
    var teamB6StartingPointRound4: Int = Int()
    
    
    
    // MARK: -- GAME PLAY --
    
    
    @IBAction func teamAPlusOnePoint(sender: AnyObject) {
        
        // MARK: TEAM A ROUND 1
        // MARK: LEFT SIDE SERVES FIRST
        if leftSideServes == true {
            if TeamARound1 == true {
                //First Server
                if startA1Turn == true {
                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                    teamA1StartingPointRound1 = Int(1)
                    serverA1PointsScoredRound1.append(serverA1PointsScoredRound1.count + 1)
                    serverA1Label.text = "\(serverA1PointsScoredRound1)"
                    print(serverA1PointsScoredRound1)
                    startB6Turn = false
                    startB1Turn = true
                } else {
                    //Second Server
                    if startA2Turn == true {
                        if serverA1PointsScoredRound1.count > 0 {
                            let startingPoints:Int = serverA1PointsScoredRound1.last! + 1
                            teamA2StartingPointRound1 = startingPoints
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            serverA2PointsScoredRound1.append(startingPoints + serverA2PointsScoredRound1.count)
                            serverA2Label.text = "\(startingPoints) \(serverA2PointsScoredRound1.dropFirst())"
                            
                            startB1Turn = false
                            startB2Turn = true
                        } else {
                            let startingPoints:Int = 1
                            teamA2StartingPointRound1 = startingPoints
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            serverA2PointsScoredRound1.append(serverA2PointsScoredRound1.count + 1)
                            serverA2Label.text = "\(serverA2PointsScoredRound1)"
                            startB1Turn = false
                            startB2Turn = true
                        }
                        
                        
                    } else {
                        
                        
                        //Third Server
                        
                        if startA3Turn == true {
                            let startingPoints:Int = serverA2PointsScoredRound1.last! + 1
                            
                            teamA3StartingPointRound1 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            
                            serverA3PointsScoredRound1.append(startingPoints + serverA3PointsScoredRound1.count)
                            serverA3Label.text = "\(startingPoints) \(serverA3PointsScoredRound1.dropFirst())"
                            
                            startB2Turn = false
                            startB3Turn = true
                            
                            
                            
                        }  else {
                            
                            //Fourth Server
                            
                            if startA4Turn == true {
                                
                                
                                
                                let startingPoints:Int = serverA3PointsScoredRound1.last! + 1
                                teamA4StartingPointRound1 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                
                                serverA4PointsScoredRound1.append(startingPoints + serverA4PointsScoredRound1.count)
                                serverA4Label.text = "\(startingPoints) \(serverA4PointsScoredRound1.dropFirst())"
                                
                                
                                startB3Turn = false
                                startB4Turn = true
                                
                                
                            } else {
                                
                                //Fifth Server
                                if startA5Turn == true {
                                    
                                    
                                    let startingPoints:Int = serverA4PointsScoredRound1.last! + 1
                                    teamA5StartingPointRound1 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    
                                    serverA5PointsScoredRound1.append(startingPoints + serverA5PointsScoredRound1.count)
                                    serverA5Label.text = "\(startingPoints) \(serverA5PointsScoredRound1.dropFirst())"
                                    
                                    
                                    startB4Turn = false
                                    startB5Turn = true
                                    
                                    
                                    
                                    
                                    
                                } else {
                                    
                                    
                                    // Sixth Server
                                    if startA6Turn == true {
                                        
                                        
                                        let startingPoints:Int = serverA5PointsScoredRound1.last! + 1
                                        teamA6StartingPointRound1 = startingPoints
                                        
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA6PointsScoredRound1.append(startingPoints + serverA6PointsScoredRound1.count)
                                        serverA6Label.text = "\(startingPoints) \(serverA6PointsScoredRound1.dropFirst())"
                                        print(startingPoints)
                                        
                                        startB5Turn = false
                                        startB6Turn = true
                                        
                                        
                                        
                                        
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
                
            } else {
                
                if TeamARound2 == true {
                    //MARK: TEAM A ROUND 2
                    //First Server
                    
                    if startA1Turn == true {
                        
                        let startingPoints:Int = serverA6PointsScoredRound1.last! + 1
                        teamA1StartingPointRound2 = startingPoints
                        
                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                        serverA1PointsScoredRound2.append(startingPoints + serverA1PointsScoredRound2.count)
                        serverA1Label.text = "\(serverA1PointsScoredRound1) \(teamA1StartingPointRound2) \(serverA1PointsScoredRound2.dropFirst())"
                        print("\(serverA1PointsScoredRound2)")
                        print("\(serverA1PointsScoredRound1)")
                        print("\(teamA1StartingPointRound2)")
                        print("\(serverA1PointsScoredRound2.dropFirst())")
                        startB6Turn = false
                        startB1Turn = true
                        TeamBRound1 = false
                        TeamBRound2 = true
                        
                        
                    } else {
                        
                        //Second Server
                        
                        if startA2Turn == true {
                            
                            let startingPoints:Int = serverA1PointsScoredRound2.last! + 1
                            teamA2StartingPointRound2 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            
                            serverA2PointsScoredRound2.append(startingPoints + serverA2PointsScoredRound2.count)
                            serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA2PointsScoredRound2.dropFirst())"
                            
                            startB1Turn = false
                            startB2Turn = true
                            
                            
                            
                        } else {
                            //Third Server
                            
                            if startA3Turn == true {
                                
                                let startingPoints:Int = serverA2PointsScoredRound2.last! + 1
                                teamA3StartingPointRound2 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                serverA3PointsScoredRound2.append(startingPoints + serverA3PointsScoredRound2.count)
                                serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA3PointsScoredRound2.dropFirst())"
                                
                                startB2Turn = false
                                startB3Turn = true
                                
                            }  else {
                                
                                //Fourth Server
                                
                                if startA4Turn == true {
                                    
                                    let startingPoints:Int = serverA3PointsScoredRound2.last! + 1
                                    teamA4StartingPointRound2 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    
                                    serverA4PointsScoredRound2.append(startingPoints + serverA4PointsScoredRound2.count)
                                    serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA4PointsScoredRound2.dropFirst())"
                                    
                                    
                                    startB3Turn = false
                                    startB4Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    //Fifth Server
                                    if startA5Turn == true {
                                        let startingPoints:Int = serverA4PointsScoredRound2.last! + 1
                                        teamA5StartingPointRound2 = startingPoints
                                        
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA5PointsScoredRound2.append(startingPoints + serverA5PointsScoredRound2.count)
                                        serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA5PointsScoredRound2.dropFirst())"
                                        
                                        startB4Turn = false
                                        startB5Turn = true
                                        
                                        
                                    } else {
                                        
                                        
                                        // Sixth Server
                                        if startA6Turn == true {
                                            let startingPoints:Int = serverA5PointsScoredRound2.last! + 1
                                            teamA6StartingPointRound2 = startingPoints
                                            
                                            
                                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                            
                                            
                                            serverA6PointsScoredRound2.append(startingPoints + serverA6PointsScoredRound2.count)
                                            serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA6PointsScoredRound2.dropFirst())"
                                            
                                            
                                            startB5Turn = false
                                            startB6Turn = true
                                            
                                            
                                            
                                            
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }  else {
                    
                    
                    //MARK: TEAM A ROUND 3
                    
                    if TeamARound3 == true {
                        
                        print("Team A round 3")
                        
                        
                        //First Server
                        if startA1Turn == true {
                            
                            
                            let startingPoints:Int = serverA6PointsScoredRound2.last! + 1
                            teamA1StartingPointRound3 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            print(serverA1PointsScoredRound3)
                            
                            
                            serverA1PointsScoredRound3.append(startingPoints + serverA1PointsScoredRound3.count)
                            serverA1Label.text = "\(serverA1PointsScoredRound1) \(teamA1StartingPointRound2) \(serverA1PointsScoredRound2.dropFirst()) \(teamA1StartingPointRound3) \(serverA1PointsScoredRound3.dropFirst())"
                            
                            startB6Turn = false
                            startB1Turn = true
                            TeamBRound2 = false
                            TeamBRound3 = true
                            
                            
                            
                        } else {
                            
                            
                            
                            //Second Server
                            
                            if startA2Turn == true {
                                
                                let startingPoints:Int = serverA1PointsScoredRound3.last! + 1
                                
                                teamA2StartingPointRound3 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                serverA2PointsScoredRound3.append(startingPoints + serverA2PointsScoredRound3.count)
                                serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst()) \(teamA2StartingPointRound2) \(serverA2PointsScoredRound2.dropFirst()) \(teamA2StartingPointRound3) \(serverA2PointsScoredRound3.dropFirst())"
                                
                                startB1Turn = false
                                startB2Turn = true
                                
                                
                            } else {
                                
                                
                                //Third Server
                                
                                if startA3Turn == true {
                                    
                                    
                                    
                                    let startingPoints:Int = serverA2PointsScoredRound3.last! + 1
                                    
                                    teamA3StartingPointRound3 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    serverA3PointsScoredRound3.append(startingPoints + serverA3PointsScoredRound3.count)
                                    serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst()) \(teamA3StartingPointRound2) \(serverA3PointsScoredRound2.dropFirst()) \(teamA3StartingPointRound3) \(serverA3PointsScoredRound3.dropFirst())"
                                    
                                    startB2Turn = false
                                    startB3Turn = true
                                    
                                    
                                    
                                }  else {
                                    
                                    //Fourth Server
                                    
                                    if startA4Turn == true {
                                        
                                        
                                        
                                        
                                        let startingPoints:Int = serverA3PointsScoredRound3.last! + 1
                                        teamA4StartingPointRound3 = startingPoints
                                        
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA4PointsScoredRound3.append(startingPoints + serverA4PointsScoredRound3.count)
                                        serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst()) \(teamA4StartingPointRound2) \(serverA4PointsScoredRound2.dropFirst()) \(teamA4StartingPointRound3) \(serverA4PointsScoredRound3.dropFirst())"
                                        
                                        startB3Turn = false
                                        startB4Turn = true
                                        
                                        
                                        
                                    } else {
                                        
                                        //Fifth Server
                                        if startA5Turn == true {
                                            
                                            
                                            let startingPoints:Int = serverA4PointsScoredRound3.last! + 1
                                            teamA5StartingPointRound3 = startingPoints
                                            
                                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                            
                                            
                                            serverA5PointsScoredRound3.append(startingPoints + serverA5PointsScoredRound3.count)
                                            serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst()) \(teamA5StartingPointRound2) \(serverA5PointsScoredRound2.dropFirst()) \(teamA5StartingPointRound3) \(serverA5PointsScoredRound3.dropFirst())"
                                            
                                            
                                            startB4Turn = false
                                            startB5Turn = true
                                            
                                            
                                            
                                        } else {
                                            
                                            
                                            // Sixth Server
                                            if startA6Turn == true {
                                                
                                                
                                                
                                                let startingPoints:Int = serverA5PointsScoredRound3.last! + 1
                                                teamA6StartingPointRound3 = startingPoints
                                                
                                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                                
                                                
                                                serverA6PointsScoredRound3.append(startingPoints + serverA6PointsScoredRound3.count)
                                                serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst()) \(teamA6StartingPointRound2) \(serverA6PointsScoredRound2.dropFirst()) \(teamA6StartingPointRound3) \(serverA6PointsScoredRound3.dropFirst())"
                                                
                                                startB5Turn = false
                                                startB6Turn = true
                                                
                                                
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                    
                    
                }
            }
            
            
            // MARK: TEAM A ROUND 4
            if TeamARound4 == true {
                
                print("Team A round 4")
                
                
                //First Server
                if startA1Turn == true {
                    
                    
                    let startingPoints:Int = serverA6PointsScoredRound3.last! + 1
                    teamA1StartingPointRound4 = startingPoints
                    
                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                    print(serverA1PointsScoredRound4)
                    
                    
                    serverA1PointsScoredRound4.append(startingPoints + serverA1PointsScoredRound4.count)
                    serverA1Label.text = "\(serverA1PointsScoredRound1) \(teamA1StartingPointRound2) \(serverA1PointsScoredRound2.dropFirst()) \(teamA1StartingPointRound3) \(serverA1PointsScoredRound3.dropFirst()) \(startingPoints) \(serverA1PointsScoredRound4.dropFirst())"
                    
                    startB6Turn = false
                    startB1Turn = true
                    TeamBRound3 = false
                    TeamBRound4 = true
                    
                    
                    
                } else {
                    
                    
                    
                    //Second Server
                    
                    if startA2Turn == true {
                        
                        let startingPoints:Int = serverA1PointsScoredRound4.last! + 1
                        
                        teamA2StartingPointRound4 = startingPoints
                        
                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                        
                        serverA2PointsScoredRound4.append(startingPoints + serverA2PointsScoredRound4.count)
                        serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst()) \(teamA2StartingPointRound2) \(serverA2PointsScoredRound2.dropFirst()) \(teamA2StartingPointRound3) \(serverA2PointsScoredRound3.dropFirst()) \(teamA2StartingPointRound4) \(serverA2PointsScoredRound4.dropFirst())"
                        
                        startB1Turn = false
                        startB2Turn = true
                        
                        
                    } else {
                        
                        
                        //Third Server
                        
                        if startA3Turn == true {
                            
                            
                            
                            let startingPoints:Int = serverA2PointsScoredRound4.last! + 1
                            
                            teamA3StartingPointRound4 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            
                            serverA3PointsScoredRound4.append(startingPoints + serverA3PointsScoredRound4.count)
                            serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst()) \(teamA3StartingPointRound2) \(serverA3PointsScoredRound2.dropFirst()) \(teamA3StartingPointRound3) \(serverA3PointsScoredRound3.dropFirst()) \(teamA3StartingPointRound4) \(serverA3PointsScoredRound4.dropFirst())"
                            
                            startB2Turn = false
                            startB3Turn = true
                            
                            
                            
                        }  else {
                            
                            //Fourth Server
                            
                            if startA4Turn == true {
                                
                                
                                
                                
                                let startingPoints:Int = serverA3PointsScoredRound4.last! + 1
                                teamA4StartingPointRound4 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                
                                serverA4PointsScoredRound4.append(startingPoints + serverA4PointsScoredRound4.count)
                                serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst()) \(teamA4StartingPointRound2) \(serverA4PointsScoredRound2.dropFirst()) \(teamA4StartingPointRound3) \(serverA4PointsScoredRound3.dropFirst()) \(teamA4StartingPointRound4) \(serverA4PointsScoredRound4.dropFirst())"
                                
                                startB3Turn = false
                                startB4Turn = true
                                
                                
                                
                            } else {
                                
                                //Fifth Server
                                if startA5Turn == true {
                                    
                                    
                                    let startingPoints:Int = serverA4PointsScoredRound4.last! + 1
                                    teamA5StartingPointRound4 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    
                                    serverA5PointsScoredRound4.append(startingPoints + serverA5PointsScoredRound4.count)
                                    serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst()) \(teamA5StartingPointRound2) \(serverA5PointsScoredRound2.dropFirst()) \(teamA5StartingPointRound3) \(serverA5PointsScoredRound3.dropFirst()) \(teamA5StartingPointRound4) \(serverA5PointsScoredRound4.dropFirst())"
                                    
                                    
                                    startB4Turn = false
                                    startB5Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    
                                    // Sixth Server
                                    if startA6Turn == true {
                                        
                                        
                                        
                                        let startingPoints:Int = serverA5PointsScoredRound4.last! + 1
                                        teamA6StartingPointRound4 = startingPoints
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA6PointsScoredRound4.append(startingPoints + serverA6PointsScoredRound4.count)
                                        serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst()) \(teamA6StartingPointRound2) \(serverA6PointsScoredRound2.dropFirst()) \(teamA6StartingPointRound3) \(serverA6PointsScoredRound3.dropFirst()) \(teamA6StartingPointRound4) \(serverA6PointsScoredRound4.dropFirst())"
                                        
                                        startB5Turn = false
                                        startB6Turn = true
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
            }
            
        } else if leftSideServes == false {
            // MARK: RIGHT SIDE SERVES FIRST
            if TeamARound1 == true {
                if startA1Turn == true {
                    let startingPoints:Int = 1
                    teamA1StartingPointRound1 = startingPoints
                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                    serverA1PointsScoredRound1.append(serverA1PointsScoredRound1.count + 1)
                    serverA1Label.text = "\(serverA1PointsScoredRound1)"
                    startB1Turn = false
                    startB2Turn = true
                } else {
                    if startA2Turn == true {
                        let startingPoints:Int = serverA1PointsScoredRound1.last! + 1
                        teamA2StartingPointRound1 = startingPoints
                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                        serverA2PointsScoredRound1.append(startingPoints + serverA2PointsScoredRound1.count)
                        serverA2Label.text = "\(startingPoints) \(serverA2PointsScoredRound1.dropFirst())"
                        startB2Turn = false
                        startB3Turn = true
                    } else {
                        if startA3Turn == true {
                            let startingPoints:Int = serverA2PointsScoredRound1.last! + 1
                            teamA3StartingPointRound1 = startingPoints
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            serverA3PointsScoredRound1.append(startingPoints + serverA3PointsScoredRound1.count)
                            serverA3Label.text = "\(startingPoints) \(serverA3PointsScoredRound1.dropFirst())"
                            startB3Turn = false
                            startB4Turn = true
                        }  else {
                            if startA4Turn == true {
                                let startingPoints:Int = serverA3PointsScoredRound1.last! + 1
                                teamA4StartingPointRound1 = startingPoints
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                serverA4PointsScoredRound1.append(startingPoints + serverA4PointsScoredRound1.count)
                                serverA4Label.text = "\(startingPoints) \(serverA4PointsScoredRound1.dropFirst())"
                                startB4Turn = false
                                startB5Turn = true
                            } else {
                                if startA5Turn == true {
                                    let startingPoints:Int = serverA4PointsScoredRound1.last! + 1
                                    teamA5StartingPointRound1 = startingPoints
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    serverA5PointsScoredRound1.append(startingPoints + serverA5PointsScoredRound1.count)
                                    serverA5Label.text = "\(startingPoints) \(serverA5PointsScoredRound1.dropFirst())"
                                    startB5Turn = false
                                    startB6Turn = true
                                } else {
                                    if startA6Turn == true {
                                        let startingPoints:Int = serverA5PointsScoredRound1.last! + 1
                                        teamA6StartingPointRound1 = startingPoints
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        serverA6PointsScoredRound1.append(startingPoints + serverA6PointsScoredRound1.count)
                                        serverA6Label.text = "\(startingPoints) \(serverA6PointsScoredRound1.dropFirst())"
                                        startB6Turn = false
                                        startB1Turn = true
                                        TeamBRound1 = false
                                        TeamBRound2 = true
                                        print("team A Round 6")
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                
                if TeamARound2 == true {
                    
                    print(" team a Round 2")
                    //MARK: TEAM A ROUND 2
                    //First Server
                    
                    if startA1Turn == true {
                        
                        
                        let startingPoints:Int = serverA6PointsScoredRound1.last! + 1
                        teamA1StartingPointRound2 = startingPoints
                        
                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                        serverA1PointsScoredRound2.append(startingPoints + serverA1PointsScoredRound2.count)
                        serverA1Label.text = "\(serverA1PointsScoredRound1) \(teamA1StartingPointRound2) \(serverA1PointsScoredRound2.dropFirst())"
                        print("\(serverA1PointsScoredRound2)")
                        print("\(serverA1PointsScoredRound1)")
                        print("\(teamA1StartingPointRound2)")
                        print("\(serverA1PointsScoredRound2.dropFirst())")
                        
                        startB1Turn = false
                        startB2Turn = true
                        
                        
                        
                    } else {
                        
                        
                        
                        //Second Server
                        
                        if startA2Turn == true {
                            
                            let startingPoints:Int = serverA1PointsScoredRound2.last! + 1
                            teamA2StartingPointRound2 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            
                            serverA2PointsScoredRound2.append(startingPoints + serverA2PointsScoredRound2.count)
                            serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA2PointsScoredRound2.dropFirst())"
                            
                            startB2Turn = false
                            startB3Turn = true
                            
                            
                            
                        } else {
                            
                            
                            //Third Server
                            
                            if startA3Turn == true {
                                
                                let startingPoints:Int = serverA2PointsScoredRound2.last! + 1
                                teamA3StartingPointRound2 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                serverA3PointsScoredRound2.append(startingPoints + serverA3PointsScoredRound2.count)
                                serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA3PointsScoredRound2.dropFirst())"
                                
                                startB3Turn = false
                                startB4Turn = true
                                
                            }  else {
                                
                                //Fourth Server
                                
                                if startA4Turn == true {
                                    
                                    let startingPoints:Int = serverA3PointsScoredRound2.last! + 1
                                    teamA4StartingPointRound2 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    
                                    serverA4PointsScoredRound2.append(startingPoints + serverA4PointsScoredRound2.count)
                                    serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA4PointsScoredRound2.dropFirst())"
                                    
                                    
                                    startB4Turn = false
                                    startB5Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    //Fifth Server
                                    if startA5Turn == true {
                                        let startingPoints:Int = serverA4PointsScoredRound2.last! + 1
                                        teamA5StartingPointRound2 = startingPoints
                                        
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA5PointsScoredRound2.append(startingPoints + serverA5PointsScoredRound2.count)
                                        serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA5PointsScoredRound2.dropFirst())"
                                        
                                        startB5Turn = false
                                        startB6Turn = true
                                        
                                        
                                    } else {
                                        
                                        
                                        // Sixth Server
                                        if startA6Turn == true {
                                            let startingPoints:Int = serverA5PointsScoredRound2.last! + 1
                                            teamA6StartingPointRound2 = startingPoints
                                            
                                            
                                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                            
                                            
                                            serverA6PointsScoredRound2.append(startingPoints + serverA6PointsScoredRound2.count)
                                            serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst()) \(startingPoints) \(serverA6PointsScoredRound2.dropFirst())"
                                            
                                            
                                            startB6Turn = false
                                            startB1Turn = true
                                            
                                            
                                            TeamBRound2 = false
                                            TeamBRound3 = true
                                            
                                            
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }  else {
                    
                    
                    //MARK: TEAM A ROUND 3
                    
                    if TeamARound3 == true {
                        
                        print("Team A round 3")
                        
                        
                        //First Server
                        if startA1Turn == true {
                            
                            
                            let startingPoints:Int = serverA6PointsScoredRound2.last! + 1
                            teamA1StartingPointRound3 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            print(serverA1PointsScoredRound3)
                            
                            
                            serverA1PointsScoredRound3.append(startingPoints + serverA1PointsScoredRound3.count)
                            serverA1Label.text = "\(serverA1PointsScoredRound1) \(teamA1StartingPointRound2) \(serverA1PointsScoredRound2.dropFirst()) \(teamA1StartingPointRound3) \(serverA1PointsScoredRound3.dropFirst())"
                            
                            startB1Turn = false
                            startB2Turn = true
                            
                            
                            
                        } else {
                            
                            
                            
                            //Second Server
                            
                            if startA2Turn == true {
                                
                                let startingPoints:Int = serverA1PointsScoredRound3.last! + 1
                                
                                teamA2StartingPointRound3 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                serverA2PointsScoredRound3.append(startingPoints + serverA2PointsScoredRound3.count)
                                serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst()) \(teamA2StartingPointRound2) \(serverA2PointsScoredRound2.dropFirst()) \(teamA2StartingPointRound3) \(serverA2PointsScoredRound3.dropFirst())"
                                
                                startB2Turn = false
                                startB3Turn = true
                                
                                
                            } else {
                                
                                
                                //Third Server
                                
                                if startA3Turn == true {
                                    
                                    
                                    
                                    let startingPoints:Int = serverA2PointsScoredRound3.last! + 1
                                    
                                    teamA3StartingPointRound3 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    serverA3PointsScoredRound3.append(startingPoints + serverA3PointsScoredRound3.count)
                                    serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst()) \(teamA3StartingPointRound2) \(serverA3PointsScoredRound2.dropFirst()) \(teamA3StartingPointRound3) \(serverA3PointsScoredRound3.dropFirst())"
                                    
                                    startB3Turn = false
                                    startB4Turn = true
                                    
                                    
                                    
                                }  else {
                                    
                                    //Fourth Server
                                    
                                    if startA4Turn == true {
                                        
                                        
                                        
                                        
                                        let startingPoints:Int = serverA3PointsScoredRound3.last! + 1
                                        teamA4StartingPointRound3 = startingPoints
                                        
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA4PointsScoredRound3.append(startingPoints + serverA4PointsScoredRound3.count)
                                        serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst()) \(teamA4StartingPointRound2) \(serverA4PointsScoredRound2.dropFirst()) \(teamA4StartingPointRound3) \(serverA4PointsScoredRound3.dropFirst())"
                                        
                                        startB4Turn = false
                                        startB5Turn = true
                                        
                                        
                                        
                                    } else {
                                        
                                        //Fifth Server
                                        if startA5Turn == true {
                                            
                                            
                                            let startingPoints:Int = serverA4PointsScoredRound3.last! + 1
                                            teamA5StartingPointRound3 = startingPoints
                                            
                                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                            
                                            
                                            serverA5PointsScoredRound3.append(startingPoints + serverA5PointsScoredRound3.count)
                                            serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst()) \(teamA5StartingPointRound2) \(serverA5PointsScoredRound2.dropFirst()) \(teamA5StartingPointRound3) \(serverA5PointsScoredRound3.dropFirst())"
                                            
                                            
                                            startB5Turn = false
                                            startB6Turn = true
                                            
                                            
                                            
                                        } else {
                                            
                                            
                                            // Sixth Server
                                            if startA6Turn == true {
                                                
                                                
                                                
                                                let startingPoints:Int = serverA5PointsScoredRound3.last! + 1
                                                teamA6StartingPointRound3 = startingPoints
                                                
                                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                                
                                                
                                                serverA6PointsScoredRound3.append(startingPoints + serverA6PointsScoredRound3.count)
                                                serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst()) \(teamA6StartingPointRound2) \(serverA6PointsScoredRound2.dropFirst()) \(teamA6StartingPointRound3) \(serverA6PointsScoredRound3.dropFirst())"
                                                
                                                startB6Turn = false
                                                startB1Turn = true
                                                
                                                TeamBRound3 = false
                                                TeamBRound4 = true
                                                
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
            
            
            // MARK: TEAM A ROUND 4
            if TeamARound4 == true {
                //First Server
                if startA1Turn == true {
                    
                    
                    let startingPoints:Int = serverA6PointsScoredRound3.last! + 1
                    teamA1StartingPointRound4 = startingPoints
                    
                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                    print(serverA1PointsScoredRound4)
                    
                    
                    serverA1PointsScoredRound4.append(startingPoints + serverA1PointsScoredRound4.count)
                    serverA1Label.text = "\(serverA1PointsScoredRound1) \(teamA1StartingPointRound2) \(serverA1PointsScoredRound2.dropFirst()) \(teamA1StartingPointRound3) \(serverA1PointsScoredRound3.dropFirst()) \(startingPoints) \(serverA1PointsScoredRound4.dropFirst())"
                    
                    startB1Turn = false
                    startB2Turn = true
                    
                    
                    
                } else {
                    
                    
                    
                    //Second Server
                    
                    if startA2Turn == true {
                        
                        let startingPoints:Int = serverA1PointsScoredRound4.last! + 1
                        
                        teamA2StartingPointRound4 = startingPoints
                        
                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                        
                        serverA2PointsScoredRound4.append(startingPoints + serverA2PointsScoredRound4.count)
                        serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst()) \(teamA2StartingPointRound2) \(serverA2PointsScoredRound2.dropFirst()) \(teamA2StartingPointRound3) \(serverA2PointsScoredRound3.dropFirst()) \(teamA2StartingPointRound4) \(serverA2PointsScoredRound4.dropFirst())"
                        
                        startB2Turn = false
                        startB3Turn = true
                        
                        
                    } else {
                        
                        
                        //Third Server
                        
                        if startA3Turn == true {
                            
                            
                            
                            let startingPoints:Int = serverA2PointsScoredRound4.last! + 1
                            
                            teamA3StartingPointRound4 = startingPoints
                            
                            TeamAPointsScored.append(TeamAPointsScored.count + 1)
                            teamATotalScore.text = "\(TeamAPointsScored.last!)"
                            
                            serverA3PointsScoredRound4.append(startingPoints + serverA3PointsScoredRound4.count)
                            serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst()) \(teamA3StartingPointRound2) \(serverA3PointsScoredRound2.dropFirst()) \(teamA3StartingPointRound3) \(serverA3PointsScoredRound3.dropFirst()) \(teamA3StartingPointRound4) \(serverA3PointsScoredRound4.dropFirst())"
                            
                            startB3Turn = false
                            startB4Turn = true
                            
                            
                            
                        }  else {
                            
                            //Fourth Server
                            
                            if startA4Turn == true {
                                
                                
                                
                                
                                let startingPoints:Int = serverA3PointsScoredRound4.last! + 1
                                teamA4StartingPointRound4 = startingPoints
                                
                                TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                
                                
                                serverA4PointsScoredRound4.append(startingPoints + serverA4PointsScoredRound4.count)
                                serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst()) \(teamA4StartingPointRound2) \(serverA4PointsScoredRound2.dropFirst()) \(teamA4StartingPointRound3) \(serverA4PointsScoredRound3.dropFirst()) \(teamA4StartingPointRound4) \(serverA4PointsScoredRound4.dropFirst())"
                                
                                startB4Turn = false
                                startB5Turn = true
                                
                                
                                
                            } else {
                                
                                //Fifth Server
                                if startA5Turn == true {
                                    
                                    
                                    let startingPoints:Int = serverA4PointsScoredRound4.last! + 1
                                    teamA5StartingPointRound4 = startingPoints
                                    
                                    TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                    teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                    
                                    
                                    serverA5PointsScoredRound4.append(startingPoints + serverA5PointsScoredRound4.count)
                                    serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst()) \(teamA5StartingPointRound2) \(serverA5PointsScoredRound2.dropFirst()) \(teamA5StartingPointRound3) \(serverA5PointsScoredRound3.dropFirst()) \(teamA5StartingPointRound4) \(serverA5PointsScoredRound4.dropFirst())"
                                    
                                    
                                    startB5Turn = false
                                    startB6Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    
                                    // Sixth Server
                                    if startA6Turn == true {
                                        
                                        
                                        
                                        let startingPoints:Int = serverA5PointsScoredRound4.last! + 1
                                        teamA6StartingPointRound4 = startingPoints
                                        
                                        TeamAPointsScored.append(TeamAPointsScored.count + 1)
                                        teamATotalScore.text = "\(TeamAPointsScored.last!)"
                                        
                                        
                                        serverA6PointsScoredRound4.append(startingPoints + serverA6PointsScoredRound4.count)
                                        serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst()) \(teamA6StartingPointRound2) \(serverA6PointsScoredRound2.dropFirst()) \(teamA6StartingPointRound3) \(serverA6PointsScoredRound3.dropFirst()) \(teamA6StartingPointRound4) \(serverA6PointsScoredRound4.dropFirst())"
                                        
                                        startB6Turn = false
                                        startB1Turn = true
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
            }
        }
        
    }
    
    //MARK: Right Team Button
    
    @IBAction func teamBPlusOnePoint(sender: AnyObject) {
        
        // MARK: TEAM B ROUND 1
        // MAKR: LEFT SIDE SERVES FIRST:
        
        if leftSideServes == true {
            
            if TeamBRound1 == true {
                //First Server
                if startB1Turn == true {
                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                    serverB1PointsScoredRound1.append(serverB1PointsScoredRound1.count + 1)
                    serverB1Label.text = "\(serverB1PointsScoredRound1)"
                    startA1Turn = false
                    startA2Turn = true
                    
                } else {
                    //Second Server
                    
                    if startB2Turn == true {
                        let startingPoints:Int = serverB1PointsScoredRound1.last! + 1
                        teamB2StartingPointRound1 = startingPoints
                        
                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                        
                        serverB2PointsScoredRound1.append(startingPoints + serverB2PointsScoredRound1.count)
                        serverB2Label.text = "\(startingPoints) \(serverB2PointsScoredRound1.dropFirst())"
                        
                        startA2Turn = false
                        startA3Turn = true
                        
                    } else {
                        
                        
                        //Third Server
                        
                        if startB3Turn == true {
                            
                            
                            
                            let startingPoints:Int = serverB2PointsScoredRound1.last! + 1
                            
                            teamB3StartingPointRound1 = startingPoints
                            
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            
                            serverB3PointsScoredRound1.append(startingPoints + serverB3PointsScoredRound1.count)
                            serverB3Label.text = "\(startingPoints) \(serverB3PointsScoredRound1.dropFirst())"
                            
                            startA3Turn = false
                            startA4Turn = true
                            
                            
                            
                            
                        }  else {
                            
                            //Fourth Server
                            
                            if startB4Turn == true {
                                
                                
                                
                                let startingPoints:Int = serverB3PointsScoredRound1.last! + 1
                                teamB4StartingPointRound1 = startingPoints
                                
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                
                                
                                serverB4PointsScoredRound1.append(startingPoints + serverB4PointsScoredRound1.count)
                                serverB4Label.text = "\(startingPoints) \(serverB4PointsScoredRound1.dropFirst())"
                                
                                
                                startA4Turn = false
                                startA5Turn = true
                                
                            } else {
                                
                                //Fifth Server
                                if startB5Turn == true {
                                    
                                    
                                    let startingPoints:Int = serverB4PointsScoredRound1.last! + 1
                                    teamB5StartingPointRound1 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    
                                    serverB5PointsScoredRound1.append(startingPoints + serverB5PointsScoredRound1.count)
                                    serverB5Label.text = "\(startingPoints) \(serverB5PointsScoredRound1.dropFirst())"
                                    
                                    
                                    startA5Turn = false
                                    startA6Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    
                                    // Sixth Server
                                    if startB6Turn == true {
                                        
                                        
                                        
                                        let startingPoints:Int = serverB5PointsScoredRound1.last! + 1
                                        teamB6StartingPointRound1 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB6PointsScoredRound1.append(startingPoints + serverB6PointsScoredRound1.count)
                                        serverB6Label.text = "\(startingPoints) \(serverB6PointsScoredRound1.dropFirst())"
                                        
                                        
                                        startA6Turn = false
                                        startA1Turn = true
                                        
                                        TeamARound1 = false
                                        TeamARound2 = true
                                        
                                        
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
                
            } else {
                
                if TeamBRound2 == true {
                    
                    print("Round 2")
                    
                    
                    //MARK: TEAM B ROUND 2
                    
                    
                    //First Server
                    
                    if startB1Turn == true {
                        
                        let startingPoints:Int = serverB6PointsScoredRound1.last! + 1
                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                        teamB1StartingPointRound2 = startingPoints
                        
                        serverB1PointsScoredRound2.append(startingPoints + serverB1PointsScoredRound2.count)
                        serverB1Label.text = "\(serverB1PointsScoredRound1) \(startingPoints) \(serverB1PointsScoredRound2.dropFirst())"
                        
                        startA1Turn = false
                        startA2Turn = true
                        
                        print("B1R2")
                        
                        
                    } else {
                        
                        
                        
                        //Second Server
                        
                        if startB2Turn == true {
                            
                            let startingPoints:Int = serverB1PointsScoredRound2.last! + 1
                            teamB2StartingPointRound2 = startingPoints
                            
                            
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            
                            serverB2PointsScoredRound2.append(startingPoints + serverB2PointsScoredRound2.count)
                            serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB2PointsScoredRound2.dropFirst())"
                            
                            startA2Turn = false
                            startA3Turn = true
                            
                            print("b2R2")
                            
                        } else {
                            
                            
                            //Third Server
                            
                            if startB3Turn == true {
                                
                                let startingPoints:Int = serverB2PointsScoredRound2.last! + 1
                                teamB3StartingPointRound2 = startingPoints
                                
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                
                                serverB3PointsScoredRound2.append(startingPoints + serverB3PointsScoredRound2.count)
                                serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB3PointsScoredRound2.dropFirst())"
                                
                                startA3Turn = false
                                startA4Turn = true
                                
                            }  else {
                                
                                //Fourth Server
                                
                                if startB4Turn == true {
                                    
                                    let startingPoints:Int = serverB3PointsScoredRound2.last! + 1
                                    teamB4StartingPointRound2 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    
                                    serverB4PointsScoredRound2.append(startingPoints + serverB4PointsScoredRound2.count)
                                    serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB4PointsScoredRound2.dropFirst())"
                                    
                                    
                                    startA4Turn = false
                                    startA5Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    //Fifth Server
                                    if startB5Turn == true {
                                        let startingPoints:Int = serverB4PointsScoredRound2.last! + 1
                                        teamB5StartingPointRound2 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB5PointsScoredRound2.append(startingPoints + serverB5PointsScoredRound2.count)
                                        serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB5PointsScoredRound2.dropFirst())"
                                        
                                        
                                        startA5Turn = false
                                        startA6Turn = true
                                        
                                        
                                    } else {
                                        
                                        
                                        // Sixth Server
                                        if startB6Turn == true {
                                            let startingPoints:Int = serverB5PointsScoredRound2.last! + 1
                                            teamB6StartingPointRound2 = startingPoints
                                            
                                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                            
                                            
                                            serverB6PointsScoredRound2.append(startingPoints + serverB6PointsScoredRound2.count)
                                            serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB6PointsScoredRound2.dropFirst())"
                                            
                                            
                                            startA6Turn = false
                                            startA1Turn = true
                                            TeamARound2 = false
                                            TeamARound3 = true
                                            
                                            
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }  else {
                    
                    //MARK: TEAM B ROUND 3
                    
                    if TeamBRound3 == true {
                        
                        print("Team A round 3")
                        
                        
                        //First Server
                        if startB1Turn == true {
                            
                            
                            let startingPoints:Int = serverB6PointsScoredRound2.last! + 1
                            teamB1StartingPointRound3 = startingPoints
                            
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            print(serverB1PointsScoredRound3)
                            
                            
                            serverB1PointsScoredRound3.append(startingPoints + serverB1PointsScoredRound3.count)
                            serverB1Label.text = "\(serverB1PointsScoredRound1) \(teamB1StartingPointRound2) \(serverB1PointsScoredRound2.dropFirst()) \(teamB1StartingPointRound3) \(serverB1PointsScoredRound3.dropFirst())"
                            
                            startA1Turn = false
                            startA2Turn = true
                            
                            
                            
                        } else {
                            
                            
                            
                            //Second Server
                            
                            if startB2Turn == true {
                                
                                let startingPoints:Int = serverB1PointsScoredRound3.last! + 1
                                
                                teamB2StartingPointRound3 = startingPoints
                                print(startingPoints)
                                print(serverB2PointsScoredRound3)
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                
                                serverB2PointsScoredRound3.append(startingPoints + serverB2PointsScoredRound3.count)
                                serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(teamB2StartingPointRound2) \(serverB2PointsScoredRound2.dropFirst()) \(teamB2StartingPointRound3) \(serverB2PointsScoredRound3.dropFirst())"
                                
                                startA2Turn = false
                                startA3Turn = true
                                
                                
                            } else {
                                
                                
                                //Third Server
                                
                                if startB3Turn == true {
                                    
                                    
                                    
                                    let startingPoints:Int = serverB2PointsScoredRound3.last! + 1
                                    
                                    teamB3StartingPointRound3 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    serverB3PointsScoredRound3.append(startingPoints + serverB3PointsScoredRound3.count)
                                    serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst()) \(teamB3StartingPointRound2) \(serverB3PointsScoredRound2.dropFirst()) \(teamB3StartingPointRound3) \(serverB3PointsScoredRound3.dropFirst())"
                                    
                                    startA3Turn = false
                                    startA4Turn = true
                                    
                                    
                                    
                                }  else {
                                    
                                    //Fourth Server
                                    
                                    if startB4Turn == true {
                                        
                                        
                                        
                                        
                                        let startingPoints:Int = serverB3PointsScoredRound3.last! + 1
                                        teamB4StartingPointRound3 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB4PointsScoredRound3.append(startingPoints + serverB4PointsScoredRound3.count)
                                        serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst()) \(teamB4StartingPointRound2) \(serverB4PointsScoredRound2.dropFirst()) \(teamB4StartingPointRound3) \(serverB4PointsScoredRound3.dropFirst())"
                                        
                                        startA4Turn = false
                                        startA5Turn = true
                                        
                                        
                                        
                                    } else {
                                        
                                        //Fifth Server
                                        if startB5Turn == true {
                                            
                                            
                                            let startingPoints:Int = serverB4PointsScoredRound3.last! + 1
                                            teamB5StartingPointRound3 = startingPoints
                                            
                                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                            
                                            
                                            serverB5PointsScoredRound3.append(startingPoints + serverB5PointsScoredRound3.count)
                                            serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst()) \(teamB5StartingPointRound2) \(serverB5PointsScoredRound2.dropFirst()) \(teamB5StartingPointRound3) \(serverB5PointsScoredRound3.dropFirst())"
                                            
                                            
                                            startA5Turn = false
                                            startA6Turn = true
                                            
                                            
                                            
                                        } else {
                                            
                                            
                                            // Sixth Server
                                            if startB6Turn == true {
                                                
                                                
                                                
                                                let startingPoints:Int = serverB5PointsScoredRound3.last! + 1
                                                teamB6StartingPointRound3 = startingPoints
                                                
                                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                                
                                                
                                                serverB6PointsScoredRound3.append(startingPoints + serverB6PointsScoredRound3.count)
                                                serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst()) \(teamB6StartingPointRound2) \(serverB6PointsScoredRound2.dropFirst()) \(teamB6StartingPointRound3) \(serverB6PointsScoredRound3.dropFirst())"
                                                
                                                startA6Turn = false
                                                startA1Turn = true
                                                TeamARound3 = false
                                                TeamARound4 = true
                                                
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                        
                        
                        
                    }
                }
            }
            
            // MARK: TEAM B ROUND 4
            if TeamBRound4 == true {
                
                print("Team B round 4")
                
                
                //First Server
                if startB1Turn == true {
                    
                    
                    let startingPoints:Int = serverB6PointsScoredRound3.last! + 1
                    teamB1StartingPointRound4 = startingPoints
                    
                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                    print(serverB1PointsScoredRound4)
                    
                    
                    serverB1PointsScoredRound4.append(startingPoints + serverB1PointsScoredRound4.count)
                    serverB1Label.text = "\(serverB1PointsScoredRound1) \(teamB1StartingPointRound2) \(serverB1PointsScoredRound2.dropFirst()) \(teamB1StartingPointRound3) \(serverB1PointsScoredRound3.dropFirst()) \(teamB1StartingPointRound4) \(serverB1PointsScoredRound4.dropFirst())"
                    
                    startA1Turn = false
                    startA2Turn = true
                    
                    
                    
                } else {
                    
                    
                    
                    //Second Server
                    
                    if startB2Turn == true {
                        
                        let startingPoints:Int = serverB1PointsScoredRound4.last! + 1
                        
                        teamB2StartingPointRound4 = startingPoints
                        
                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                        
                        serverB2PointsScoredRound4.append(startingPoints + serverB2PointsScoredRound4.count)
                        serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(teamB2StartingPointRound2) \(serverB2PointsScoredRound2.dropFirst()) \(teamB2StartingPointRound3) \(serverB2PointsScoredRound3.dropFirst()) \(teamB2StartingPointRound4) \(serverB2PointsScoredRound4.dropFirst())"
                        
                        startA2Turn = false
                        startA3Turn = true
                        
                        
                    } else {
                        
                        
                        //Third Server
                        
                        if startB3Turn == true {
                            
                            
                            
                            let startingPoints:Int = serverB2PointsScoredRound4.last! + 1
                            
                            teamB3StartingPointRound4 = startingPoints
                            
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            
                            serverB3PointsScoredRound4.append(startingPoints + serverB3PointsScoredRound4.count)
                            serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst()) \(teamB3StartingPointRound2) \(serverB3PointsScoredRound2.dropFirst()) \(teamB3StartingPointRound3) \(serverB3PointsScoredRound3.dropFirst()) \(teamB3StartingPointRound4) \(serverB3PointsScoredRound4.dropFirst())"
                            
                            startA3Turn = false
                            startA4Turn = true
                            
                            
                            
                        }  else {
                            
                            //Fourth Server
                            
                            if startB4Turn == true {
                                
                                
                                
                                
                                let startingPoints:Int = serverB3PointsScoredRound4.last! + 1
                                teamB4StartingPointRound4 = startingPoints
                                
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                
                                
                                serverB4PointsScoredRound4.append(startingPoints + serverB4PointsScoredRound4.count)
                                serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst()) \(teamB4StartingPointRound2) \(serverB4PointsScoredRound2.dropFirst()) \(teamB4StartingPointRound3) \(serverB4PointsScoredRound3.dropFirst()) \(teamB4StartingPointRound4) \(serverB4PointsScoredRound4.dropFirst())"
                                
                                startA4Turn = false
                                startA5Turn = true
                                
                                
                                
                            } else {
                                
                                //Fifth Server
                                if startB5Turn == true {
                                    
                                    
                                    let startingPoints:Int = serverB4PointsScoredRound4.last! + 1
                                    teamB5StartingPointRound4 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    
                                    serverB5PointsScoredRound4.append(startingPoints + serverB5PointsScoredRound4.count)
                                    serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst()) \(teamB5StartingPointRound2) \(serverB5PointsScoredRound2.dropFirst()) \(teamB5StartingPointRound3) \(serverB5PointsScoredRound3.dropFirst()) \(teamB5StartingPointRound4) \(serverB5PointsScoredRound4.dropFirst())"
                                    
                                    
                                    startA5Turn = false
                                    startA6Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    
                                    // Sixth Server
                                    if startB6Turn == true {
                                        
                                        let startingPoints:Int = serverB5PointsScoredRound4.last! + 1
                                        teamB6StartingPointRound4 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB6PointsScoredRound4.append(startingPoints + serverB6PointsScoredRound4.count)
                                        serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst()) \(teamB6StartingPointRound2) \(serverB6PointsScoredRound2.dropFirst()) \(teamB6StartingPointRound3) \(serverB6PointsScoredRound3.dropFirst()) \(teamB6StartingPointRound4) \(serverB6PointsScoredRound4.dropFirst())"
                                        
                                        print(teamB6StartingPointRound4)
                                        print(serverB6PointsScoredRound4)
                                        
                                        startA6Turn = false
                                        startA1Turn = true
                                        TeamARound3 = false
                                        TeamARound4 = true
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
            }
            
            
        }
        
        if leftSideServes == false {
            //RIGHT SIDE SERVES FIRST
            if TeamBRound1 == true {
                //First Server
                if startB1Turn == true {
                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                    teamB1StartingPointRound1 = Int(1)
                    serverB1PointsScoredRound1.append(serverB1PointsScoredRound1.count + 1)
                    serverB1Label.text = "\(serverB1PointsScoredRound1)"
                    startA6Turn = false
                    startA1Turn = true
                } else {
                    //Second Server
                    if startB2Turn == true {
                        if serverB1PointsScoredRound1.count > 0 {
                            let startingPoints:Int = serverB1PointsScoredRound1.last! + 1
                            teamB2StartingPointRound1 = startingPoints
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            serverB2PointsScoredRound1.append(startingPoints + serverB2PointsScoredRound1.count)
                            serverB2Label.text = "\(startingPoints) \(serverB2PointsScoredRound1.dropFirst())"
                            startA1Turn = false
                            startA2Turn = true
                            print("else 1 \(teamB2StartingPointRound1)")
                        } else {
                            let startingPoints:Int = 1
                            teamB2StartingPointRound1 = startingPoints
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            serverB2PointsScoredRound1.append(serverB2PointsScoredRound1.count + 1)
                            serverB2Label.text = "\(serverB2PointsScoredRound1)"
                            startA1Turn = false
                            startA2Turn = true
                            print("else 2 \(teamB2StartingPointRound1)")
                        }
                        
                    } else {
                        if startB3Turn == true {
                            let startingPoints:Int = serverB2PointsScoredRound1.last! + 1
                            teamB3StartingPointRound1 = startingPoints
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            serverB3PointsScoredRound1.append(startingPoints + serverB3PointsScoredRound1.count)
                            serverB3Label.text = "\(startingPoints) \(serverB3PointsScoredRound1.dropFirst())"
                            startA2Turn = false
                            startA3Turn = true
                        }  else {
                            if startB4Turn == true {
                                let startingPoints:Int = serverB3PointsScoredRound1.last! + 1
                                teamB4StartingPointRound1 = startingPoints
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                serverB4PointsScoredRound1.append(startingPoints + serverB4PointsScoredRound1.count)
                                serverB4Label.text = "\(startingPoints) \(serverB4PointsScoredRound1.dropFirst())"
                                startA3Turn = false
                                startA4Turn = true
                            } else {
                                if startB5Turn == true {
                                    let startingPoints:Int = serverB4PointsScoredRound1.last! + 1
                                    teamB5StartingPointRound1 = startingPoints
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    serverB5PointsScoredRound1.append(startingPoints + serverB5PointsScoredRound1.count)
                                    serverB5Label.text = "\(startingPoints) \(serverB5PointsScoredRound1.dropFirst())"
                                    startA4Turn = false
                                    startA5Turn = true
                                } else {
                                    if startB6Turn == true {
                                        let startingPoints:Int = serverB5PointsScoredRound1.last! + 1
                                        teamB6StartingPointRound1 = startingPoints
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        serverB6PointsScoredRound1.append(startingPoints + serverB6PointsScoredRound1.count)
                                        serverB6Label.text = "\(startingPoints) \(serverB6PointsScoredRound1.dropFirst())"
                                        startA5Turn = false
                                        startA6Turn = true
                                    }
                                }
                                
                            }
                        }
                    }
                }
                
            } else {
                
                if TeamBRound2 == true {
                    
                    print("Round 2")
                    //MARK: TEAM B ROUND 2
                    
                    
                    //First Server
                    
                    if startB1Turn == true {
                        
                        let startingPoints:Int = serverB6PointsScoredRound1.last! + 1
                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                        teamB1StartingPointRound2 = startingPoints
                        
                        serverB1PointsScoredRound2.append(startingPoints + serverB1PointsScoredRound2.count)
                        serverB1Label.text = "\(serverB1PointsScoredRound1) \(startingPoints) \(serverB1PointsScoredRound2.dropFirst())"
                        
                        startA6Turn = false
                        startA1Turn = true
                        TeamARound1 = false
                        TeamARound2 = true
                        print("b1r2")
                        
                    } else {
                        
                        //Second Server
                        
                        if startB2Turn == true {
                            
                            let startingPoints:Int = serverB1PointsScoredRound2.last! + 1
                            teamB2StartingPointRound2 = startingPoints
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            serverB2PointsScoredRound2.append(startingPoints + serverB2PointsScoredRound2.count)
                            serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB2PointsScoredRound2.dropFirst())"
                            print("\(teamB2StartingPointRound1)")
                            startA1Turn = false
                            startA2Turn = true
                            
                            print("b2r2")
                            
                        } else {
                            
                            
                            //Third Server
                            
                            if startB3Turn == true {
                                
                                let startingPoints:Int = serverB2PointsScoredRound2.last! + 1
                                teamB3StartingPointRound2 = startingPoints
                                
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                
                                serverB3PointsScoredRound2.append(startingPoints + serverB3PointsScoredRound2.count)
                                serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB3PointsScoredRound2.dropFirst())"
                                
                                startA2Turn = false
                                startA3Turn = true
                                
                            }  else {
                                
                                //Fourth Server
                                
                                if startB4Turn == true {
                                    
                                    let startingPoints:Int = serverB3PointsScoredRound2.last! + 1
                                    teamB4StartingPointRound2 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    
                                    serverB4PointsScoredRound2.append(startingPoints + serverB4PointsScoredRound2.count)
                                    serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB4PointsScoredRound2.dropFirst())"
                                    
                                    
                                    startA3Turn = false
                                    startA4Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    //Fifth Server
                                    if startB5Turn == true {
                                        let startingPoints:Int = serverB4PointsScoredRound2.last! + 1
                                        teamB5StartingPointRound2 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB5PointsScoredRound2.append(startingPoints + serverB5PointsScoredRound2.count)
                                        serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB5PointsScoredRound2.dropFirst())"
                                        
                                        
                                        startA4Turn = false
                                        startA5Turn = true
                                        
                                        
                                    } else {
                                        
                                        
                                        // Sixth Server
                                        if startB6Turn == true {
                                            let startingPoints:Int = serverB5PointsScoredRound2.last! + 1
                                            teamB6StartingPointRound2 = startingPoints
                                            
                                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                            
                                            
                                            serverB6PointsScoredRound2.append(startingPoints + serverB6PointsScoredRound2.count)
                                            serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst()) \(startingPoints) \(serverB6PointsScoredRound2.dropFirst())"
                                            
                                            
                                            startA5Turn = false
                                            startA6Turn = true
                                            
                                            
                                            
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }  else {
                    
                    
                    
                    //MARK: TEAM B ROUND 3
                    
                    if TeamBRound3 == true {
                        //First Server
                        if startB1Turn == true {
                            let startingPoints:Int = serverB6PointsScoredRound2.last! + 1
                            teamB1StartingPointRound3 = startingPoints
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            serverB1PointsScoredRound3.append(startingPoints + serverB1PointsScoredRound3.count)
                            serverB1Label.text = "\(serverB1PointsScoredRound1) \(teamB1StartingPointRound2) \(serverB1PointsScoredRound2.dropFirst()) \(teamB1StartingPointRound3) \(serverB1PointsScoredRound3.dropFirst())"
                            startA6Turn = false
                            startA1Turn = true
                            TeamARound2 = false
                            TeamARound3 = true
                            
                        } else {
                            
                            
                            
                            //Second Server
                            
                            if startB2Turn == true {
                                
                                let startingPoints:Int = serverB1PointsScoredRound3.last! + 1
                                
                                teamB2StartingPointRound3 = startingPoints
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                serverB2PointsScoredRound3.append(startingPoints + serverB2PointsScoredRound3.count)
                                serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(teamB2StartingPointRound2) \(serverB2PointsScoredRound2.dropFirst()) \(teamB2StartingPointRound3) \(serverB2PointsScoredRound3.dropFirst())"
                                
                                startA1Turn = false
                                startA2Turn = true
                                
                                
                            } else {
                                
                                
                                //Third Server
                                
                                if startB3Turn == true {
                                    
                                    
                                    
                                    let startingPoints:Int = serverB2PointsScoredRound3.last! + 1
                                    
                                    teamB3StartingPointRound3 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    serverB3PointsScoredRound3.append(startingPoints + serverB3PointsScoredRound3.count)
                                    serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst()) \(teamB3StartingPointRound2) \(serverB3PointsScoredRound2.dropFirst()) \(teamB3StartingPointRound3) \(serverB3PointsScoredRound3.dropFirst())"
                                    
                                    startA2Turn = false
                                    startA3Turn = true
                                    
                                    
                                    
                                }  else {
                                    
                                    //Fourth Server
                                    
                                    if startB4Turn == true {
                                        
                                        
                                        
                                        
                                        let startingPoints:Int = serverB3PointsScoredRound3.last! + 1
                                        teamB4StartingPointRound3 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB4PointsScoredRound3.append(startingPoints + serverB4PointsScoredRound3.count)
                                        serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst()) \(teamB4StartingPointRound2) \(serverB4PointsScoredRound2.dropFirst()) \(teamB4StartingPointRound3) \(serverB4PointsScoredRound3.dropFirst())"
                                        
                                        startA3Turn = false
                                        startA4Turn = true
                                        
                                        
                                        
                                    } else {
                                        
                                        //Fifth Server
                                        if startB5Turn == true {
                                            
                                            
                                            let startingPoints:Int = serverB4PointsScoredRound3.last! + 1
                                            teamB5StartingPointRound3 = startingPoints
                                            
                                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                            
                                            
                                            serverB5PointsScoredRound3.append(startingPoints + serverB5PointsScoredRound3.count)
                                            serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst()) \(teamB5StartingPointRound2) \(serverB5PointsScoredRound2.dropFirst()) \(teamB5StartingPointRound3) \(serverB5PointsScoredRound3.dropFirst())"
                                            
                                            
                                            startA4Turn = false
                                            startA5Turn = true
                                            
                                            
                                            
                                        } else {
                                            
                                            
                                            // Sixth Server
                                            if startB6Turn == true {
                                                
                                                
                                                
                                                let startingPoints:Int = serverB5PointsScoredRound3.last! + 1
                                                teamB6StartingPointRound3 = startingPoints
                                                
                                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                                
                                                
                                                serverB6PointsScoredRound3.append(startingPoints + serverB6PointsScoredRound3.count)
                                                serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst()) \(teamB6StartingPointRound2) \(serverB6PointsScoredRound2.dropFirst()) \(teamB6StartingPointRound3) \(serverB6PointsScoredRound3.dropFirst())"
                                                
                                                startA5Turn = false
                                                startA6Turn = true
                                                
                                                
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                        
                        
                        
                    }
                }
            }
            
            // MARK: TEAM B ROUND 4
            if TeamBRound4 == true {
                
                print("Team B round 4")
                
                
                //First Server
                if startB1Turn == true {
                    
                    
                    let startingPoints:Int = serverB6PointsScoredRound3.last! + 1
                    teamB1StartingPointRound4 = startingPoints
                    
                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                    print(serverB1PointsScoredRound4)
                    
                    
                    serverB1PointsScoredRound4.append(startingPoints + serverB1PointsScoredRound4.count)
                    serverB1Label.text = "\(serverB1PointsScoredRound1) \(teamB1StartingPointRound2) \(serverB1PointsScoredRound2.dropFirst()) \(teamB1StartingPointRound3) \(serverB1PointsScoredRound3.dropFirst()) \(teamB1StartingPointRound4) \(serverB1PointsScoredRound4.dropFirst())"
                    
                    startA6Turn = false
                    startA1Turn = true
                    
                    TeamARound3 = false
                    TeamARound4 = true
                    
                    
                } else {
                    
                    
                    
                    //Second Server
                    
                    if startB2Turn == true {
                        
                        let startingPoints:Int = serverB1PointsScoredRound4.last! + 1
                        
                        teamB2StartingPointRound4 = startingPoints
                        
                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                        
                        serverB2PointsScoredRound4.append(startingPoints + serverB2PointsScoredRound4.count)
                        serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(teamB2StartingPointRound2) \(serverB2PointsScoredRound2.dropFirst()) \(teamB2StartingPointRound3) \(serverB2PointsScoredRound3.dropFirst()) \(teamB2StartingPointRound4) \(serverB2PointsScoredRound4.dropFirst())"
                        
                        startA1Turn = false
                        startA2Turn = true
                        
                        
                    } else {
                        
                        
                        //Third Server
                        
                        if startB3Turn == true {
                            
                            
                            
                            let startingPoints:Int = serverB2PointsScoredRound4.last! + 1
                            
                            teamB3StartingPointRound4 = startingPoints
                            
                            TeamBPointsScored.append(TeamBPointsScored.count + 1)
                            teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                            
                            serverB3PointsScoredRound4.append(startingPoints + serverB3PointsScoredRound4.count)
                            serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst()) \(teamB3StartingPointRound2) \(serverB3PointsScoredRound2.dropFirst()) \(teamB3StartingPointRound3) \(serverB3PointsScoredRound3.dropFirst()) \(teamB3StartingPointRound4) \(serverB3PointsScoredRound4.dropFirst())"
                            
                            startA2Turn = false
                            startA3Turn = true
                            
                            
                            
                        }  else {
                            
                            //Fourth Server
                            
                            if startB4Turn == true {
                                
                                
                                
                                
                                let startingPoints:Int = serverB3PointsScoredRound4.last! + 1
                                teamB4StartingPointRound4 = startingPoints
                                
                                TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                
                                
                                serverB4PointsScoredRound4.append(startingPoints + serverB4PointsScoredRound4.count)
                                serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst()) \(teamB4StartingPointRound2) \(serverB4PointsScoredRound2.dropFirst()) \(teamB4StartingPointRound3) \(serverB4PointsScoredRound3.dropFirst()) \(teamB4StartingPointRound4) \(serverB4PointsScoredRound4.dropFirst())"
                                
                                startA3Turn = false
                                startA4Turn = true
                                
                                
                                
                            } else {
                                
                                //Fifth Server
                                if startB5Turn == true {
                                    
                                    
                                    let startingPoints:Int = serverB4PointsScoredRound4.last! + 1
                                    teamB5StartingPointRound4 = startingPoints
                                    
                                    TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                    teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                    
                                    
                                    serverB5PointsScoredRound4.append(startingPoints + serverB5PointsScoredRound4.count)
                                    serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst()) \(teamB5StartingPointRound2) \(serverB5PointsScoredRound2.dropFirst()) \(teamB5StartingPointRound3) \(serverB5PointsScoredRound3.dropFirst()) \(teamB5StartingPointRound4) \(serverB5PointsScoredRound4.dropFirst())"
                                    
                                    
                                    startA4Turn = false
                                    startA5Turn = true
                                    
                                    
                                    
                                } else {
                                    
                                    
                                    // Sixth Server
                                    if startB6Turn == true {
                                        
                                        let startingPoints:Int = serverB5PointsScoredRound4.last! + 1
                                        teamB6StartingPointRound4 = startingPoints
                                        
                                        TeamBPointsScored.append(TeamBPointsScored.count + 1)
                                        teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                                        
                                        
                                        serverB6PointsScoredRound4.append(startingPoints + serverB6PointsScoredRound4.count)
                                        serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst()) \(teamB6StartingPointRound2) \(serverB6PointsScoredRound2.dropFirst()) \(teamB6StartingPointRound3) \(serverB6PointsScoredRound3.dropFirst()) \(teamB6StartingPointRound4) \(serverB6PointsScoredRound4.dropFirst())"
                                        
                                        print(teamB6StartingPointRound4)
                                        print(serverB6PointsScoredRound4)
                                        
                                        startA5Turn = false
                                        startA6Turn = true
                                        //  TeamARound3 = false
                                        // TeamARound4 = true
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    //MARK: SUBSTITUTIONS
    
    var lineupA1: [String] = []
    var lineupA2: [String] = []
    var lineupA3: [String] = []
    var lineupA4: [String] = []
    var lineupA5: [String] = []
    var lineupA6: [String] = []
    
    var lineupB1: [String] = []
    var lineupB2: [String] = []
    var lineupB3: [String] = []
    var lineupB4: [String] = []
    var lineupB5: [String] = []
    var lineupB6: [String] = []
    
    
    @IBOutlet var correctServerLeft1: UILabel!
    @IBOutlet var correctServerLeft2: UILabel!
    @IBOutlet var correctServerLeft3: UILabel!
    @IBOutlet var correctServerLeft4: UILabel!
    @IBOutlet var correctServerLeft5: UILabel!
    @IBOutlet var correctServerLeft6: UILabel!
    
    @IBOutlet var correctServerRight1: UILabel!
    @IBOutlet var correctServerRight2: UILabel!
    @IBOutlet var correctServerRight3: UILabel!
    @IBOutlet var correctServerRight4: UILabel!
    @IBOutlet var correctServerRight5: UILabel!
    @IBOutlet var correctServerRight6: UILabel!
    
    //MARK: SUBSITUTIONS
    
    @IBAction func substitutionButtonA1(sender: AnyObject) {
        
        let pretty = lineupA1.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
            
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupA2.contains(sub1.text!) || self.lineupA3.contains(sub1.text!) || self.lineupA4.contains(sub1.text!) || self.lineupA5.contains(sub1.text!) || self.lineupA6.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupA1.append(sub1.text!)
                for i in self.lineupA1 {
                    print("# \(i)")
                    self.correctServerLeft1.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    @IBAction func substitutionButtonA2(sender: AnyObject) {
        
        let pretty = lineupA2.prettyPrinted
        print(pretty)
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
            
        }
        
        //CANCEL BUTTON
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        // SAVE BUTTON
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            let sub1 = subAlert.textFields![0] as UITextField;
            
            if self.lineupA1.contains(sub1.text!) || self.lineupA3.contains(sub1.text!) || self.lineupA4.contains(sub1.text!) || self.lineupA5.contains(sub1.text!) || self.lineupA6.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
            } else {
                
                self.lineupA2.append(sub1.text!)
                
                
                for i in self.lineupA2 {
                    print("# \(i)")
                    self.correctServerLeft2.text = "\(i)"
                }
                
                
            }
        } ))
        
        
        
        self.presentViewController(subAlert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func substitutionButtonA3(sender: AnyObject) {
        
        let pretty = lineupA3.prettyPrinted
        print(pretty)
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupA1.contains(sub1.text!) || self.lineupA2.contains(sub1.text!) || self.lineupA4.contains(sub1.text!) || self.lineupA5.contains(sub1.text!) || self.lineupA6.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupA3.append(sub1.text!)
                for i in self.lineupA3 {
                    print("# \(i)")
                    self.correctServerLeft3.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
    @IBAction func substitutionButtonA4(sender: AnyObject) {
        
        let pretty = lineupA4.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupA1.contains(sub1.text!) || self.lineupA2.contains(sub1.text!) || self.lineupA3.contains(sub1.text!) || self.lineupA5.contains(sub1.text!) || self.lineupA6.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupA4.append(sub1.text!)
                for i in self.lineupA4 {
                    print("# \(i)")
                    self.correctServerLeft4.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    @IBAction func substitutionButtonA5(sender: AnyObject) {
        
        let pretty = lineupA5.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupA1.contains(sub1.text!) || self.lineupA2.contains(sub1.text!) || self.lineupA3.contains(sub1.text!) || self.lineupA4.contains(sub1.text!) || self.lineupA6.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupA5.append(sub1.text!)
                for i in self.lineupA5 {
                    print("# \(i)")
                    self.correctServerLeft5.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
    @IBAction func substitutionButtonA6(sender: AnyObject) {
        
        let pretty = lineupA6.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupA1.contains(sub1.text!) || self.lineupA2.contains(sub1.text!) || self.lineupA3.contains(sub1.text!) || self.lineupA4.contains(sub1.text!) || self.lineupA5.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupA6.append(sub1.text!)
                for i in self.lineupA6 {
                    print("# \(i)")
                    self.correctServerLeft6.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
    @IBAction func substitutionButtonB1(sender: AnyObject) {
        
        let pretty = lineupB1.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
            
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupB2.contains(sub1.text!) || self.lineupB3.contains(sub1.text!) || self.lineupB4.contains(sub1.text!) || self.lineupB5.contains(sub1.text!) || self.lineupB6.contains(sub1.text!){
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupB1.append(sub1.text!)
                for i in self.lineupB1 {
                    print("# \(i)")
                    self.correctServerRight1.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    @IBAction func substitutionButtonB2(sender: AnyObject) {
        
        let pretty = lineupB2.prettyPrinted
        print(pretty)
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        
        
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
            
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        // SAVE BUTTON
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            
            
            if self.lineupB1.contains(sub1.text!) || self.lineupB3.contains(sub1.text!) || self.lineupB4.contains(sub1.text!) || self.lineupB5.contains(sub1.text!) || self.lineupB6.contains(sub1.text!) {
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                
                self.lineupB2.append(sub1.text!)
                
                
                for i in self.lineupB2 {
                    print("# \(i)")
                    self.correctServerRight2.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func substitutionButtonB3(sender: AnyObject) {
        
        let pretty = lineupB3.prettyPrinted
        print(pretty)
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupB1.contains(sub1.text!) || self.lineupB2.contains(sub1.text!) || self.lineupB4.contains(sub1.text!) || self.lineupB5.contains(sub1.text!) || self.lineupB6.contains(sub1.text!){
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupB3.append(sub1.text!)
                for i in self.lineupB3 {
                    print("# \(i)")
                    self.correctServerRight3.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
    @IBAction func substitutionButtonB4(sender: AnyObject) {
        
        let pretty = lineupB4.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupB1.contains(sub1.text!) || self.lineupB2.contains(sub1.text!) || self.lineupB3.contains(sub1.text!) || self.lineupB5.contains(sub1.text!) || self.lineupB6.contains(sub1.text!){
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
            } else {
                self.lineupB4.append(sub1.text!)
                for i in self.lineupB4 {
                    print("# \(i)")
                    self.correctServerRight4.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
    @IBAction func substitutionButtonB5(sender: AnyObject) {
        
        let pretty = lineupB5.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            if self.lineupB1.contains(sub1.text!) || self.lineupB2.contains(sub1.text!) || self.lineupB3.contains(sub1.text!) || self.lineupB4.contains(sub1.text!) || self.lineupB6.contains(sub1.text!){
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupB5.append(sub1.text!)
                for i in self.lineupB5 {
                    print("# \(i)")
                    self.correctServerRight5.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
    @IBAction func substitutionButtonB6(sender: AnyObject) {
        
        let pretty = lineupB6.prettyPrinted
        let subAlert =  UIAlertController(title:"already been in: \n \(pretty)", message: "subbing in:",preferredStyle: .Alert)
        subAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "#"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        subAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        subAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (alert: UIAlertAction) in
            
            let sub1 = subAlert.textFields![0] as UITextField;
            
            if self.lineupB1.contains(sub1.text!) || self.lineupB2.contains(sub1.text!) || self.lineupB3.contains(sub1.text!) || self.lineupB4.contains(sub1.text!) || self.lineupB5.contains(sub1.text!) {
                
                let secondAlert =  UIAlertController(title:"Uh oh", message: "this player has already been in the game for someone else!", preferredStyle: .Alert)
                
                secondAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                secondAlert.addAction(UIAlertAction(title: "Ref Override", style: .Default, handler: nil))
                self.presentViewController(secondAlert, animated: true, completion: nil)
                
            } else {
                self.lineupB6.append(sub1.text!)
                for i in self.lineupB6 {
                    print("# \(i)")
                    self.correctServerRight6.text = "\(i)"
                }
            }
        } ))
        self.presentViewController(subAlert, animated: true, completion: nil)
    }
    
     //MARK: TIMEOUT
    
    @IBOutlet var rightFirstTOButtonOutlet: UIButton!
    @IBOutlet var rightSecondTOButtonOutlet: UIButton!
    @IBOutlet var leftFirstTOButtonOutlet: UIButton!
    @IBOutlet var leftSecondTOButtonOutlet: UIButton!
    
    @IBOutlet var leftFirstTO: UILabel!
    @IBOutlet var leftSecondTO: UILabel!
    @IBOutlet var rightFirstTO: UILabel!
    @IBOutlet var rightSecondTO: UILabel!
    
    
    @IBAction func leftFirstTOButton(sender: UIButton) {
        
      leftFirstTOButtonOutlet.hidden = true
        leftFirstTO.text = "score"
    }
    

    
    @IBAction func rightFirstTOButton(sender: UIButton) {
        
        rightFirstTOButtonOutlet.hidden = true
        rightFirstTO.text = "score"
    }

    @IBAction func leftSecondTOButton(sender: UIButton) {
        leftSecondTOButtonOutlet.hidden = true
        leftSecondTO.text = "score"
        
    }
    

    @IBAction func rightSecondTOButton(sender: UIButton) {
        rightSecondTOButtonOutlet.hidden = true
        rightSecondTO.text = "score"
    }
    
    //MARK: MAKING EDITS
    
    
    @IBAction func leftSideScoreEdit(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .Began {
            teamATotalScore.backgroundColor = UIColor.blueColor()
        } else if sender.state == .Ended {
            if TeamAPointsScored.isEmpty == true {
            } else {
                
                TeamAPointsScored.removeLast()
                teamATotalScore.text = "\(TeamAPointsScored.last!)"
                teamATotalScore.backgroundColor = UIColor.clearColor()
                
                if serverA1PointsScoredRound1.isEmpty == true {
                    print("score can't go below 0")
                } else if serverA1PointsScoredRound1.isEmpty == false {
                    
                    if serverA2PointsScoredRound1.isEmpty == false {
                        print("a2 is empty")
                        
                }
                
                
            }
        }
    }
    
                
                
//                if TeamARound1 == true {
//                    if startA1Turn == true {
//                        if serverA1PointsScoredRound1.isEmpty == true {
//                            print("cant go below 0")
//                        } else if serverA1PointsScoredRound1.isEmpty == false {
//                            serverA1PointsScoredRound1.removeLast()
//                            serverA1Label.text = "\(serverA1PointsScoredRound1)"
//                            
//                        }
//                    } else if startA2Turn == true {
//                        if serverA2PointsScoredRound1.isEmpty == true {
//                            serverA1PointsScoredRound1.removeLast()
//                            serverA1Label.text = "\(serverA1PointsScoredRound1)"
//                            serverA2Label.text = ""
//                            
//                        } else if serverA2PointsScoredRound1.isEmpty == false {
//                            serverA2PointsScoredRound1.removeLast()
//                            
//                            if serverA2PointsScoredRound1.isEmpty == true {
//                                serverA2Label.text = ""
//                                
//                            } else {
//                                serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst())"
//                            }
//                            
//                            
//                            serverA2Label.text = "\(teamA2StartingPointRound1) \(serverA2PointsScoredRound1.dropFirst())"
//                        }
//                        
//                        
//                        
//                    } else if startA3Turn == true {
//                        if serverA3PointsScoredRound1.isEmpty == true {
//                            serverA2PointsScoredRound1.removeLast()
//                            serverA2Label.text = "\(serverA2PointsScoredRound1)"
//                            serverA3Label.text = ""
//                            
//                        } else if serverA3PointsScoredRound1.isEmpty == false {
//                            serverA3PointsScoredRound1.removeLast()
//                            if serverA3PointsScoredRound1.isEmpty == true {
//                                serverA3Label.text = ""
//                            } else {
//                            serverA3Label.text = "\(teamA3StartingPointRound1) \(serverA3PointsScoredRound1.dropFirst())"
//                            }
//                        }
//                    } else if startA4Turn == true {
//                        if serverA4PointsScoredRound1.isEmpty == true {
//                            serverA3PointsScoredRound1.removeLast()
//                            serverA3Label.text = "\(serverA3PointsScoredRound1)"
//                            serverA4Label.text = ""
//                            
//                        } else if serverA4PointsScoredRound1.isEmpty == false {
//                            serverA4PointsScoredRound1.removeLast()
//                            serverA4Label.text = "\(teamA4StartingPointRound1) \(serverA4PointsScoredRound1.dropFirst())"
//                        }
//                    } else if startA5Turn == true {
//                        if serverA5PointsScoredRound1.isEmpty == true {
//                            serverA4PointsScoredRound1.removeLast()
//                            serverA4Label.text = "\(serverA4PointsScoredRound1)"
//                            serverA5Label.text = ""
//                            
//                        } else if serverA5PointsScoredRound1.isEmpty == false {
//                            serverA5PointsScoredRound1.removeLast()
//                            serverA5Label.text = "\(teamA5StartingPointRound1) \(serverA5PointsScoredRound1.dropFirst())"
//                        }
//                    } else if startA6Turn == true {
//                        if serverA6PointsScoredRound1.isEmpty == true {
//                            serverA5PointsScoredRound1.removeLast()
//                            serverA6Label.text = ""
//                            serverA5Label.text = "\(serverA5PointsScoredRound1)"
//                        } else if serverA6PointsScoredRound1.isEmpty == false {
//                            serverA6PointsScoredRound1.removeLast()
//                            serverA6Label.text = "\(teamA6StartingPointRound1) \(serverA6PointsScoredRound1.dropFirst())"
//                        }
//                    }
//                    
//                } else if TeamARound2 == true {
//                    if startA1Turn == true {
//                        
//                    } else if startA2Turn == true {
//                        
//                    } else if startA3Turn == true {
//                        
//                    } else if startA4Turn == true {
//                        
//                    } else if startA5Turn == true {
//                        
//                    } else if startA6Turn == true {
//                        
//                    }
//                } else if TeamARound3 == true {
//                    if startA1Turn == true {
//                        
//                    } else if startA2Turn == true {
//                        
//                    } else if startA3Turn == true {
//                        
//                    } else if startA4Turn == true {
//                        
//                    } else if startA5Turn == true {
//                        
//                    } else if startA6Turn == true {
//                        
//                    }
//                    
//                }  else if TeamARound4 == true {
//                    
//                    if startA1Turn == true {
//                        
//                    } else if startA2Turn == true {
//                        
//                    } else if startA3Turn == true {
//                        
//                    } else if startA4Turn == true {
//                        
//                    } else if startA5Turn == true {
//                        
//                    } else if startA6Turn == true {
//                        
//                    }
//                }
//            }
//        }
       //  }

    }
    @IBAction func rightSideScoreEdit(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .Began {
            teamBTotalScore.backgroundColor = UIColor.blueColor()
            
        } else if sender.state == .Ended {
            if TeamBPointsScored.isEmpty == true {
            } else {
                
                TeamBPointsScored.removeLast()
                teamBTotalScore.text = "\(TeamBPointsScored.last!)"
                teamBTotalScore.backgroundColor = UIColor.clearColor()
                
                if TeamBRound1 == true {
                    if startB1Turn == true {
                        if serverB1PointsScoredRound1.isEmpty == true {
                            print("cant go below 0")
                        } else if serverB1PointsScoredRound1.isEmpty == false {
                            serverB1PointsScoredRound1.removeLast()
                            serverB1Label.text = "\(serverB1PointsScoredRound1)"
                            
                        }
                    } else if startB2Turn == true {
                        if serverB2PointsScoredRound1.isEmpty == true {
                            serverB1PointsScoredRound1.removeLast()
                            serverB1Label.text = "\(serverB1PointsScoredRound1)"
                            serverB2Label.text = ""
                        } else if serverB3PointsScoredRound1.isEmpty == false {
                            serverB2PointsScoredRound1.removeLast()
                            serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst())"
                        }
                    } else if startB3Turn == true {
                        if serverB3PointsScoredRound1.isEmpty == true {
                            serverB2PointsScoredRound1.removeLast()
                            serverB2Label.text = "\(serverB2PointsScoredRound1)"
                            serverB3Label.text = ""
                            
                        } else if serverB3PointsScoredRound1.isEmpty == false {
                            serverB3PointsScoredRound1.removeLast()
                            serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst())"
                        }
                    } else if startB4Turn == true {
                        if serverB4PointsScoredRound1.isEmpty == true {
                            serverB3PointsScoredRound1.removeLast()
                            serverB3Label.text = "\(serverB3PointsScoredRound1)"
                            serverB4Label.text = ""
                            
                        } else if serverB4PointsScoredRound1.isEmpty == false {
                            serverB4PointsScoredRound1.removeLast()
                            serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst())"
                        }
                    } else if startB5Turn == true {
                        if serverB5PointsScoredRound1.isEmpty == true {
                            serverB4PointsScoredRound1.removeLast()
                            serverB4Label.text = "\(serverB4PointsScoredRound1)"
                            serverB5Label.text = ""
                            
                        } else if serverB5PointsScoredRound1.isEmpty == false {
                            serverB5PointsScoredRound1.removeLast()
                            serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst())"
                        }
                    } else if startB6Turn == true {
                        if serverB6PointsScoredRound1.isEmpty == true {
                            serverB5PointsScoredRound1.removeLast()
                            serverB6Label.text = ""
                            serverB5Label.text = "\(serverB5PointsScoredRound1)"
                        } else if serverB6PointsScoredRound1.isEmpty == false {
                            serverB6PointsScoredRound1.removeLast()
                            serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst())"
                        }
                    }
                    
                } else if TeamBRound2 == true {
                    if startB1Turn == true {
                        
                        if serverB1PointsScoredRound2.isEmpty == true {
                            serverB6PointsScoredRound1.removeLast()
                            serverB6Label.text = "\(serverB6PointsScoredRound1)"
                            serverB1Label.text = "\(serverB1PointsScoredRound1)"
                        } else if serverB1PointsScoredRound1.isEmpty == false {
                            serverB1PointsScoredRound2.removeLast()
                            serverB1Label.text = "\(serverB1PointsScoredRound1) \(serverB1PointsScoredRound1.dropFirst()) \(teamB1StartingPointRound2) \(serverB1PointsScoredRound2.dropFirst())"
                            
                        }
                        
              
                    
                    } else if startB2Turn == true {
                        if serverB2PointsScoredRound2.isEmpty == true {
                            serverB1PointsScoredRound2.removeLast()
                            serverB1Label.text = "\(serverB1PointsScoredRound1) \(serverB1PointsScoredRound2.dropFirst())"
                            serverB2Label.text = "\(serverB2PointsScoredRound1)"
                        } else if serverB3PointsScoredRound1.isEmpty == false {
                            serverB2PointsScoredRound1.removeLast()
                            serverB2Label.text = "\(teamB2StartingPointRound1) \(serverB2PointsScoredRound1.dropFirst()) \(serverB2PointsScoredRound2.dropFirst())"
                        }
                        
                        
                        
                        
                        
                        
                    } else if startB3Turn == true {
                        if serverB3PointsScoredRound2.isEmpty == true {
                            serverB2PointsScoredRound3.removeLast()
                            serverB2Label.text = "\(serverB2PointsScoredRound1) \(serverB2PointsScoredRound2.dropFirst())"
                            serverB3Label.text = "\(serverB3PointsScoredRound1)"
                            
                        } else if serverB3PointsScoredRound2.isEmpty == false {
                            serverB3PointsScoredRound1.removeLast()
                            serverB3Label.text = "\(teamB3StartingPointRound1) \(serverB3PointsScoredRound1.dropFirst())"
                        }
                        
                        
                        
                        
                        
                    } else if startB4Turn == true {
                        if serverB4PointsScoredRound1.isEmpty == true {
                            serverB3PointsScoredRound1.removeLast()
                            serverB3Label.text = "\(serverB3PointsScoredRound1)"
                            serverB4Label.text = ""
                            
                        } else if serverB4PointsScoredRound1.isEmpty == false {
                            serverB4PointsScoredRound1.removeLast()
                            serverB4Label.text = "\(teamB4StartingPointRound1) \(serverB4PointsScoredRound1.dropFirst())"
                        }
                        
                        
                        
                        
                        
                        
                        
                    } else if startB5Turn == true {
                        if serverB5PointsScoredRound1.isEmpty == true {
                            serverB4PointsScoredRound1.removeLast()
                            serverB4Label.text = "\(serverB4PointsScoredRound1)"
                            serverB5Label.text = ""
                            
                        } else if serverB5PointsScoredRound1.isEmpty == false {
                            serverB5PointsScoredRound1.removeLast()
                            serverB5Label.text = "\(teamB5StartingPointRound1) \(serverB5PointsScoredRound1.dropFirst())"
                        }
                        
                        
                        
                        
                        
                        
                        
                    } else if startB6Turn == true {
                        if serverB6PointsScoredRound1.isEmpty == true {
                            serverB5PointsScoredRound1.removeLast()
                            serverB6Label.text = ""
                            serverB5Label.text = "\(serverB5PointsScoredRound1)"
                        } else if serverB6PointsScoredRound1.isEmpty == false {
                            serverB6PointsScoredRound1.removeLast()
                            serverB6Label.text = "\(teamB6StartingPointRound1) \(serverB6PointsScoredRound1.dropFirst())"
                        }
                    }
                    
                    
                    } else if startB2Turn == true {
                        
                    } else if startB3Turn == true {
                        
                    } else if startB4Turn == true {
                        
                    } else if startB5Turn == true {
                        
                    } else if startB6Turn == true {
                    
             
                
                } else if TeamBRound3 == true {
                    
                        
                    } else if startB2Turn == true {
                        
                    } else if startB3Turn == true {
                        
                    } else if startB4Turn == true {
                        
                    } else if startB5Turn == true {
                        
                    } else if startB6Turn == true {
               
                    
                }  else if TeamBRound4 == true {
                    
                        
                    } else if startB2Turn == true {
                        
                    } else if startB3Turn == true {
                        
                    } else if startB4Turn == true {
                        
                    } else if startB5Turn == true {
                        
                    } else if startB6Turn == true {
                        
                    
                }
            }
        }
    }

}

