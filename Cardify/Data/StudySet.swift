//
//  StudySet.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit

//struct StudySet {
//    var title: String
//    var content: [(question: String, answer: String)] = []
//}

class StudySet: Hashable, ObservableObject {
    static func == (lhs: StudySet, rhs: StudySet) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.content == rhs.content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(content)
    }
    
    var id: String
    var title: String
    var content: [String] = []

    init(studySetObject: StudySetObject) {
        self.id = studySetObject.id.stringValue
        self.title = studySetObject.title
        self.content = Array(studySetObject.content)
    }
}
