//
//  HomeScreen.swift
//  Cardify
//
//  Created by user218033 on 7/16/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject private var studySetModel: StudySetModel
    @EnvironmentObject var notifier: EventMessenger
    
    var body: some View {
        Text("Study Sets")
            .padding(.leading, -10)
        List {
            ForEach(studySetModel.studySets, id: \.self) { s in
                Button(s.title) {
                    notifier.studySet = s
                }
            }
            .onDelete(perform: delete)
        }
        .listStyle(PlainListStyle())
        .padding(.leading, -20)
    }
    
    func delete(at offsets: IndexSet) {
        for i in offsets {
            studySetModel.remove(id: studySetModel.studySets[i].id)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().environmentObject(StudySetModel.shared)
    }
}
