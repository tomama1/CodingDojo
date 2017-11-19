//
//  ViewController.swift
//  pokeGame
//
//  Created by Anna on 11/14/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import CoreData

struct coords{
    var topleft : (x: Double, y: Double)
    var topright: (x: Double, y: Double)
    var botleft : (x: Double, y: Double)
    var botright : (x: Double, y: Double)
}

struct wildpokemon{
    var name : String?
    var img : String?
    var level : Double?
    var health : Double?
}

class TownViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var player = [Player]()
    var pokemon = [Pokemon]()
    
    var wildpokemonlist = [wildpokemon]()
    
    @IBOutlet weak var playerimg: UIImageView!
    
    @IBOutlet weak var grassView: UIView!
    
    @IBOutlet weak var roadView: UIView!
    
    var grassViewc : coords?
    var roadViewc : coords?
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        print(playerimg.frame.origin.x, playerimg.frame.origin.y)
        if Double(playerimg.frame.origin.y) <= grassViewc!.topleft.y{
        }
        else{
            self.playerimg.frame.origin.y = self.playerimg.frame.origin.y - 15
            if Double(playerimg.frame.origin.y) <= grassViewc!.botleft.y - 15{
                print(playerimg.frame.origin.y, grassViewc!.botleft.y)
                encounter()
            }
        }

    }

    @IBAction func rightButtonPressed(_ sender: UIButton) {
        print(playerimg.frame.origin.x, playerimg.frame.origin.y)
        if Double(playerimg.frame.origin.x)+30 >= grassViewc!.topright.x{
        }
        else{
            self.playerimg.frame.origin.x = self.playerimg.frame.origin.x + 15
            if Double(playerimg.frame.origin.y) <= grassViewc!.botleft.y {
                encounter()
            }

        }
    }
    
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        print(playerimg.frame.origin.x, playerimg.frame.origin.y)
        if Double(playerimg.frame.origin.x)-15 <= 0{
        }
        else{
            self.playerimg.frame.origin.x = self.playerimg.frame.origin.x - 15
            if Double(playerimg.frame.origin.y) <= grassViewc!.botleft.y {
                encounter()
            }

        }
    }
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        print(playerimg.frame.origin.x, playerimg.frame.origin.y)
        if Double(playerimg.frame.origin.y)+45 >= roadViewc!.botleft.y{
        }
        else{
            self.playerimg.frame.origin.y = self.playerimg.frame.origin.y + 15
            if Double(playerimg.frame.origin.y) <= grassViewc!.botleft.y {
                encounter()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grassViewc = grabCoords(view: grassView)
        roadViewc = grabCoords(view: roadView)
        playerimg.frame.origin.x = 167.0
        playerimg.frame.origin.y = 302.0
        fetchpp()
        for i in 10...30{
            getAPI(url: "http://pokeapi.co/api/v2/pokemon/"+String(i), index: i)
        }

    }
    
    func grabCoords(view: UIView) -> coords{
        let botleft = (x: Double(view.frame.origin.x), y: Double(view.frame.origin.y + view.frame.size.height))
        let botright = (x: Double(view.frame.origin.x + view.frame.size.width), y: Double(view.frame.origin.y+view.frame.size.height))
        let topleft = (x: Double(view.frame.origin.x), y: Double(view.frame.origin.y))
        let topright = (x: Double(view.frame.origin.x + view.frame.size.width), y: Double(view.frame.origin.y))
        return coords(topleft: topleft, topright: topright, botleft: botleft, botright: botright)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAPI(url: String, index: Int){
        PokemonModel.getAllPokemon(url: url, completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let name = jsonResult["forms"] as? NSArray {
                        if let pokename = name[0] as? NSDictionary{
                            let newpokemon = wildpokemon(name: pokename["name"] as! String, img: "http://pokeapi.co/media/img/"+String(index)+".png", level: 0, health: 0)
                            self.wildpokemonlist.append(newpokemon)
                            print("pokemon appended")
                            }
                        }
                    }

                } catch {
                print("Something went wrong")
            }
        })

        
    }


    
    func encounter() {
        
        let randomNm: UInt32 = arc4random_uniform(8)
        let randompokenum: UInt32 = arc4random_uniform(UInt32(self.wildpokemonlist.count-2))+1
        if randomNm == 1{
            performSegue(withIdentifier: "encounterSegue", sender: wildpokemonlist[Int(randompokenum)])
        }
    }
    
    func fetchpp() {
        do {
            self.player = try managedObjectContext.fetch(Player.fetchRequest()) as [Player]
            if self.player.count == 0{
                let newplayer = Player(context: managedObjectContext)
                newplayer.name = "Player1"
                newplayer.x = Double(playerimg.frame.origin.x)
                newplayer.y = Double(playerimg.frame.origin.y)
                player.append(newplayer)
            }
        } catch {
            print("error finding player")
        }
        do {
            self.pokemon = try managedObjectContext.fetch(Pokemon.fetchRequest()) as [Pokemon]
            if self.pokemon.count == 0{
                let newpokemon = Pokemon(context: managedObjectContext)
                newpokemon.name = "bulbasaur"
                newpokemon.img = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
                newpokemon.level = 5
                newpokemon.health = 100
            }
        } catch {
            print("error finding pokemon")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderstruct = sender as? wildpokemon {
            let controller = segue.destination as! EncounterViewController
            controller.delegate = self
            controller.wildpokemon = senderstruct
        }
    }

}

