//
//  BeastedTableViewController.swift
//  beltexam
//
//  Created by Anna on 11/17/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit



class BeastedTableViewController: UITableViewController{
    

    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [Beasted]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchall()
        self.tableView.reloadData()
    }

    
    func fetchall(){
        do {
            self.items = try managedObjectContext.fetch(Beasted.fetchRequest()) as [Beasted]
        } catch {
            print("errors")
        }
        
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

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        do {
            let itemscopy = try managedObjectContext.fetch(Beasted.fetchRequest()) as [Beasted]
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


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beastedCell", for: indexPath) as! BeastedCell
        cell.titleLabel?.text = items[indexPath.row].title
        cell.dateLabel?.text = items[indexPath.row].date
        return cell

    }




}
