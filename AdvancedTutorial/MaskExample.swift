//
//  MaskExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 16.08.2022.
//

import SwiftUI

struct MaskExample: View {
    @State var rating: Int = 3
    var body: some View {
        ZStack{
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    private var overlayView: some View{
        GeometryReader(content: { geometry in
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width:geometry.size.width/5*CGFloat(rating))
        })
        //pointer events none
        .allowsHitTesting(false)
    }
    private var starsView: some View{
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(index <= rating ? Color.yellow : .gray)
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                        
                    }
            }
            
        }
    }
}

struct MaskExample_Previews: PreviewProvider {
    static var previews: some View {
        MaskExample()
    }
}
