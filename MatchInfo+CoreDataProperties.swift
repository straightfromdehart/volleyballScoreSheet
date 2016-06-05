//
//  MatchInfo+CoreDataProperties.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 5/14/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MatchInfo {

    @NSManaged var date: NSDate?
    @NSManaged var homeTeam: String?
    @NSManaged var homeTeamServes: NSNumber?
    @NSManaged var lineupHome1: NSNumber?
    @NSManaged var lineupHome1PointsScored: NSObject?
    @NSManaged var lineupHome2: NSNumber?
    @NSManaged var lineupHome3: NSNumber?
    @NSManaged var lineupHome4: NSNumber?
    @NSManaged var lineupHome5: NSNumber?
    @NSManaged var lineupHome6: NSNumber?
    @NSManaged var lineupHomeLibero: NSNumber?
    @NSManaged var lineupVisitor1: NSNumber?
    @NSManaged var lineupVisitor2: NSNumber?
    @NSManaged var lineupVisitor3: NSNumber?
    @NSManaged var lineupVisitor4: NSNumber?
    @NSManaged var lineupVisitor5: NSNumber?
    @NSManaged var lineupVisitor6: NSNumber?
    @NSManaged var lineupVisitorLibero: NSNumber?
    @NSManaged var location: String?
    @NSManaged var startingTime: NSDate?
    @NSManaged var visitingTeam: String?
    @NSManaged var visitingTeamServes: NSNumber?
    @NSManaged var fivePoints: NSManagedObject?
    @NSManaged var fourPoints: NSManagedObject?
    @NSManaged var onePoint: NSManagedObject?
    @NSManaged var threePoints: NSManagedObject?
    @NSManaged var twoPoints: NSManagedObject?

}
