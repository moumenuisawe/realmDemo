//
//  lineCell.swift
//  realmDemo
//
//  Created by moumen isawe on 2/6/19.
//  Copyright © 2019 moumen. All rights reserved.
//

import UIKit

class lineCell: UITableViewCell {

    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func cinfugure(with pickUpLine:PickUpLine)  {
        lineLabel.text = pickUpLine.line
        scoreLabel.text = pickUpLine.scoreString()
        emailLabel.text = pickUpLine.email
    }
}
