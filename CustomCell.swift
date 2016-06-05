//
//  CustomCell.swift
//  ScoreSheet
//
//  Created by Jayme DeHart on 4/8/16.
//  Copyright © 2016 Straight From DeHart. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tableview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
