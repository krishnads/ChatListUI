//
//  ContactManager.swift
//  DummyChatList
//
//  Created by Krishna Datt Shukla on 05/05/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation
import Contacts

class ContactsManager {
  

  static func fetchPhoneContacts() -> [CNContact] {
    var contacts = [CNContact]()
    let contactStore = CNContactStore()
    let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey] as [CNKeyDescriptor]

    let request = CNContactFetchRequest(keysToFetch: keysToFetch)
    contacts = [CNContact]()
    do {
      try contactStore.enumerateContacts(with: request) {
            (contact, stop) in
            // Array containing all unified contacts from everywhere
          contacts.append(contact)
        }
    }
    catch {
        print("unable to fetch contacts")
    }

    return contacts
  }
}
