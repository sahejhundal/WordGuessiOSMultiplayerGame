//
//  SelectNameView.swift
//  WordSearch
//
//  Created by DON on 1/2/23.
//

import SwiftUI

struct SelectNameView: View {
    @StateObject var homeVM: HomeViewModel
    @State var username: String = ""
    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(.red).ignoresSafeArea()
            VStack {
                Text("Enter username and hit play!").font(.title3).foregroundColor(.yellow).bold().shadow(radius: 2)
                TextField("Username", text: $username)
                    .frame(height: 50)
                    .background(.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22))
                
                WSButton(color: .blue, text: "Let's go!"){
                    homeVM.confirmUsername(username: username)
                }

                    
                    
            }
            .foregroundColor(.white)
        }
        
    }
}
//
//struct SelectNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectNameView()
//    }
//}
