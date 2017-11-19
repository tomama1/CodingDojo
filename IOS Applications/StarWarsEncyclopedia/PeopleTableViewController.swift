//
//  PeopleTableViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Anna on 11/13/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

struct pstruct{
    var name: String
    var gender: String
    var byear: String
    var mass: String
}

class PeopleTableViewController: UITableViewController, pdetailViewControllerDelegate {
    
    var people = [String]()
    var peoplestructs = [pstruct]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getAPI(url: "http://swapi.co/api/people")
        
        }
    
    func getAPI(url: String){
        StarWarsModel.getAllPeople(url: url, completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.people.append(personDict["name"] as! String)
                            
                            
                            let newstruct = pstruct(name: personDict["name"] as! String, gender: personDict["gender"] as! String, byear: personDict["birth_year"] as! String, mass: personDict["mass"] as! String)
                            
                            self.peoplestructs.append(newstruct)
                            
                        }
                    }
                    if (jsonResult["next"] as? NSNull) != nil {
                    }
                    else{
                        self.getAPI(url: jsonResult["next"] as! String)
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         // Create a generic cell
         let cell = UITableViewCell()
         // set the default cell label to the corresponding element in the people array
         cell.textLabel?.text = people[indexPath.row]
         // return the cell so that it can be rendered
         return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetailsSegue", sender: peoplestructs[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let senderstruct = sender as? pstruct {
        let controller = segue.destination as! pdetailViewController
        controller.delegate = self

        controller.detailstruct = senderstruct
        }
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
