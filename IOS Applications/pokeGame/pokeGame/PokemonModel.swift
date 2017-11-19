//
//  PokemonModel.swift
//  pokeGame
//
//  Created by Anna on 11/14/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import Foundation


class PokemonModel {
    
    static func getAllPokemon(url: String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
}
