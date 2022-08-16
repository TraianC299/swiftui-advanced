//
//  ScrollViewReaderExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 15.08.2022.
//

import SwiftUI

struct ScrollViewReaderExample: View {
    @State var chosenValue: Int  = 0
    var body: some View {
        VStack {
            CustomButton(title: "Go to 49") {
                withAnimation(.spring()) {
                    chosenValue = 49
                }
                
            }
            ScrollView{
                ScrollViewReader { proxy in
                    ForEach(1..<100) { element in
                        Text("This is item: #\(element)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(element)
                    }
                    .onChange(of: chosenValue) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(chosenValue, anchor: .center)
                        }
                        
                    }
                }
                
                
            }
        }
//        ScrollView{
//            ScrollViewReader { proxy in
//                CustomButton(title: "Go to 49") {
//                    withAnimation(.spring()) {
//                        proxy.scrollTo(49, anchor: .center)
//                    }
//
//                }
//                ForEach(1..<100) { element in
//                    Text("This is item: #\(element)")
//                        .font(.headline)
//                        .frame(height: 200)
//                        .frame(maxWidth: .infinity)
//                        .background(.white)
//                        .cornerRadius(10)
//                        .shadow(radius: 10)
//                        .padding()
//                        .id(element)
//                }
//            }
//
//        }
    }
}

struct ScrollViewReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderExample()
    }
}
