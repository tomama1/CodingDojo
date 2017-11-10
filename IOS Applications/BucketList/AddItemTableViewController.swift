//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by Anna on 11/7/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    weak var delegate: addItemTableViewControllerDelegate?
    
    var item: String?
    
    var indexPath: NSIndexPath?

    @IBOutlet weak var itemTextField: UITextField!
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
