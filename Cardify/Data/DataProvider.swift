//
//  DataPRovider.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit

class DataProvider {
    
    static func makeData() -> [StudySet] {
        var sets: [StudySet] = []
        
        sets.append(
            StudySet(
//                set: ["Software Design Patterns":
//                        [
//                            (question: "What are the 3 types of design patterns", answer: "creational, structural, behavioral"),
//                            (question: "chain of responsibility", answer: "instead of having multiple if else statements, " +
//                             "we can have multiple Handler classes (which all implement from an AbstractHandler interface) " +
//                             "to process the request and pass it on to the next Handler in the chain"),
//                            (question: "decorator", answer: "structural design pattern that attaches new behaviors to objects" +
//                             "with special wrapper objects"),
//                        ]
//                     ]
                title: "Software Design Patterns",
                content: [
                    (question: "What are the 3 types of design patterns", answer: "creational, structural, behavioral"),
                    (question: "chain of responsibility", answer: "instead of having multiple if else statements, " +
                     "we can have multiple Handler classes (which all implement from an AbstractHandler interface) " +
                     "to process the request and pass it on to the next Handler in the chain"),
                    (question: "decorator", answer: "structural design pattern that attaches new behaviors to objects" +
                     "with special wrapper objects"),
                ]
            )
        )
        
        sets.append(
            StudySet(
                title: "French Verbs",
                content: [
                    (question: "Definition for verb 'aller'", answer: "to go"),
                    (question: "Manger, 1st person plural, present tense", answer: "nous mangeons"),
                    (question: "ils parlent", answer: "to talk, 3rd person plural, masculine"),

                ]
            )
        )

        sets.append(
            StudySet(
                title: "Test",
                content: [
                    (question: "a", answer: "1"),
                    (question: "b", answer: "2"),
                    (question: "c", answer: "3"),
                ]
            )
        )
        
        return sets
    }
}
