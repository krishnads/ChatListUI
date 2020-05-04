//
//  ChatListViewModel.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 04/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation

class ChatListViewModel {
  private var arrayOnlineUsers: [OnlineUsers]?
  private var arrayChatList: [ChatList]?
  
  var onlineUsersCount: Int {
    return arrayOnlineUsers?.count ?? 0
  }
  
  var chatListCount: Int {
    return arrayChatList?.count ?? 0
  }
  
  func getOnlineUserAt(_ index: Int) -> OnlineUsers? {
    if let users = arrayOnlineUsers, users.count > index  {
      return users[index]
    }
    return nil
  }
  
  func getChatUserAt(_ index: Int) -> ChatList? {
    if let users = arrayChatList, users.count > index  {
      return users[index]
    }
    return nil
  }

  func getOnlineUsers(completion: @escaping (() -> Void)) {
    arrayOnlineUsers = [OnlineUsers]()
    for i in 0...50 {
      var user = OnlineUsers()
      user.userOnlineStatus = (i % 2) != 0 ? true : false
      user.userImage = (i % 2) == 0 ? #imageLiteral(resourceName: "user1") : #imageLiteral(resourceName: "user2")
      arrayOnlineUsers?.append(user)
    }
  }
  
  func getChatListUsers(completion: @escaping (() -> Void)) {
    arrayChatList = [ChatList]()
    
    let contacts = ContactsManager.fetchPhoneContacts()
    if contacts.count > 0 {
      for i in 0..<contacts.count {
        let contact = contacts[i]
        var user = ChatList()
        user.userName = contact.givenName
        user.userOnlineStatus = (i % 2) != 0 ? true : false
        user.userImage = (i % 2) == 0 ? #imageLiteral(resourceName: "user1") : #imageLiteral(resourceName: "user2")
        user.unreadCount = (i % 2) == 0 ? 4 : 7
        user.time = (i % 2) == 0 ? "Now" : "Yesterday"
        user.message = (i % 2) == 0 ? "What to do?" : "Let's meet tomowrrow"
        arrayChatList?.append(user)
      }
    } else {
      for i in 0...100 {
        var user = ChatList()
        user.userName = (i % 2) != 0 ? "Krishna" : "Akhil"
        user.userOnlineStatus = (i % 2) != 0 ? true : false
        user.userImage = (i % 2) == 0 ? #imageLiteral(resourceName: "user1") : #imageLiteral(resourceName: "user2")
        user.unreadCount = (i % 2) == 0 ? 4 : 7
        user.time = (i % 2) == 0 ? "Now" : "Yesterday"
        user.message = (i % 2) == 0 ? "What to do?" : "Let's meet tomowrrow"
        arrayChatList?.append(user)
      }
    }
  }
  
}
