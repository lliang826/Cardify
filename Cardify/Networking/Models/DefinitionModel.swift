//
//  DefinitionModel.swift
//  Cardify
//
//  Created by user218033 on 7/7/22.
//

import Foundation

struct DefinitionModel: Codable {
    let word: String
    let meanings: [Meaning]
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [MeaningDefinition]
}

struct MeaningDefinition: Codable {
    let definition: String
    let example: String?
}
