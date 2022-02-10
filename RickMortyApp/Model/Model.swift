//
//  Model.swift
//  RickMortyApp
//
//  Created by Selcuk on 8.02.2022.
//

import Foundation

struct CharacterResponse: Decodable{
    var results: [Result]
}
struct Result: Decodable{
    let name: String
    let location: Location?
    let id: String
    let image:String
}
struct Location:Decodable{
    var name: String
}
