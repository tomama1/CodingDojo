//
//  ViewController.swift
//  BucketList
//
//  Created by Anna on 11/7/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, addItemTableViewControllerDelegate {

    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [BucketListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addEditItemSegue", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addEditItemSegue", sender: indexPath)
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        do {
            let itemscopy = try managedObjectContext.fetch(BucketListItem.fetchRequest()) as [BucketListItem]
            itemscopy.forEach({
                item in
                if item.text! == items[indexPath.row].text{
                    managedObjectContext.delete(item)
                    do {
                        try managedObjectContext.save()
                        print("success")
                    } catch  {
                        print("Error")
                    }
                    
                }
                
            })
        } catch {
            print("errors")
        }
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender == nil {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
        }
        else if segue.identifier == "addEditItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
            

            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableController.item = item.text
            addItemTableController.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {

            items[ip.row].text = text
            
            do {
                try managedObjectContext.save()
                print("success")
            } catch  {
                print("Error")
            }
            
        } else {
            let newitem = BucketListItem(context: managedObjectContext)
            newitem.text = text
            items.append(newitem)
            
            do {
                try managedObjectContext.save()
                print("success")
            } catch  {
                print("Error")
            }
            
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    
    func fetchAllItems(){
        do {
            self.items = try managedObjectContext.fetch(BucketListItem.fetchRequest()) as [BucketListItem]
            items.forEach({
                item in
                print(item.text!)
                
            })
        } catch {
            print("errors")
        }

    }
    
}

