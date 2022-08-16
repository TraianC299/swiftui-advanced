//
//  LongTapGestureExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 15.08.2022.
//

import SwiftUI

struct LongTapGestureExample: View {
    @State var isComplete:Bool = false

    var body: some View {
        Text(isComplete ? "Complete" : "Not completed")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? .green : .gray)
            .cornerRadius(10)
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, perform: {
                isComplete.toggle()
            })
    }
}

struct LongTapGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        LongTapGestureExample()
    }
}
