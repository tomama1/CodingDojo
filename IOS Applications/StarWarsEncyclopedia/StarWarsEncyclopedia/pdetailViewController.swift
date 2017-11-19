//
//  pdetailViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Anna on 11/14/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class pdetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var massLabel: UILabel!
    
    var delegate: PeopleTableViewController?
    
    var detailstruct = pstruct(name: "", gender: "", byear: "", mass: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = detailstruct.name
        genderLabel.text = detailstruct.gender
        yearLabel.text = detailstruct.byear
        massLabel.text = detailstruct.mass

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
