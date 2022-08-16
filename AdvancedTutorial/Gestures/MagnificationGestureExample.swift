//
//  MagnificationGestureExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 15.08.2022.
//

import SwiftUI

struct MagnificationGestureExample: View {
    @State var currentAmmount: CGFloat = 0

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .cornerRadius(10)
            .background(.green)
            .scaleEffect(1 + currentAmmount)
            .gesture(
                MagnificationGesture()
                    .onChanged({ value in
                        currentAmmount = value - 1
                    })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            currentAmmount = 0
                        }
                        
                    })
            )
    }
}

struct MagnificationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureExample()
    }
}
