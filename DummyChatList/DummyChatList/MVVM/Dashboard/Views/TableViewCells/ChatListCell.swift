//
//  ChatListCell.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 05/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit

class ChatListCell: UITableViewCell {
  
  @IBOutlet weak var imageViewUser: UIImageView!
  @IBOutlet weak var imageViewOnlineStatus: UIImageView!

  @IBOutlet weak var labelUserName: UILabel!
  @IBOutlet weak var labelMessage: UILabel!
  @IBOutlet weak var labelTime: UILabel!
  @IBOutlet weak var labelUnreadCount: UILabel!

  
  override func awakeFromNib() {
    super.awakeFromNib()
    imageViewUser.setCornerRadius(40.0)
    labelUnreadCount.setCornerRadius(15.0)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setupCellWith(chat: ChatList) {
    imageViewOnlineStatus.isHidden = chat.userOnlineStatus ?? false
    imageViewUser.image = chat.userImage
    labelUserName.text = chat.userName ?? ""
    labelMessage.text = chat.message ?? ""
    labelTime.text = chat.time ?? ""
    labelUnreadCount.text = "\(chat.unreadCount ?? 0)"
  }

}
