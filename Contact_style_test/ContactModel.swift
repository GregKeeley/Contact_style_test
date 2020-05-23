//
//  ContactModel.swift
//  Contact_style_test
//
//  Created by Gregory Keeley on 5/21/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import Contacts


class CustomContact {
    let firstName: String
    let lastName: String
    let workEmail: String
    var identifier: String?
    var storedContact: CNMutableContact?
    var phoneNumberField: (CNLabeledValue<CNPhoneNumber>)?
    //Note: If a property is constant, so created with let, you have to initialize it in place or in the init method, even if it is an Optional.
    init(firstName: String, lastName: String, workEmail: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.workEmail = workEmail
    }
    static func defaultContacts() -> [CustomContact] {
        return [
            CustomContact(firstName: "Greg", lastName: "Keeley", workEmail: "Greg@greg.com"),
            CustomContact(firstName: "Meghan", lastName: "Calderone", workEmail: "Whatever@gmail.com"),
            CustomContact(firstName: "Earl", lastName: "Pearl", workEmail: "BeautifulBirdie@yahoo.com")
        ]
    }
}

extension CustomContact: Equatable {
    static func ==(lhs: CustomContact, rhs: CustomContact) -> Bool{
        return lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.workEmail == rhs.workEmail
    }
}
extension CustomContact {
    var contactValue: CNContact {
        let contact = CNMutableContact()
        contact.givenName = firstName
        contact.familyName = lastName
        contact.emailAddresses = [CNLabeledValue(label: CNLabelHome, value: workEmail as NSString)]
        if let phoneNumberField = phoneNumberField {
            contact.phoneNumbers.append(phoneNumberField)
        }
        return contact.copy() as! CNContact
    }
    //convenience initializer: A convenience initializer is a secondary initializer that must call a designated initializer of the same class. It is useful when you want to provide default values or other custom setup. A class does not require convenience initializers.
    convenience init?(contact: CNContact) {
        guard let email = contact.emailAddresses.first else { return nil }
        let firstName = contact.givenName
        let lastName = contact.familyName
        let workEmail = email.value as String
        self.init(firstName: firstName, lastName: lastName, workEmail: workEmail)
        if let contactPhone = contact.phoneNumbers.first {
            phoneNumberField = contactPhone
        }
    }
}
