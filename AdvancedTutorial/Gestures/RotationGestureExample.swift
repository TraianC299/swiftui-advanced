//
//  RotationGestureExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 15.08.2022.
//

import SwiftUI

struct RotationGestureExample: View {
    @State var angle: Angle = Angle(degrees: 0)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .cornerRadius(10)
            .background(.green)
            .rotationEffect(angle)
            .gesture(
            RotationGesture()
                .onChanged({ value in
                    angle = value
                })
                .onEnded({ value in
                    withAnimation(.spring()) {
                        angle = Angle(degrees: 0)
                    }
                })
            )
    }
}

struct RotationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureExample()
    }
}
