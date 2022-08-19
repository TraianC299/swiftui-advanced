//
//  ArrayMethodsExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 19.08.2022.
//

import SwiftUI


struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name:String
    let point: Int
    let verified:Bool
}



class ArrayModificationViewModel: ObservableObject{
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray : [UserModel] = []
    @Published var mappedArray : [String] = []

    init(){
        getUsers()
        updateFilteredArray()
    }
    
    
    
    func updateFilteredArray(){
        //sort
        /*filteredArray = dataArray.sorted { user1, user2 in
            return user1.point > user2.point
        }*/
        
        //filter
        filteredArray = dataArray.filter({ user in
            return user.point>50
        })
        
        //map
        /*mappedArray = dataArray.map({ user in
            user.name
        })*/
        
        //compact map - if user name is nil wont give an error
        /*mappedArray = dataArray.compactMap({ user in
            user.name
        })*/
        
    }
    
    func getUsers(){
        let user1 = UserModel(name: "Grigore", point: 2, verified: true)
        let user2 = UserModel(name: "Vieru", point: 2322, verified: true)
        let user3 = UserModel(name: "Salam", point: 232, verified: false)
        let user4 = UserModel(name: "Florin", point: 222, verified: true)
        let user5 = UserModel(name: "Becure", point: 23, verified: false)
        let user6 = UserModel(name: "Bingo", point: 21, verified: true)
        dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6
        ])
    }
}
struct ArrayMethodsExample: View {
    @StateObject var arrayModificationViewModel = ArrayModificationViewModel()
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                ForEach(arrayModificationViewModel.filteredArray) { user in
                    HStack{
                        VStack(alignment:.leading) {
                            Text(user.name)
                                .font(.title2)
                            
                            Text("Points: \(user.point)")
                        }
                        Spacer()
                        if(user.verified){
                            Image(systemName: "flame.fill")
                        }
                    }
                    .padding()
                    .background(.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    
                }
            }
            .padding()

        }
    }
}

struct ArrayMethodsExample_Previews: PreviewProvider {
    static var previews: some View {
        ArrayMethodsExample()
    }
}
