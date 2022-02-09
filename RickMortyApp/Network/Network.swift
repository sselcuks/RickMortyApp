//
//  Network.swift
//  RickMortyApp
//
//  Created by Selcuk on 8.02.2022.
//

import Foundation
import Apollo

struct Network {
    static var shared = Network()
    lazy var apollo: ApolloClient = {
       let url = URL(string: "https://rickandmortyapi.com/graphql")!
        return ApolloClient(url: url)
    }()
}
