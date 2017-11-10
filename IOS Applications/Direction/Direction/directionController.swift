//
//  directionController.swift
//  Direction
//
//  Created by Anna on 11/7/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class directionController: UIViewController {

    
    weak var delegate : directionViewControllerDelegate?
    
    
    @IBOutlet weak var directionLabel: UILabel!
    
    var direction: String?
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.backButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        directionLabel.text = direction

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
