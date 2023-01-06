//
//  SelectRoomView.swift
//  WordSearch
//
//  Created by DON on 1/4/23.
//

import SwiftUI

struct SelectRoomView: View {
    @StateObject var homeVM: HomeViewModel
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle().foregroundColor(.yellow).ignoresSafeArea()
                
                VStack {
                    Text("Word Search")
                        .font(.system(size: 30, weight: .black, design: .serif))

                    Spacer()
                }
                .padding(.top, 40)
                
                
                VStack{
                    Text("Enter room code or leave blank")
                        .padding()
                        .fontDesign(.monospaced)
                        .shadow(radius: 3)
                    VStack(alignment: .center){
                        TextField("Room Code", text: $homeVM.roomCode)
                            .background(.white)
                            .frame(width: 140)
                            .font(.system(size: 40, design: .monospaced))
                    }
                    .padding(.bottom, 15)
                    WSButton(color: .red, text: "Join"){
                        homeVM.joinRoom()
                    }
                }
            }
        }
        .onAppear{
            homeVM.initHandshake()
        }
    }
}

//struct SelectRoomView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectRoomView()
//    }
//}
