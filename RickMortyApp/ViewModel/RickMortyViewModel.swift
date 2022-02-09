//
//  RickMortyViewModel.swift
//  RickMortyApp
//
//  Created by Selcuk on 8.02.2022.
//

import Foundation

protocol RickMortyDelegate: AnyObject {
    func getRick()
    func getMorty()
    func getAll()
}
 class RickMortyViewModel {
    
    weak var delegate: RickMortyDelegate?
     
    
    var rick = [Result]()
    var morty = [Result]()
    var allCharacter = [Result]()
    // fetch and filter only Rick
    func getRick(completion: @escaping ([Result]?) ->()){
        Network.shared.apollo.fetch(query: GetRickQuery(),cachePolicy: .fetchIgnoringCacheCompletely){
            
            result in switch result{
            case .failure(let error):
                print("hata alıdı \(error.localizedDescription)")
                completion(nil)
            case.success(let rick):
                let model = rick.data?.characters?.decodeModel(type: CharacterResponse.self)
                completion(model?.results)
                print(model)
                //anydesk
            }
        }
    }
     
     func getMorty(completion: @escaping ([Result]?) ->()){
         Network.shared.apollo.fetch(query: GetMortyQuery(),cachePolicy: .fetchIgnoringCacheCompletely){
             result in switch result{
             case .failure(let error):
                 print("hata alıdı \(error.localizedDescription)")
                 completion(nil)
             case.success(let morty):
                 let model = morty.data?.characters?.decodeModel(type: CharacterResponse.self)
                 completion(model?.results)
                 print(model)
             }
         }
     }
    
     func getAll(completion: @escaping ([Result]?) ->()){
         Network.shared.apollo.fetch(query:GetCharacterQuery(),cachePolicy: .fetchIgnoringCacheCompletely){
             result in switch result{
             case .failure(let error):
                 print("hata alıdı \(error.localizedDescription)")
                 completion(nil)
             case.success(let allCharacter):
                 let model = allCharacter.data?.characters?.decodeModel(type: CharacterResponse.self)
                 completion(model?.results)
                 print(model)
             }
         }
     }
}
