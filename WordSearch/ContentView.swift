//
//  ContentView.swift
//  WordSearch
//
//  Created by DON on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeVM: HomeViewModel
    var body: some View {
        HomeView(homeVM: homeVM)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
