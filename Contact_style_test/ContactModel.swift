//
//  ContactModel.swift
//  Contact_style_test
//
//  Created by Gregory Keeley on 5/21/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

struct CustomContact {
    let name: String
    let email: String
    let dob: Date
    
    static func getTestData() -> [CustomContact] {
        let contact1 = CustomContact.init(name: "Gregory", email: "greg@greg.com", dob: Date())
        let contact2 = CustomContact.init(name: "Meghan", email: "Whatever@gmail.com", dob: Date())
        let contact3 = CustomContact.init(name: "Earl", email: "bird@gmail.com", dob: Date())
        let testData = [contact1, contact2, contact3]
        return testData
    }
}
