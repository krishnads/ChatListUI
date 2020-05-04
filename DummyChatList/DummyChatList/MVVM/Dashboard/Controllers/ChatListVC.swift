//
//  ChatListVC.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 04/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit

class ChatListVC: UIViewController {
  
  @IBOutlet weak var tableViewChatList: UITableView!
  @IBOutlet weak var collectionViewOnlineUsers: UICollectionView!

  lazy var viewModel: ChatListViewModel = {
    return ChatListViewModel()
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigation()
  }
  
  func setupNavigation() {
    self.title = "Contacts"
    self.navigationController?.navigationBar.makeNavigationBarTransparent()
    
    let leftBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
    self.navigationItem.leftBarButtonItem = leftBarButton
    
    let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    self.navigationItem.rightBarButtonItem = rightBarButton

    setupViewController()
  }
  
  func setupViewController() {
    //Load Online users
    viewModel.getOnlineUsers { [unowned self] in
      self.collectionViewOnlineUsers.reloadData()
    }
    
    //Load chat list
    viewModel.getChatListUsers { [unowned self] in
      self.tableViewChatList.reloadData()
    }
  }
}

extension ChatListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.onlineUsersCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineUsersCell", for: indexPath) as! OnlineUsersCell
    if let user = viewModel.getOnlineUserAt(indexPath.row) {
      cell.setupCellWith(user: user)
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 76, height: 76)
  }
}

extension ChatListVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.chatListCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListCell") as! ChatListCell
    if let chat = viewModel.getChatUserAt(indexPath.row) {
      cell.setupCellWith(chat: chat)
    }
    if indexPath.row == 0 {
      cell.labelMessage.text = "Typing..."
      cell.labelMessage.textColor = .blue
    } else {
      cell.labelMessage.textColor = .black
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UIScreen.main.bounds.width * (72.0 / 375.0)
  }
}



