//
//  ViewController.swift
//  Direction
//
//  Created by Anna on 11/7/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class ViewController: UIViewController, directionViewControllerDelegate {
    
    @IBOutlet var directionButtonOutlet: [UIButton]!
    
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "directionSegue", sender: sender)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender as? UIButton != nil){
            let navigationController = segue.destination as! UINavigationController
            let directionviewController = navigationController.topViewController as! directionController
            directionviewController.delegate = self
            let senderbutton = sender as! UIButton
            if let buttonTitle = senderbutton.titleLabel!.text {
                directionviewController.direction = buttonTitle
            }

    }
    }
    func backButtonPressed(by controller: directionController) {
        dismiss(animated: true, completion: nil)
    }
    }


