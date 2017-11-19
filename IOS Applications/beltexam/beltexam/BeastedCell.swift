//
//  BeastedCell.swift
//  beltexam
//
//  Created by Anna on 11/17/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class BeastedCell: UITableViewCell {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
