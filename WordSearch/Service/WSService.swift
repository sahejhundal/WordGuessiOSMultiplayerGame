////
////  WSService.swift
////  WordSearch
////
////  Created by DON on 1/4/23.
////
//
//import Foundation
//import SocketIO
//
//final class WSService: ObservableObject{
//    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
//    
//    @Published var messages = [String]()
//    @Published var roomLeaderboard : [String: Int] = [:]
//    @Published var shownWord : String = "*****"
//    
//    init(){
//        let socket = manager.defaultSocket
//        socket.on(clientEvent: .connect){ (data, ack) in
//            print("Connected")
//            socket.emit("hello", "iOS Client")
//        }
//        socket.on("wsmessage"){ [weak self] (data, ack) in
//            print("wsmessage recieved")
//            if let data = data[0] as? [String: String], let rawMessage = data["msg"]{
//                DispatchQueue.main.async {
//                    self?.messages.append(rawMessage)
////                    print(self?.messages as Any)
//                }
//            }
//        }
//        socket.on("roomLeaderboard"){ [weak self] (data, ack) in
//            print("roomLeaderboard recieved")
//            if let data = data[0] as? [String: Int]{
//                DispatchQueue.main.async {
//                    self?.roomLeaderboard = data
//                    print("Room leaderboard recieved from socket")
//                    print(self?.roomLeaderboard as Any)
//                }
//            }
//        }
//        socket.on("roomInfo"){ [weak self] (data, ack) in
//            print("roomInfo recieved")
//            if let data = data[0] as? [String: String], let code = data["code"], let shownWord = data["shownWord"] {
//                DispatchQueue.main.async {
//                    self?.shownWord = shownWord
//                    print("Room info recieved from socket", code, shownWord)
////                    print(self?.messages as Any)
//                }
//            }
//        }
//        socket.connect()
//        
//    }
//    
//    func doHandshake(username: String){
//        let socket = manager.defaultSocket
//        socket.emit("setUsername",username)
//    }
//    
//    func joinRoom(room: String){
//        manager.defaultSocket.emit("joinRoom", room)
//    }
//    
//    
//}
