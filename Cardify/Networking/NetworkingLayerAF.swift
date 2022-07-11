//
//  NetworkingLayerAF.swift
//  Cardify
//
//  Created by user218033 on 7/7/22.
//

import Foundation
import Alamofire

class NetworkingLayerAF {
    
    let baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    var items: [DefinitionModel] = []
    
    func getAllDefinitions(word: String) {
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
