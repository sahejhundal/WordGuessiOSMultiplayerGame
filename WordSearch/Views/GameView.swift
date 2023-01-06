//
//  ContentView.swift
//  Test
//
//  Created by DON on 1/4/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var homeVM: HomeViewModel
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                HStack{
                    withAnimation {
                        Text(homeVM.shownWord)
                            .font(.system(size: 300, weight: .heavy, design: .monospaced))
                            .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                            .animation(.default, value: homeVM.shownWord)
                    }
                }
                .frame(height: 300)
                
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("Leaderboard").font(.title2).bold().opacity(0.5)
                            VStack(alignment: .leading, spacing: 4){
                                let sortedLeaderboard = homeVM.roomLeaderboard.sorted {
                                    return $0.value > $1.value
                                }
                                ForEach(Array(sortedLeaderboard), id: \.key){ key, value in
                                    HStack{
                                        Circle().foregroundColor(.orange)
                                            .frame(width: 10)
                                        Text(key).bold()
                                        Spacer()
                                        Text(String(value)).bold().fontDesign(.monospaced)
                                    }
                                }
                                .animation(.default, value: homeVM.roomLeaderboard)
                            }
                            
                        }
                        .frame(width: geometry.size.width * 0.35)
                        
                        VStack(alignment: .trailing){
                            Text("Feed").font(.title2).bold().opacity(0.5)
                            ScrollView{
                                VStack(alignment: .trailing){
                                    ForEach(homeVM.messages.reversed(), id: \.self){ message in
                                        Text(message).bold().opacity(0.5)
                                            .font(.system(size: 14))
                                    }
                                    .animation(.default, value: homeVM.messages)
                                }
                                .multilineTextAlignment(.trailing)
                            }
                            .frame(maxHeight: 150)
                        }
                    }
                    
                }
                
                
                Spacer()
                
                HStack{
                    TextField("Guess one letter or the whole word...", text: $homeVM.userEntry)
                        .autocorrectionDisabled()
                        .multilineTextAlignment(.center)
                    Button {
                        homeVM.sendGuess()
                    } label: {
                        ZStack{
                            Circle().foregroundColor(.green).opacity(0.8)
                                .frame(width: 40, height: 40)
                            Image(systemName: "checkmark").foregroundColor(.white)
                        }
                    }

                }
                
                
            }
            .padding()
        }
        
    }
}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
