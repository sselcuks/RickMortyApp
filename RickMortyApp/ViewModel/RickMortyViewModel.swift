//
//  RickMortyViewModel.swift
//  RickMortyApp
//
//  Created by Selcuk on 8.02.2022.
//

protocol RickMortyDelegate: AnyObject {
    func requestSuccess()
}
final class RickMortyViewModel {
    
    weak var delegate: RickMortyDelegate?
    // filter from graphql
    func getRick(completion: @escaping ([Result]?) ->()){
        Network.shared.apollo.fetch(query: GetRickQuery(),cachePolicy: .fetchIgnoringCacheCompletely){
            result in switch result {
            case .failure(let error):
                print("hata alındı \(error.localizedDescription)")
                completion(nil)
            case.success(let rick):
                let model = rick.data?.characters?.decodeModel(type: CharacterResponse.self)
                completion(model?.results)
            }
            self.delegate?.requestSuccess()
        }
    }
    
    func getMorty(completion: @escaping ([Result]?) ->()){
        Network.shared.apollo.fetch(query: GetMortyQuery(),cachePolicy: .fetchIgnoringCacheCompletely){
            result in switch result {
            case .failure(let error):
                print("hata alındı \(error.localizedDescription)")
                completion(nil)
            case.success(let morty):
                let model = morty.data?.characters?.decodeModel(type: CharacterResponse.self)
                
                completion(model?.results)
            }
            self.delegate?.requestSuccess()
        }
    }
    
    func getAll(completion: @escaping ([Result]?) ->()){
        Network.shared.apollo.fetch(query:GetCharacterQuery(),cachePolicy: .fetchIgnoringCacheCompletely){
            result in switch result{
            case .failure(let error):
                print("hata alındı \(error.localizedDescription)")
                completion(nil)
            case.success(let allCharacter):
                let model = allCharacter.data?.characters?.decodeModel(type: CharacterResponse.self)
                completion(model?.results)
                
            }
            self.delegate?.requestSuccess()
        }
    }
}
