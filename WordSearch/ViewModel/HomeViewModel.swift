//
//  HomeViewModel.swift
//  WordSearch
//
//  Created by DON on 1/2/23.
//

import Foundation
import SocketIO

final class HomeViewModel: ObservableObject{
    @Published var errorString: String = ""
    @Published var myUsername: String = ""
    @Published var roomCode: String = ""
    @Published var messages = [String]()
    @Published var roomLeaderboard : [String: Int] = [:]
    @Published var shownWord : String = "WORD"
    @Published var state: ViewState
    @Published var userEntry: String = ""
    
    
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
    
    
    init(){
        self.state = .unnamed
        let socket = manager.defaultSocket
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
            socket.emit("hello", "iOS Client")
        }
        socket.on("wsmessage"){ [weak self] (data, ack) in
            print("wsmessage recieved")
            if let data = data[0] as? [String: String], let rawMessage = data["msg"]{
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
//                    print(self?.messages as Any)
                }
            }
        }
        socket.on("wordWasGuessed"){ [weak self] (data, ack) in
            print("wordWasGuessed recieved")
            if let data = data[0] as? [String: String], let rawMessage = data["word"]{
                DispatchQueue.main.async {
                    self?.shownWord = rawMessage
//                    print(self?.messages as Any)
                }
            }
        }
        socket.on("roomLeaderboard"){ [weak self] (data, ack) in
            print("roomLeaderboard recieved")
            if let data = data[0] as? [String: Int]{
                DispatchQueue.main.async {
                    self?.roomLeaderboard = data
                    print("Room leaderboard recieved from socket")
                    print(self?.roomLeaderboard as Any)
                }
            }
        }
        socket.on("roomInfo"){ [weak self] (data, ack) in
            print("roomInfo recieved")
            if let data = data[0] as? [String: String], let code = data["code"], let shownWord = data["shownWord"] {
                DispatchQueue.main.async {
                    self?.shownWord = shownWord
                    self?.state = .inLobby
                    print("Room info recieved from socket", code, shownWord)
//                    print(self?.messages as Any)
                }
            }
        }
        socket.connect()
        
    }
    
    func sendGuess(){
        manager.defaultSocket.emit("wordGuess", userEntry)
        DispatchQueue.main.async {
            self.userEntry = ""
        }
        
    }
    
    func initHandshake(){
        manager.defaultSocket.emit("setUsername",myUsername)
    }
    
    func joinRoom(){
        manager.defaultSocket.emit("joinRoom", roomCode)
        DispatchQueue.main.async {
            self.state = .loading
        }
    }
    
    func confirmUsername(username: String){
        if username == ""{
            return
        }
        DispatchQueue.main.async {
            self.myUsername = username
            self.state = .selectingRoom
        }
    }
}
