//
//  PickASide.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 4/21/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit


enum StickyEdge: Int {
    case Top = 0
    case Bottom


}


class PickASide: UIDynamicBehavior {
   
    private var edgeInset: CGFloat
    private let itemBehavior: UIDynamicItemBehavior
    private let collisionBehavior: UICollisionBehavior
    private let item: UIDynamicItem
    private let fieldBehaviors = [
        UIFieldBehavior.springField(),
        UIFieldBehavior.springField()
    ]
    init(item: UIDynamicItem, edgeInset: CGFloat) {
        self.item = item
        self.edgeInset = edgeInset
        collisionBehavior = UICollisionBehavior(items: [item])
        collisionBehavior.translatesReferenceBoundsIntoBoundary =
        true
        itemBehavior = UIDynamicItemBehavior(items: [item])
        itemBehavior.density = 0.1
        itemBehavior.resistance = 8
        itemBehavior.friction = 0.9
        itemBehavior.allowsRotation = false
        super.init()
        addChildBehavior(collisionBehavior)
        addChildBehavior(itemBehavior)
        for fieldBehavior in fieldBehaviors {
            fieldBehavior.addItem(item)
            addChildBehavior(fieldBehavior)
        }
    }
    
    func updateFieldsInBounds(bounds: CGRect) {
        //1
        guard bounds != CGRect.zero else { return }
        let h = bounds.height
        let w = bounds.width
        let itemHeight = item.bounds.height
        let itemWidth = item.bounds.width
        //2
        func updateRegionForField(field: UIFieldBehavior, _ point: CGPoint) {
           
            let size = CGSize(width: bounds.width * 0.65,
                              height: bounds.height)
            
            field.position = point
            
            field.region = UIRegion(size: size)
        }
        //3

         let left  = CGPoint(x: w * 0.15, y: h * 0.25)
         let right = CGPoint(x: w * 0.85, y: h * 0.25)
        //4
        updateRegionForField(fieldBehaviors[StickyEdge.Top.rawValue],
                             left)
        updateRegionForField(
            fieldBehaviors[StickyEdge.Bottom.rawValue], right)
    }
    
    var isEnabled = true {
        didSet {
            if isEnabled {
                for fieldBehavior in fieldBehaviors {
                    fieldBehavior.addItem(item)
                }
                collisionBehavior.addItem(item)
                itemBehavior.addItem(item)
            } else {
                for fieldBehavior in fieldBehaviors {
                    fieldBehavior.removeItem(item)
                }
                collisionBehavior.removeItem(item)
                itemBehavior.removeItem(item)
            }
        }
    }
    
    func addLinearVelocity(velocity: CGPoint) {
        itemBehavior.addLinearVelocity(velocity, forItem: item)
    }
    
    
}
