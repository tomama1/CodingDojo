//
//  CustomCell.swift
//  CustomCell
//
//  Created by Anna on 11/9/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//
import UIKit
import Foundation

class CustomCell: UITableViewCell {
    
    var delegate: CustomCellsViewController?
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftBUtton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func plusPressed(_ sender: UIButton) {
        delegate?.plusPressed(sender: self.rightLabel.text!)
    }
    
    @IBAction func subPressed(_ sender: UIButton) {
        delegate?.subPressed(sender: self.rightLabel.text!)
    }
    
}
