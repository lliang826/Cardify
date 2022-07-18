//
//  FlashCardScreen.swift
//  Cardify
//
//  Created by user218033 on 7/17/22.
//

import SwiftUI

struct FlashCardScreen: View {
    
    @EnvironmentObject private var studySetModel: StudySetModel
    @EnvironmentObject var notifier: EventMessenger
    @EnvironmentObject var studySet: StudySet
//    @EnvironmentObject var id: String
    
    var body: some View {
        List{
            ForEach(studySetModel.findStudySet(id: studySet.id)!.content, id: \.self) { content in
                let pair = content.components(separatedBy: "@")
                VStack {
                    Text("Front")
                        .listRowSeparator(.hidden)
                        .font(.system(size: 12))
                    Text(pair[0])
                        .listRowSeparator(.hidden)
                        .padding()
                        .border(Color(0x5D1049))
                    Text("Back")
                        .listRowSeparator(.hidden)
                        .font(.system(size: 12))
                    Text(pair[1])
                        .listRowSeparator(.hidden)
                        .padding()
                        .border(Color(0x5D1049))
                    CustomDivider()
                }
            }
            .onDelete(perform: delete)
        }
        .padding(.leading, -20)
        
        .onAppear {
            
        }
    }
    
    func delete(at offsets: IndexSet) {
        for i in offsets {
            let studySet = studySetModel.findStudySet(id: studySet.id)
            studySetModel.removeContent(id: self.studySet.id, content: studySet!.content[i])
        }
    }
}

struct FlashCardScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardScreen()
    }
}

struct CustomDivider: View {
    let color: Color = Color(0xE30425)
    let height: CGFloat = 3
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
