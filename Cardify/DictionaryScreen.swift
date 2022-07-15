//
//  DictionaryScreen.swift
//  Cardify
//
//  Created by user218033 on 7/14/22.
//

import SwiftUI
import Alamofire

struct DictionaryScreen: View {
    
    @State private var items: [DefinitionModel] = []
    @State private var word: String = ""
    
    private let baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Lookup a definition", text: $word)
                .border(Color(UIColor.separator))
                .padding(.leading, 20)
                .padding(.trailing, 40)
                .cornerRadius(15)
            Spacer()
            Button(action: { lookupDefinition(word: self.word) }, label: {
                Text("Search")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(0x5D1049))
                    .cornerRadius(15)
                
            })
                .padding(.leading, 150)
            Spacer()
            List{
                ForEach(items, id: \.self) { item in
                    ForEach(item.meanings, id: \.self) { meaning in
                        ForEach(meaning.definitions, id: \.self) { definition in
                            Text(definition.definition)
                            if let example = definition.example {
                                Text(example)
                                    .italic()
                                    .foregroundColor(Color(0x5D1049))
                                    .padding(.leading, 20)
                            }
                        }
                    }
                }
            }
        }
            .onAppear {
                
            }
    }
    
    func lookupDefinition(word: String) {
        print("lookup")
        
        AF.request(baseURL + word).responseDecodable(of: [DefinitionModel].self) { response in
            switch response.result {
            case .success(let items):
                self.items = items
                print("items: ", self.items)
            case .failure(let error):
                print(String(describing: error))
            }
        }

    }
}

struct DictionaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryScreen()
    }
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}
