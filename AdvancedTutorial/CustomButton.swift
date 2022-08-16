//
//  CustomButton.swift
//  Tutorial
//
//  Created by Traian on 10.08.2022.
//

import SwiftUI

struct CustomButton: View {
    @State var title:String
    var clicked: (() -> Void) /// use closure for callback
    var body: some View {
        Button("\(title)"){
            clicked()
        }
        .padding()
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .onTapGesture {
            
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Hello") {
            
        }
    }
}
