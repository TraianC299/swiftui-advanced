//
//  DragGestureExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 15.08.2022.
//

import SwiftUI

struct DragGestureExample: View {
    @State var offset: CGSize = .zero
    
    func getScale() -> CGFloat {
        let max = UIScreen.main.bounds.width/2
        let currentAmmount = abs(offset.width)
        let percentage = currentAmmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotation() -> Double {
        let max = UIScreen.main.bounds.width/2
        let currentAmmount = offset.width
        let percentageAsDouble = Double(currentAmmount / max)
        let maxAngle:Double = 10.0
        return percentageAsDouble * maxAngle
    }
    var body: some View {
        ZStack {
            VStack{
                Text("\(getRotation())")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScale())
                .rotationEffect(Angle(degrees: getRotation()))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()){
                                offset = value.translation

                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()){
                                offset = .zero

                            }
                        })
            )
        }
    }
}

struct DragGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureExample()
    }
}
