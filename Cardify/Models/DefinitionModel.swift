//
//  DefinitionModel.swift
//  Cardify
//
//  Created by user218033 on 7/7/22.
//

import Foundation

struct DefinitionModel: Codable, Hashable {
    let word: String
    let meanings: [Meaning]
}

struct Meaning: Codable, Hashable {
    let partOfSpeech: String
    let definitions: [MeaningDefinition]
}

struct MeaningDefinition: Codable, Hashable {
    let definition: String
    let example: String?
}
