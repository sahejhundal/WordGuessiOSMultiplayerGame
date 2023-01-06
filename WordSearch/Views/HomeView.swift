//
//  HomeView.swift
//  WordSearch
//
//  Created by DON on 1/2/23.
//

import SwiftUI

struct WSButton: View{
    let color: Color
    let text: String
    var handler: (() -> Void)
    var body: some View{
        Button(action: handler){
            Text(text)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 250)
                .background(color)
                .cornerRadius(10)
                .font(.system(size: 20, weight: .black))
            
        }
    }
}

struct HomeView: View {
    @StateObject var homeVM: HomeViewModel
    var body: some View {
        switch homeVM.state{
        case .unnamed:
            SelectNameView(homeVM: homeVM)
        case .selectingRoom:
            SelectRoomView(homeVM: homeVM)
        case .inLobby:
            GameView(homeVM: homeVM)
        case .loading:
            LoadingScreen()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeVM: HomeViewModel())
    }
}
