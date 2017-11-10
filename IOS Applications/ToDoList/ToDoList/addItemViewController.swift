//
//  addItemViewController.swift
//  ToDoList
//
//  Created by Anna on 11/10/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import CoreData


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

struct listitem{
    var title : String?
    var date : String?
    var detail: String?
    var checked: Bool?
}

class addItemViewController: UIViewController {

    weak var delegate : ViewControllerDelegate?

    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var detailTextField: UITextField!
    
    @IBOutlet weak var dateField: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let myDate = dateField.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from:myDate)
    
        
        let addedlistitem = listitem(title: titleTextField.text, date: dateString, detail: detailTextField.text, checked: true)
        delegate?.submitButtonPressed(by: self, with: addedlistitem)

    }
    


}
