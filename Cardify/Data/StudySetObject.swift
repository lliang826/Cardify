//
//  StudySetObject.swift
//  Cardify
//
//  Created by user218033 on 7/10/22.
//

import Foundation
import RealmSwift

class StudySetObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var content = List<String>()
}
