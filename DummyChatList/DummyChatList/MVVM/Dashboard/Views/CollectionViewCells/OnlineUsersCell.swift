//
//  OnlineUsersCell.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 05/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit

class OnlineUsersCell: UICollectionViewCell {
    
  @IBOutlet weak var imageViewUser: UIImageView!
  @IBOutlet weak var imageViewOnlineStatus: UIImageView!

  override func awakeFromNib() {
    imageViewUser.setCornerRadius(30.0)
  }
  
  func setupCellWith(user: OnlineUsers) {
    imageViewOnlineStatus.isHidden = user.userOnlineStatus ?? false
    imageViewUser.image = user.userImage
  }
}
