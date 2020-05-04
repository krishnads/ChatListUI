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
  @IBOutlet weak var viewContainerOnlineStatus: UIView!
  @IBOutlet weak var viewOnlineStatus: UIView!
  
  override func awakeFromNib() {
    imageViewUser.setCornerRadius(25.0)
    viewContainerOnlineStatus.setCornerRadius(9.0)
    viewOnlineStatus.setCornerRadius(5.0)
  }
  
  func setupCellWith(user: OnlineUsers) {
    viewContainerOnlineStatus.isHidden = user.userOnlineStatus ?? false
    imageViewUser.image = user.userImage
  }
}
