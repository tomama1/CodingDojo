//
//  unBeastedTableViewController.swift
//  beltexam
//
//  Created by Anna on 11/17/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import CoreData




class unBeastedTableViewController: UITableViewController, unBeastedDelegate, cellDelegate {

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [Beast]()

    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unBeastedCell", for: indexPath) as! unBeastedCell
        cell.titleLabel?.text = items[indexPath.row].title
        cell.indexpath = indexPath as NSIndexPath
        cell.delegate = self
        return cell
    }
    
    func fetchAllItems(){
        do {
            self.items = try managedObjectContext.fetch(Beast.fetchRequest()) as [Beast]
        } catch {
            print("errors")
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("got here")
        performSegue(withIdentifier: "editSegue", sender: indexPath)

    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        do {
            let itemscopy = try managedObjectContext.fetch(Beast.fetchRequest()) as [Beast]
            itemscopy.forEach({
                item in
                if item.title! == items[indexPath.row].title{
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

    func donebuttonPressed(by controller: addeditViewController, with title: String, at indexPath: NSIndexPath?){
        if let ip = indexPath {
            items[ip.row].title = title
            
            do {
                try managedObjectContext.save()
                print("success")
            } catch  {
                print("Error")
            }
            
        } else {
            let newitem = Beast(context: managedObjectContext)
            newitem.title = title
            items.append(newitem)
            do {
                try managedObjectContext.save()
                print("success")
            } catch  {
                print("Error")
            }
        }
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func beastButtonPressed(by controller: unBeastedCell, with title: String, at indexPath: NSIndexPath?){
        do {
            let itemscopy = try managedObjectContext.fetch(Beast.fetchRequest()) as [Beast]
            itemscopy.forEach({
                item in
                if item.title! == items[indexPath!.row].title{
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
        items.remove(at: indexPath!.row)
        tableView.reloadData()
        
        let newitem = Beasted(context: managedObjectContext)
        newitem.title = title

        let myDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMMM dd"
        let dateString = dateFormatter.string(from:myDate)
        newitem.date = dateString
        do {
            try managedObjectContext.save()
            print("success")
        } catch  {
            print("Error")
        }
        

        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! addeditViewController
            controller.delegate = self
        }
        else if segue.identifier == "editSegue" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! addeditViewController
            controller.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            controller.tempTitle = item.title
            controller.indexPath = indexPath
        }

    }
}
