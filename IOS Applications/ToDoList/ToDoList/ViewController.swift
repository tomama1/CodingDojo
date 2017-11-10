//
//  ViewController.swift
//  ToDoList
//
//  Created by Anna on 11/9/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class TableViewController: UITableViewController, ViewControllerDelegate {

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [ListItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()

    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addItemSegue", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! todoListCell
        cell.titleLabel?.text = items[indexPath.row].title
        cell.dateLabel?.text = items[indexPath.row].date
        cell.detailLabel?.text = items[indexPath.row].details
        cell.checkmark.isHidden = items[indexPath.row].checked
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath) as! todoListCell
        if cell.checkmark.isHidden == false {
            cell.checkmark.isHidden = true
            items[indexPath.row].checked = true
            
        } else if cell.checkmark.isHidden == true {
            cell.checkmark.isHidden = false
            items[indexPath.row].checked = false
        }
        do {
            try managedObjectContext.save()
            print("success")
        } catch  {
            print("Error")
        }

    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        do {
            let itemscopy = try managedObjectContext.fetch(ListItems.fetchRequest()) as [ListItems]
            itemscopy.forEach({
                item in
                if item.details! == items[indexPath.row].details{
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
    
    func submitButtonPressed(by controller: addItemViewController, with addedListItem: listitem){
        
        let newitem = ListItems(context: managedObjectContext)
        newitem.title = addedListItem.title
        newitem.checked = addedListItem.checked!
        newitem.details = addedListItem.detail
        newitem.date = addedListItem.date
        items.append(newitem)
        do {
            try managedObjectContext.save()
            print("success")
        } catch  {
            print("Error")
        }
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addItemTableController = segue.destination as! addItemViewController
        addItemTableController.delegate = self
    }

    func fetchAllItems(){
        do {
            self.items = try managedObjectContext.fetch(ListItems.fetchRequest()) as [ListItems]
        } catch {
            print("errors")
        }
        
    }
    func deleteAllItems(){
        do {
            let itemscopy = try managedObjectContext.fetch(ListItems.fetchRequest()) as [ListItems]
            itemscopy.forEach({
                item in
                    managedObjectContext.delete(item)
                    items = []
                    do {
                        try managedObjectContext.save()
                        print("success")
                    } catch  {
                        print("Error")
                    }
            })
        } catch {
            print("errors")
        }
    }

}

