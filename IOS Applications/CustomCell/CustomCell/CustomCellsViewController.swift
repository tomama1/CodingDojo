//
//  ViewController.swift
//  CustomCell
//
//  Created by Anna on 11/9/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class CustomCellsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nums = 1
    var total = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        totalLabel.text = "Total:"+" "+String(total)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16 // your number of cell here
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // your cell coding
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.rightLabel.text = String(describing: Decimal(nums)*pow(10,indexPath.row))
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        cell.contentView.layer.borderWidth = 1
        cell.delegate = self
        return cell
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }
    
    func plusPressed(sender: String){
        let num = Int(sender)
        total = total + num!
        totalLabel!.text = "Total:"+" "+String(total)
        
    }
    func subPressed(sender: String){
        let num = Int(sender)
        total = total - num!
        totalLabel!.text = "Total:"+" "+String(total)
    }
}

