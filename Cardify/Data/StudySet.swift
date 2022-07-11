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

struct StudySet {
    var id: String
    var title: String
    var content: [String] = []

    init(studySetObject: StudySetObject) {
        self.id = studySetObject.id.stringValue
        self.title = studySetObject.title
        self.content = Array(studySetObject.content)
    }
}
