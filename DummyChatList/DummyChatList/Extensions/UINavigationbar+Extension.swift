//
//  UINavigationbar+Extension.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 05/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
  
  func makeNavigationBarTransparent() {
    self.shadowImage = UIImage()
    self.backgroundColor = .clear
    self.setBackgroundImage(UIImage(), for: .default)
    self.isTranslucent = true
  }
}
