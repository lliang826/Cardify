//
//  NetworkingLayerAF.swift
//  Cardify
//
//  Created by user218033 on 7/7/22.
//

import Foundation
import Alamofire
import Combine

class NetworkingLayerAF {
        
    private let baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    private var task: Cancellable? = nil
    
    @Published var items: [DefinitionModel] = []
    
    init(word: String) {
        self.getAllDefinitions(word: word)
    }
    
    
    
    private func getAllDefinitions(word: String) {
//        self.task = AF.request(self.baseURL + word, method: .get, parameters: nil)
//            .publishDecodable(type: [DefinitionModel].self)
//            .sink(receiveCompletion: { (completion) in
//                switch completion {
//                case .finished:
//                    ()
//                case .failure(let error):
//                    print(String(describing: error))
//                }
//            }, receiveValue: { [weak self ](response) in
//                switch response.result {
//                case .success(let model):
//                    self?.items = model.map { DefinitionModel(from: <#Decoder#>) }
//                case.failure(let error):
//                    print(String(describing: error))
//                }
//            })
        
        AF.request(baseURL + word).responseDecodable(of: [DefinitionModel].self) { (response) in
            switch response.result {
            case .success(let items):
                print(items)
                self.items = items
                print("network done")
            case.failure(let error):
                print(String(describing: error))
            }
        }
    }
}
