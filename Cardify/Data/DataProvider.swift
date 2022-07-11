////
////  DataPRovider.swift
////  Cardify
////
////  Created by user218033 on 6/19/22.
////
//
//import UIKit
//
//class DataProvider {
//
//    static var sets: [StudySet] = []
//
//    static func addData(title: String, content: [(String, String)] = []) {
//        sets.append(
//            StudySet(title: title, content: content)
//        )
//    }
//
//    static func printData() {
//        print(sets)
//    }
//
//    static func makeData() -> [StudySet] {
//
//        sets.append(
//            StudySet(
//                title: "Software Design Patterns",
//                content: [
//                    (question: "What are the 3 types of design patterns", answer: "creational, structural, behavioral"),
//                    (question: "chain of responsibility", answer: "instead of having multiple if else statements, " +
//                     "we can have multiple Handler classes (which all implement from an AbstractHandler interface) " +
//                     "to process the request and pass it on to the next Handler in the chain"),
//                    (question: "decorator", answer: "structural design pattern that attaches new behaviors to objects" +
//                     "with special wrapper objects"),
//                    (question: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor consequat elit, a mattis nulla tempor ac. Nunc porttitor eros vel diam ultrices, a mattis eros pulvinar. Nunc ac justo ligula. Donec a sapien nisi. Phasellus a elit sem. Nulla id nunc ut quam tincidunt mollis in a dolor. Cras lacus dolor, dictum eu magna vel, auctor congue mi. Suspendisse potenti. Donec mattis imperdiet ligula ut auctor. Nullam scelerisque mauris luctus, ornare magna vel, sodales nisl. Nulla volutpat ipsum ut nisl sagittis, id ultricies turpis malesuada. Curabitur sed purus a lorem vestibulum hendrerit. Etiam sem odio, ullamcorper et urna eu, porttitor aliquam mi. Sed vulputate, magna ac venenatis vestibulum, erat purus consectetur tortor, sit amet tristique justo sapien in magna. Donec vel nisl id ex ornare volutpat.", answer: "Lorem ipsum"),
//                ]
//            )
//        )
//
//        sets.append(
//            StudySet(
//                title: "French Verbs",
//                content: [
//                    (question: "Definition for verb 'aller'", answer: "to go"),
//                    (question: "Manger, 1st person plural, present tense", answer: "nous mangeons"),
//                    (question: "ils parlent", answer: "to talk, 3rd person plural, masculine"),
//
//                ]
//            )
//        )
//
//        sets.append(
//            StudySet(
//                title: "Test",
//                content: [
//                    (question: "a", answer: "1"),
//                    (question: "b", answer: "2"),
//                    (question: "c", answer: "3"),
//                    (question: "d", answer: "4"),
//                    (question: "e", answer: "5"),
//
//                ]
//            )
//        )
//
//        return sets
//    }
//}
