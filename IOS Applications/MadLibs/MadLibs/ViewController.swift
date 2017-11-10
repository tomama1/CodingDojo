//
//  ViewController.swift
//  MadLibs
//
//  Created by Anna on 11/7/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var libs : [String]?
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "madSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! madLibTableViewController
    }

    
    
    @IBAction func toMainView(_ sender: UIStoryboardSegue) {
        let source = sender.source
        if source is madLibTableViewController {
            if let senderVC = source as? madLibTableViewController {
                textLabel.text = "We are having a perfectly \(senderVC.input1.text!) time now. Later we will \(senderVC.input2.text!) and \(senderVC.input3.text!) in the \(senderVC.input4.text!)."
            }
        }
    }
    
}

