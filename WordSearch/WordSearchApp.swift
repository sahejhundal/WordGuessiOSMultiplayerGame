//
//  WordSearchApp.swift
//  WordSearch
//
//  Created by DON on 1/2/23.
//

import SwiftUI

@main
struct WordSearchApp: App {
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(homeVM: homeVM)
        }
    }
}
