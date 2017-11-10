//
//  todoListCell.swift
//  ToDoList
//
//  Created by Anna on 11/9/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class todoListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var checkmark: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
