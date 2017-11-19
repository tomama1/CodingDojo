//
//  unBeastedCell.swift
//  beltexam
//
//  Created by Anna on 11/17/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit


protocol cellDelegate: class{
    func beastButtonPressed(by controller: unBeastedCell, with title: String, at indexPath: NSIndexPath?)
}

class unBeastedCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    var indexpath : NSIndexPath?
    var delegate : cellDelegate?
    
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        delegate?.beastButtonPressed(by: self, with: titleLabel.text!, at: indexpath!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
