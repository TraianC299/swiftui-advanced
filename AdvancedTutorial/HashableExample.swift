//
//  HashableExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 19.08.2022.
//

import SwiftUI

struct MyModel: Hashable{
    let title:String
    
    func hash(into hasher: inout Hasher){
        hasher.combine(title)
    }
}
struct HashableExample: View {
    let data : [MyModel] = [
        MyModel(title: "ONE"),
        MyModel(title: "TWO"),
        MyModel(title: "THREE"),
        MyModel(title: "FOUR"),
        MyModel(title: "FIVE"),
    ]
    var body: some View {
        ScrollView{
            VStack(spacing: 22){
                //we can use \.self because it is a string array and the string conforms to a protocol name Hashable
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableExample_Previews: PreviewProvider {
    static var previews: some View {
        HashableExample()
    }
}
