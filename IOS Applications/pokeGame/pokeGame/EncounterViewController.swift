//
//  EncounterViewController.swift
//  pokeGame
//
//  Created by Anna on 11/14/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit

class EncounterViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate : TownViewController?
    var player = [Player]()
    var pokemon = [Pokemon]()
    
    var wildpokemon : wildpokemon?

    var nopestr = "Nope, you can't fight it"
    
    
    @IBOutlet weak var wildpokemonImg: UIImageView!
    @IBOutlet weak var wildpokemonTitle: UILabel!
    @IBOutlet weak var wildpokemonLevel: UILabel!
    @IBOutlet weak var wildpokemonHealth: UIView!
    
    @IBOutlet weak var mypokemonImg: UIImageView!
    @IBOutlet weak var mypokemonTitle: UILabel!
    @IBOutlet weak var mypokemonLevel: UILabel!
    @IBOutlet weak var mypokemonHealth: UIView!
    
    
    @IBAction func fightButtonPressed(_ sender: UIButton) {
        loadAlert()
    }
    
    
    @IBAction func runButtonPressed(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomPokeLevel = arc4random_uniform(23)+2
        fetchpp()
        grabimg()
        grabwildimg()
        mypokemonTitle.text = pokemon[0].name
        mypokemonLevel.text = "L:"+String(describing: Int(pokemon[0].level))
        
        wildpokemonTitle.text = wildpokemon?.name
        wildpokemonLevel.text = "L:"+String(describing: Int(randomPokeLevel))

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func fetchpp() {
        do {
            self.player = try managedObjectContext.fetch(Player.fetchRequest()) as [Player]
        } catch {
            print("error finding player")
        }
        do {
            self.pokemon = try managedObjectContext.fetch(Pokemon.fetchRequest()) as [Pokemon]
        } catch {
            print("error finding pokemon")
        }
    }

    func grabimg() {
        let mypokemonURL = URL(string: pokemon[0].img!)
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: mypokemonURL!) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    let imageData = data
                    DispatchQueue.main.async {
                        self.mypokemonImg.image = UIImage(data: imageData!)
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }

            }
        }
        downloadPicTask.resume()
        
    }
    
    func grabwildimg() {
        let mypokemonURL = URL(string: (wildpokemon?.img!)!)
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: mypokemonURL!) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        DispatchQueue.main.async {
                            self.wildpokemonImg.image = UIImage(data: imageData)
                        }
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
        
    }

    func loadAlert(){
        let alertController = UIAlertController(title: "Nope", message: nopestr, preferredStyle: .alert)
        
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Go Back", style: .cancel) { (_) in }
        
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    

}
