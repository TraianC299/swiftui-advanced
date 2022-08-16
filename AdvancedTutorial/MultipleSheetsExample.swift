//
//  MultipleSheetsExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 16.08.2022.
//

import SwiftUI


struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
struct MultipleSheetsExample: View {
    @State var selectedModel:RandomModel? = nil
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(1..<20) { index in
                    CustomButton(title: "Button\(index)") {
                        selectedModel = RandomModel(title: "TITLE \(index)")
                    }
                }
              
            }
        }
        
        //the content for sheet is created as soon as the scrren loads
        //this completion of sheet will trigger the sheet every time the selectedModel changes
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View{
    let selectedModel:RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct MultipleSheetsExample_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsExample()
    }
}
