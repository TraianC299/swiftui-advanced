//
//  GeometryReaderExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 16.08.2022.
//

import SwiftUI
//using the geometry reader we can get the size of any element that is inside it, but it is very expensive
struct GeometryReaderExample: View {
    func getProcentage(geo: GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        let result = 1 - (currentX / maxDistance)
        return Double(result)
    }
    
    var body: some View {
     
        
    
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 10)
                            .padding()
                            .rotation3DEffect(Angle(degrees:getProcentage(geo:geometry) * 20), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width:300, height:250)

                    
                }
            }
        }
        
        
//        GeometryReader { geometry in
//            HStack(spacing:0){
//
//                Rectangle()
//                    .fill(Color.red)
//
//                    .frame(width:geometry.size.width*0.6666666)
//                Rectangle()
//                    .fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
        
        
    }
}

struct GeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
