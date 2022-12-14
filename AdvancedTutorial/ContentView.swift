//
//  ContentView.swift
//  AdvancedTutorial
//
//  Created by Traian on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isComplete:Bool = false
    var body: some View {
        Text(isComplete ? "Complete" : "Not completed")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? .green : .gray)
            .cornerRadius(10)
            .onLongPressGesture(minimumDuration: 1.0,perform: {
                isComplete.toggle()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
