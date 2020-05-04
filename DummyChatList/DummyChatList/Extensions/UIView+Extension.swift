//
//  UIView+Extension.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 05/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func setCornerRadius(_ radius: CGFloat) {
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
  }
}
