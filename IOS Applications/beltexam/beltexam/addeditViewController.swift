//
//  addeditViewController.swift
//  beltexam
//
//  Created by Anna on 11/17/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}


protocol unBeastedDelegate: class{
    func donebuttonPressed(by controller: addeditViewController, with title: String, at indexPath: NSIndexPath?)
}


class addeditViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var delegate: unBeastedDelegate?
    
    var tempTitle: String?
    
    var indexPath: NSIndexPath?
    
    
    @IBAction func backbuttonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "backSegue", sender: nil)
    }
    
    
    @IBAction func donebuttonPressed(_ sender: UIBarButtonItem) {
        let beastTitle = textField.text
        delegate?.donebuttonPressed(by: self, with: beastTitle!, at: indexPath)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = tempTitle
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
